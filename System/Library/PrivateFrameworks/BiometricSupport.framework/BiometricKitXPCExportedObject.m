@implementation BiometricKitXPCExportedObject

- (id)client:(unint64_t)a3
{
  BiometricKitXPCExportedObject *v4;
  NSMutableDictionary *clients;
  void *v6;
  void *v7;

  v4 = self;
  objc_sync_enter(v4);
  clients = v4->_clients;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

- (void)getProtectedConfigurationForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getProtectedConfigurationForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 1372;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      -[BiometricKitXPCServer getProtectedConfigurationForUser:withClient:](self->_server, "getProtectedConfigurationForUser:withClient:", v6, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 1371;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 1364;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 0;
  }
  v8[2](v8, v12);

}

- (int)clientEntitlement
{
  return self->_clientEntitlement;
}

- (id)entitlementsNeededForPermissionGroup:(int)a3
{
  if (a3 > 7)
    return CFSTR("(unknown)");
  else
    return off_24D241288[a3];
}

- (BOOL)legacyAllowlisted:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
    v4 = objc_msgSend(&unk_24D24AFB0, "containsObject:", v3);
  else
    v4 = 0;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_INFO, "Client %@ allowlisted=%d\n", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (BOOL)isClient:(unint64_t)a3 entitled:(int)a4 forMethod:(const char *)a5
{
  uint64_t v6;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v6 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x24BDAC8D0];
  switch(a4)
  {
    case 0:
      return 1;
    case 1:
      if (!-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement"))
        goto LABEL_18;
      break;
    case 2:
      if ((-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement") & 4) == 0)
        goto LABEL_18;
      break;
    case 3:
      if ((-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement") & 8) == 0)
        goto LABEL_18;
      break;
    case 4:
      if ((-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement") & 0x10) == 0)
        goto LABEL_18;
      break;
    case 5:
      if ((-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement") & 0x20) == 0)
        goto LABEL_18;
      break;
    case 6:
      if ((-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement") & 0x40) == 0)
        goto LABEL_18;
      break;
    case 7:
      goto LABEL_18;
    default:
      if (__osLog)
        v9 = __osLog;
      else
        v9 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v20 = 67109120;
        LODWORD(v21) = v6;
        _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "Unexpected value %d of permission group\n", (uint8_t *)&v20, 8u);
      }
LABEL_18:
      if (isInternalBuild())
      {
        -[BiometricKitXPCExportedObject client:](self, "client:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[BiometricKitXPCExportedObject clientEntitlement](self, "clientEntitlement") != 1)
        {
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (__osLog)
            v12 = __osLog;
          else
            v12 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = v12;
            -[BiometricKitXPCExportedObject connection](self, "connection");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "processIdentifier");
            -[BiometricKitXPCExportedObject entitlementsNeededForPermissionGroup:](self, "entitlementsNeededForPermissionGroup:", v6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138413058;
            v21 = v11;
            v22 = 1024;
            v23 = v15;
            v24 = 2080;
            v25 = a5;
            v26 = 2112;
            v27 = v16;
            _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "Client %@ with PID %d calls %s which needs entitlement '%@'.\n", (uint8_t *)&v20, 0x26u);

          }
          -[BiometricKitXPCExportedObject server](self, "server");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "reporter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "reportMissingPermission:forClientName:", v6, v11);

        }
      }
      break;
  }
  return 1;
}

- (BiometricKitXPCExportedObject)init
{
  BiometricKitXPCExportedObject *v2;
  uint64_t v3;
  NSMutableDictionary *clients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BiometricKitXPCExportedObject;
  v2 = -[BiometricKitXPCExportedObject init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  self->_server = 0;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BiometricKitXPCExportedObject;
  -[BiometricKitXPCExportedObject dealloc](&v4, sel_dealloc);
}

- (void)terminate
{
  BiometricKitXPCExportedObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](v2->_clients, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[BiometricKitXPCServer cancelWithClient:](v2->_server, "cancelWithClient:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary removeAllObjects](v2->_clients, "removeAllObjects");
  objc_sync_exit(v2);

}

- (id)clients
{
  BiometricKitXPCExportedObject *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_clients, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)connect:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  BiometricKitXPCExportedObject *v11;
  NSMutableDictionary *clients;
  void *v13;
  BiometricKitXPCExportedClientObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  NSMutableDictionary *v19;
  void *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject connect:client:replyBlock:]"))
  {
    v10 = (void *)MEMORY[0x2199D8AE0]();
    v11 = self;
    objc_sync_enter(v11);
    clients = v11->_clients;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v13);
    v14 = (BiometricKitXPCExportedClientObject *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[BiometricKitXPCExportedClientObject clientInfo](v14, "clientInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToDictionary:", v8);

      if ((v16 & 1) == 0)
      {
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v29 = 136316162;
          v30 = "[client.clientInfo isEqualToDictionary:clientInfo]";
          v31 = 2048;
          v32 = 0;
          v33 = 2080;
          v34 = &unk_21491C593;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v37 = 1024;
          v38 = 565;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v29, 0x30u);
        }
        v18 = 258;
LABEL_22:

        objc_sync_exit(v11);
        objc_autoreleasePoolPop(v10);
        goto LABEL_23;
      }
    }
    else
    {
      v14 = -[BiometricKitXPCExportedClientObject initWithClientID:clientInfo:exportedObject:]([BiometricKitXPCExportedClientObject alloc], "initWithClientID:clientInfo:exportedObject:", a4, v8, v11);
      if (!v14)
      {
        if (__osLog)
          v28 = __osLog;
        else
          v28 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = 136316162;
          v30 = "client";
          v31 = 2048;
          v32 = 0;
          v33 = 2080;
          v34 = &unk_21491C593;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v37 = 1024;
          v38 = 560;
          _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v29, 0x30u);
        }
        v14 = 0;
        v18 = 260;
        goto LABEL_22;
      }
      v19 = v11->_clients;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v14, v20);

    }
    if ((-[BiometricKitXPCExportedObject clientEntitlement](v11, "clientEntitlement") & 1) != 0
      && isInternalBuild())
    {
      -[BiometricKitXPCExportedClientObject name](v14, "name");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)__osLog;
      if (!__osLog)
        v22 = (void *)MEMORY[0x24BDACB70];
      v23 = v22;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[BiometricKitXPCExportedObject connection](v11, "connection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v21;
        v31 = 1024;
        LODWORD(v32) = objc_msgSend(v24, "processIdentifier");
        _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_ERROR, "Client %@ with PID %d does have legacy entitlement com.apple.private.bmk.allow, please set one of fine grained entitlements com.apple.private.biometrickit.allow-*\n", (uint8_t *)&v29, 0x12u);

      }
      if (!-[BiometricKitXPCExportedObject legacyAllowlisted:](v11, "legacyAllowlisted:", v21))
      {
        -[BiometricKitXPCExportedObject server](v11, "server");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "reporter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "reportLegacyClient:", v21);

      }
      v18 = 266;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_22;
  }
  if (__osLog)
    v27 = __osLog;
  else
    v27 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v29 = 136316162;
    v30 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
    v31 = 2048;
    v32 = 0;
    v33 = 2080;
    v34 = &unk_21491C593;
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
    v37 = 1024;
    v38 = 546;
    _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v29, 0x30u);
  }
  v18 = 257;
LABEL_23:
  v9[2](v9, v18);

}

- (void)disconnect:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  BiometricKitXPCExportedObject *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *clients;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject disconnect:replyBlock:]"))
  {
    v7 = self;
    objc_sync_enter(v7);
    -[BiometricKitXPCExportedObject client:](v7, "client:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v18[5];
    v18[5] = v8;

    if (v18[5])
    {
      clients = v7->_clients;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](clients, "removeObjectForKey:", v11);

      objc_sync_exit(v7);
      -[BiometricKitXPCServer cmdDispatchQueue](v7->_server, "cmdDispatchQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __55__BiometricKitXPCExportedObject_disconnect_replyBlock___block_invoke;
      v16[3] = &unk_24D241150;
      v16[4] = v7;
      v16[5] = &v17;
      dispatch_async(v12, v16);

      v13 = 0;
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v24 = "client";
        v25 = 2048;
        v26 = 0;
        v27 = 2080;
        v28 = &unk_21491C593;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v31 = 1024;
        v32 = 597;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      objc_sync_exit(v7);

      v13 = 22;
    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = &unk_21491C593;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v31 = 1024;
      v32 = 592;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 257;
  }
  v6[2](v6, v13);
  _Block_object_dispose(&v17, 8);

}

void __55__BiometricKitXPCExportedObject_disconnect_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)os_transaction_create();
  v2 = (void *)MEMORY[0x2199D8AE0]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelWithClient:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_autoreleasePoolPop(v2);
}

- (void)registerDelegate:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject registerDelegate:client:replyBlock:]"))
  {
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "setDelegateRegistered:", v6);
      v11 = (void *)os_transaction_create();
      v12 = (void *)MEMORY[0x2199D8AE0]();
      -[BiometricKitXPCServer registerDelegate:withClient:](self->_server, "registerDelegate:withClient:", v6, v10);

      objc_autoreleasePoolPop(v12);
      v13 = 0;
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 136316162;
        v17 = "client";
        v18 = 2048;
        v19 = 0;
        v20 = 2080;
        v21 = &unk_21491C593;
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v24 = 1024;
        v25 = 632;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
      }
      v13 = 22;
    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v24 = 1024;
      v25 = 629;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    v13 = 257;
  }
  v8[2](v8, v13);

}

- (void)notifyAppIsBackground:(BOOL)a3 client:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject notifyAppIsBackground:client:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "setClientAppIsBackground:", v5);

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136316162;
      v12 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = &unk_21491C593;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v19 = 1024;
      v20 = 655;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)notifyAppIsInactive:(BOOL)a3 client:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject notifyAppIsInactive:client:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setClientAppIsInactive:", v5);
      -[BiometricKitXPCServer notifyAppIsInactive:withClient:](self->_server, "notifyAppIsInactive:withClient:", v5, v9);
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136316162;
      v12 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = &unk_21491C593;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v19 = 1024;
      v20 = 674;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)enroll:(int)a3 user:(unsigned int)a4 options:(id)a5 async:(BOOL)a6 client:(unint64_t)a7 replyBlock:(id)a8
{
  _BOOL4 v10;
  id v14;
  void (**v15)(id, uint64_t);
  uint64_t v16;
  void *v17;
  dispatch_block_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  void (**v25)(id, uint64_t);
  uint64_t *v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v10 = a6;
  v45 = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = (void (**)(id, uint64_t))a8;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a7, 2, "-[BiometricKitXPCExportedObject enroll:user:options:async:client:replyBlock:]"))
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      v37 = 2048;
      v38 = 0;
      v39 = 2080;
      v40 = &unk_21491C593;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v43 = 1024;
      v44 = 695;
      _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v21 = 257;
    goto LABEL_20;
  }
  -[BiometricKitXPCExportedObject client:](self, "client:", a7);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v30[5];
  v30[5] = v16;

  if (!v30[5])
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "client";
      v37 = 2048;
      v38 = 0;
      v39 = 2080;
      v40 = &unk_21491C593;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v43 = 1024;
      v44 = 697;
      _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v21 = 22;
LABEL_20:
    v15[2](v15, v21);
    goto LABEL_7;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__BiometricKitXPCExportedObject_enroll_user_options_async_client_replyBlock___block_invoke;
  block[3] = &unk_24D241178;
  block[4] = self;
  v27 = a3;
  v28 = a4;
  v24 = v14;
  v26 = &v29;
  v25 = v15;
  v18 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
  if (v10)
  {
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v18);
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v19, v18);
  }

LABEL_7:
  _Block_object_dispose(&v29, 8);

}

uint64_t __77__BiometricKitXPCExportedObject_enroll_user_options_async_client_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 706;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enroll:forUser:withOptions:withClient:", *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)match:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  uint64_t v15;
  void *v16;
  dispatch_block_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id v24;
  void (**v25)(id, uint64_t);
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v9 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 4, "-[BiometricKitXPCExportedObject match:options:async:client:replyBlock:]"))
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_21491C593;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v41 = 1024;
      v42 = 733;
      _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v20 = 257;
    goto LABEL_20;
  }
  -[BiometricKitXPCExportedObject client:](self, "client:", a6);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v28[5];
  v28[5] = v15;

  if (!v28[5])
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "client";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_21491C593;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v41 = 1024;
      v42 = 736;
      _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v20 = 22;
LABEL_20:
    v14[2](v14, v20);
    goto LABEL_7;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BiometricKitXPCExportedObject_match_options_async_client_replyBlock___block_invoke;
  block[3] = &unk_24D2411A0;
  block[4] = self;
  v23 = v12;
  v24 = v13;
  v26 = &v27;
  v25 = v14;
  v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
  if (v9)
  {
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v18, v17);
  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v18, v17);
  }

LABEL_7:
  _Block_object_dispose(&v27, 8);

}

uint64_t __71__BiometricKitXPCExportedObject_match_options_async_client_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 745;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "match:withOptions:withClient:", a1[5], a1[6], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)detectPresenceWithOptions:(id)a3 async:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  void *v13;
  dispatch_block_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD *);
  void *v22;
  BiometricKitXPCExportedObject *v23;
  id v24;
  void (**v25)(id, uint64_t);
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v8 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, uint64_t))a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject detectPresenceWithOptions:async:client:replyBlock:]"))
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_21491C593;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v41 = 1024;
      v42 = 772;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 257;
    goto LABEL_20;
  }
  -[BiometricKitXPCExportedObject client:](self, "client:", a5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v28[5];
  v28[5] = v12;

  if (!v28[5])
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "client";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_21491C593;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v41 = 1024;
      v42 = 775;
      _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 22;
LABEL_20:
    v11[2](v11, v17);
    goto LABEL_7;
  }
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __83__BiometricKitXPCExportedObject_detectPresenceWithOptions_async_client_replyBlock___block_invoke;
  v22 = &unk_24D2411C8;
  v23 = self;
  v24 = v10;
  v26 = &v27;
  v25 = v11;
  v14 = dispatch_block_create((dispatch_block_flags_t)0, &v19);
  -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue", v19, v20, v21, v22, v23, v24);
  if (v8)
  {
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v15, v14);
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v15, v14);
  }

LABEL_7:
  _Block_object_dispose(&v27, 8);

}

uint64_t __83__BiometricKitXPCExportedObject_detectPresenceWithOptions_async_client_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 784;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "detectPresenceWithOptions:withClient:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)cancel:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  void (**v14)(id, uint64_t);
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject cancel:replyBlock:]"))
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_21491C593;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v30 = 1024;
      v31 = 811;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 257;
    goto LABEL_17;
  }
  -[BiometricKitXPCExportedObject client:](self, "client:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v17[5];
  v17[5] = v7;

  if (!v17[5])
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "client";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_21491C593;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v30 = 1024;
      v31 = 814;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 22;
LABEL_17:
    v6[2](v6, v11);
    goto LABEL_4;
  }
  -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__BiometricKitXPCExportedObject_cancel_replyBlock___block_invoke;
  block[3] = &unk_24D2411F0;
  block[4] = self;
  v15 = &v16;
  v14 = v6;
  dispatch_async(v9, block);

LABEL_4:
  _Block_object_dispose(&v16, 8);

}

uint64_t __51__BiometricKitXPCExportedObject_cancel_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 823;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "cancelWithClient:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)updateIdentity:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  _BYTE *v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v9 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 3, "-[BiometricKitXPCExportedObject updateIdentity:options:async:client:replyBlock:]"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    *(_QWORD *)&v36 = __Block_byref_object_dispose_;
    -[BiometricKitXPCExportedObject client:](self, "client:", a6);
    *((_QWORD *)&v36 + 1) = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__BiometricKitXPCExportedObject_updateIdentity_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_24D2411A0;
      block[4] = self;
      v20 = v12;
      v21 = v13;
      v23 = buf;
      v22 = v14;
      v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
      if (v9)
      {
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v16, v15);
      }
      else
      {
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v16, v15);
      }

    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136316162;
        v25 = "client";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v32 = 1024;
        v33 = 844;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 22);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_21491C593;
      LOWORD(v36) = 2080;
      *(_QWORD *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 841;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 257);
  }

}

uint64_t __80__BiometricKitXPCExportedObject_updateIdentity_options_async_client_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 853;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "updateIdentity:withOptions:withClient:", a1[5], a1[6], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)removeIdentity:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  _BYTE *v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v9 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 3, "-[BiometricKitXPCExportedObject removeIdentity:options:async:client:replyBlock:]"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    *(_QWORD *)&v36 = __Block_byref_object_dispose_;
    -[BiometricKitXPCExportedObject client:](self, "client:", a6);
    *((_QWORD *)&v36 + 1) = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__BiometricKitXPCExportedObject_removeIdentity_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_24D2411A0;
      block[4] = self;
      v20 = v12;
      v21 = v13;
      v23 = buf;
      v22 = v14;
      v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
      if (v9)
      {
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v16, v15);
      }
      else
      {
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v16, v15);
      }

    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136316162;
        v25 = "client";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v32 = 1024;
        v33 = 878;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 22);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_21491C593;
      LOWORD(v36) = 2080;
      *(_QWORD *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 875;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 257);
  }

}

uint64_t __80__BiometricKitXPCExportedObject_removeIdentity_options_async_client_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 887;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "removeIdentity:withOptions:withClient:", a1[5], a1[6], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  dispatch_block_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  id v20;
  _BYTE *v21;
  unsigned int v22;
  uint8_t v23[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  __int128 v35;
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 3, "-[BiometricKitXPCExportedObject removeAllIdentitiesForUser:options:async:client:replyBlock:]"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    *(_QWORD *)&v35 = __Block_byref_object_dispose_;
    -[BiometricKitXPCExportedObject client:](self, "client:", a6);
    *((_QWORD *)&v35 + 1) = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__BiometricKitXPCExportedObject_removeAllIdentitiesForUser_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_24D241218;
      block[4] = self;
      v22 = a3;
      v19 = v12;
      v21 = buf;
      v20 = v13;
      v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
      if (v9)
      {
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v15, v14);
      }
      else
      {
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v15, v14);
      }

    }
    else
    {
      if (__osLog)
        v17 = __osLog;
      else
        v17 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v23 = 136316162;
        v24 = "client";
        v25 = 2048;
        v26 = 0;
        v27 = 2080;
        v28 = &unk_21491C593;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v31 = 1024;
        v32 = 912;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v23, 0x30u);
      }
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 22);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v34 = (uint64_t (*)(uint64_t, uint64_t))&unk_21491C593;
      LOWORD(v35) = 2080;
      *(_QWORD *)((char *)&v35 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v35) = 1024;
      HIDWORD(v35) = 909;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 257);
  }

}

uint64_t __92__BiometricKitXPCExportedObject_removeAllIdentitiesForUser_options_async_client_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 921;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllIdentitiesForUser:withOptions:withClient:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getIdentityFromUUID:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getIdentityFromUUID:client:replyBlock:]"))
  {
    v10 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v12)
      {
        v16 = v12;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v16;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 952;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      -[BiometricKitXPCServer getIdentityFromUUID:withClient:](self->_server, "getIdentityFromUUID:withClient:", v8, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 951;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      v13 = 0;
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 944;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v13 = 0;
  }
  v9[2](v9, v13);

}

- (void)identities:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject identities:client:replyBlock:]"))
  {
    v10 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v12)
      {
        v16 = v12;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v16;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 974;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      -[BiometricKitXPCServer identities:withClient:](self->_server, "identities:withClient:", v8, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 973;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      v13 = 0;
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 966;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v13 = 0;
  }
  v9[2](v9, v13);

}

- (void)getMaxIdentityCount:(int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, int64_t);
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, int64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getMaxIdentityCount:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 997;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer getMaxIdentityCount:withClient:](self->_server, "getMaxIdentityCount:withClient:", v6, v10);
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 996;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 988;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = -1;
  }
  v8[2](v8, v12);

}

- (void)getFreeIdentityCount:(int)a3 user:(unsigned int)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  void (**v10)(id, int64_t);
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = (void (**)(id, int64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject getFreeIdentityCount:user:client:replyBlock:]"))
  {
    v11 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v13)
      {
        v17 = v13;
        if (__osLog)
          v18 = __osLog;
        else
          v18 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v21 = 2048;
          v22 = v17;
          v23 = 2080;
          v24 = &unk_21491C593;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v27 = 1024;
          v28 = 1019;
          _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
        }
      }
      v14 = -[BiometricKitXPCServer getFreeIdentityCount:forUser:withClient:](self->_server, "getFreeIdentityCount:forUser:withClient:", v8, v7, v12);
    }
    else
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = 136316162;
        v20 = "client";
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = &unk_21491C593;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v27 = 1024;
        v28 = 1018;
        _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
      v14 = 0;
    }

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v27 = 1024;
      v28 = 1011;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    v14 = -1;
  }
  v10[2](v10, v14);

}

- (void)registerDSID:(unint64_t)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 7, "-[BiometricKitXPCExportedObject registerDSID:options:client:replyBlock:]"))
  {
    v12 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v14)
      {
        v18 = v14;
        if (__osLog)
          v19 = __osLog;
        else
          v19 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v22 = 2048;
          v23 = v18;
          v24 = 2080;
          v25 = &unk_21491C593;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v28 = 1024;
          v29 = 1041;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }
      v15 = -[BiometricKitXPCServer registerDSID:withOptions:withClient:](self->_server, "registerDSID:withOptions:withClient:", a3, v10, v13);
    }
    else
    {
      if (__osLog)
        v17 = __osLog;
      else
        v17 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316162;
        v21 = "client";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_21491C593;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v28 = 1024;
        v29 = 1040;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      v15 = 22;
    }

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v28 = 1024;
      v29 = 1033;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    v15 = 257;
  }
  v11[2](v11, v15);

}

- (void)registerStoreToken:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 7, "-[BiometricKitXPCExportedObject registerStoreToken:client:replyBlock:]"))
  {
    v10 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v12)
      {
        v16 = v12;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v16;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 1063;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      v13 = -[BiometricKitXPCServer registerStoreToken:withClient:](self->_server, "registerStoreToken:withClient:", v8, v11);
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 1062;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      v13 = 22;
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 1055;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v13 = 257;
  }
  v9[2](v9, v13);

}

- (void)getCountersignedStoreToken:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, id);
  void *v7;
  void *v8;
  int v9;
  BiometricKitXPCServer *server;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, id))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject getCountersignedStoreToken:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v15 = v9;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v15;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 1087;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      v17 = 0;
      v11 = -[BiometricKitXPCServer getCountersignedStoreToken:withClient:](server, "getCountersignedStoreToken:withClient:", &v17, v8);
      v12 = v17;
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 1086;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 0;
      v11 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 1079;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 0;
    v11 = 257;
  }
  v6[2](v6, v11, v12);

}

- (void)diagnostics:(int)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v8;
  id v10;
  void (**v11)(id, uint64_t, _BOOL8, id);
  void *v12;
  void *v13;
  int v14;
  BiometricKitXPCServer *server;
  uint64_t v16;
  id v17;
  _BOOL8 v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  id v23;
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v8 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, uint64_t, _BOOL8, id))a6;
  v24 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject diagnostics:options:client:replyBlock:]"))
  {
    v12 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v14)
      {
        v21 = v14;
        if (__osLog)
          v22 = __osLog;
        else
          v22 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v26 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v27 = 2048;
          v28 = v21;
          v29 = 2080;
          v30 = &unk_21491C593;
          v31 = 2080;
          v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v33 = 1024;
          v34 = 1109;
          _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      v23 = 0;
      v16 = -[BiometricKitXPCServer diagnostics:withOptions:passed:withDetails:withClient:](server, "diagnostics:withOptions:passed:withDetails:withClient:", v8, v10, &v24, &v23, v13);
      v17 = v23;
    }
    else
    {
      if (__osLog)
        v20 = __osLog;
      else
        v20 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v26 = "client";
        v27 = 2048;
        v28 = 0;
        v29 = 2080;
        v30 = &unk_21491C593;
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v33 = 1024;
        v34 = 1108;
        _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v17 = 0;
      v16 = 22;
    }

    objc_autoreleasePoolPop(v12);
    v18 = v24 != 0;
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v27 = 2048;
      v28 = 0;
      v29 = 2080;
      v30 = &unk_21491C593;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v33 = 1024;
      v34 = 1104;
      _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 0;
    v17 = 0;
    v16 = 257;
  }
  v11[2](v11, v16, v18, v17);

}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject timestampEvent:absoluteTime:client:replyBlock:]"))
  {
    v11 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v13)
      {
        v17 = v13;
        if (__osLog)
          v18 = __osLog;
        else
          v18 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v21 = 2048;
          v22 = v17;
          v23 = 2080;
          v24 = &unk_21491C593;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v27 = 1024;
          v28 = 1128;
          _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
        }
      }
      -[BiometricKitXPCServer timestampEvent:absoluteTime:](self->_server, "timestampEvent:absoluteTime:", a3, a4);
      v14 = 0;
    }
    else
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = 136316162;
        v20 = "client";
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = &unk_21491C593;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v27 = 1024;
        v28 = 1127;
        _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
      v14 = 22;
    }

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v27 = 1024;
      v28 = 1123;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    v14 = 257;
  }
  v10[2](v10, v14);

}

- (void)setUserDSID:(unint64_t)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 7, "-[BiometricKitXPCExportedObject setUserDSID:options:client:replyBlock:]"))
  {
    v12 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v14)
      {
        v18 = v14;
        if (__osLog)
          v19 = __osLog;
        else
          v19 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v22 = 2048;
          v23 = v18;
          v24 = 2080;
          v25 = &unk_21491C593;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v28 = 1024;
          v29 = 1150;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }
      v15 = -[BiometricKitXPCServer setUserDSID:withOptions:withClient:](self->_server, "setUserDSID:withOptions:withClient:", a3, v10, v13);
    }
    else
    {
      if (__osLog)
        v17 = __osLog;
      else
        v17 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316162;
        v21 = "client";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_21491C593;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v28 = 1024;
        v29 = 1149;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      v15 = 22;
    }

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v28 = 1024;
      v29 = 1142;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    v15 = 257;
  }
  v11[2](v11, v15);

}

- (void)resetAppleConnectCounter:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject resetAppleConnectCounter:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1172;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer resetAppleConnectCounterWithClient:](self->_server, "resetAppleConnectCounterWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1171;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1164;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 257;
  }
  v6[2](v6, v10);

}

- (void)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getIdentitiesDatabaseUUIDForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 1194;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      -[BiometricKitXPCServer getIdentitiesDatabaseUUIDForUser:withClient:](self->_server, "getIdentitiesDatabaseUUIDForUser:withClient:", v6, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 1193;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 1186;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 0;
  }
  v8[2](v8, v12);

}

- (void)getIdentitiesDatabaseHashForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getIdentitiesDatabaseHashForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 1216;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      -[BiometricKitXPCServer getIdentitiesDatabaseHashForUser:withClient:](self->_server, "getIdentitiesDatabaseHashForUser:withClient:", v6, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 1215;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 1208;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 0;
  }
  v8[2](v8, v12);

}

- (void)dropUnlockToken:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject dropUnlockToken:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1239;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer dropUnlockTokenWithClient:](self->_server, "dropUnlockTokenWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1238;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1230;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 257;
  }
  v6[2](v6, v10);

}

- (void)forceBioLockoutForUser:(unsigned int)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v8;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject forceBioLockoutForUser:options:client:replyBlock:]"))
  {
    v12 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v14)
      {
        v18 = v14;
        if (__osLog)
          v19 = __osLog;
        else
          v19 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v22 = 2048;
          v23 = v18;
          v24 = 2080;
          v25 = &unk_21491C593;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v28 = 1024;
          v29 = 1261;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }
      v15 = -[BiometricKitXPCServer forceBioLockoutForUser:withOptions:withClient:](self->_server, "forceBioLockoutForUser:withOptions:withClient:", v8, v10, v13);
    }
    else
    {
      if (__osLog)
        v17 = __osLog;
      else
        v17 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316162;
        v21 = "client";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_21491C593;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v28 = 1024;
        v29 = 1260;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      v15 = 22;
    }

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v28 = 1024;
      v29 = 1253;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    v15 = 257;
  }
  v11[2](v11, v15);

}

- (void)enrollContinue:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 2, "-[BiometricKitXPCExportedObject enrollContinue:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1283;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer enrollContinue](self->_server, "enrollContinue");
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1282;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1275;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 257;
  }
  v6[2](v6, v10);

}

- (void)pullAlignmentData:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 2, "-[BiometricKitXPCExportedObject pullAlignmentData:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1306;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer pullAlignmentData](self->_server, "pullAlignmentData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1305;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1298;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)pullMatchPolicyInfoData:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject pullMatchPolicyInfoData:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1328;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer pullMatchPolicyInfoData](self->_server, "pullMatchPolicyInfoData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1327;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1320;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)getNodeTopologyForIdentity:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 6, "-[BiometricKitXPCExportedObject getNodeTopologyForIdentity:client:replyBlock:]"))
  {
    v10 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v12)
      {
        v16 = v12;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v16;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 1350;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      -[BiometricKitXPCServer getNodeTopologyForIdentity:withClient:](self->_server, "getNodeTopologyForIdentity:withClient:", v8, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 1349;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      v13 = 0;
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 1342;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v13 = 0;
  }
  v9[2](v9, v13);

}

- (void)getSystemProtectedConfiguration:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getSystemProtectedConfiguration:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1394;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer getSystemProtectedConfigurationWithClient:](self->_server, "getSystemProtectedConfigurationWithClient:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1393;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1386;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)setProtectedConfiguration:(id)a3 user:(unsigned int)a4 options:(id)a5 async:(BOOL)a6 client:(unint64_t)a7 replyBlock:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  BiometricKitXPCExportedObject *v25;
  id v26;
  id v27;
  id v28;
  _BYTE *v29;
  unsigned int v30;
  uint8_t v31[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  __int128 v43;
  uint64_t v44;

  v10 = a6;
  v44 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a8;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a7, 5, "-[BiometricKitXPCExportedObject setProtectedConfiguration:user:options:async:client:replyBlock:]"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    *(_QWORD *)&v43 = __Block_byref_object_dispose_;
    -[BiometricKitXPCExportedObject client:](self, "client:", a7);
    *((_QWORD *)&v43 + 1) = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __96__BiometricKitXPCExportedObject_setProtectedConfiguration_user_options_async_client_replyBlock___block_invoke;
      v24 = &unk_24D241240;
      v25 = self;
      v26 = v14;
      v30 = a4;
      v27 = v15;
      v29 = buf;
      v28 = v16;
      v17 = dispatch_block_create((dispatch_block_flags_t)0, &v21);
      -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue", v21, v22, v23, v24, v25, v26, v27);
      if (v10)
      {
        v18 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v18, v17);
      }
      else
      {
        v18 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v18, v17);
      }

    }
    else
    {
      if (__osLog)
        v20 = __osLog;
      else
        v20 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v31 = 136316162;
        v32 = "client";
        v33 = 2048;
        v34 = 0;
        v35 = 2080;
        v36 = &unk_21491C593;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v39 = 1024;
        v40 = 1409;
        _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v31, 0x30u);
      }
      (*((void (**)(id, uint64_t))v16 + 2))(v16, 22);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupConfig forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v42 = (uint64_t (*)(uint64_t, uint64_t))&unk_21491C593;
      LOWORD(v43) = 2080;
      *(_QWORD *)((char *)&v43 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v43) = 1024;
      HIDWORD(v43) = 1407;
      _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v16 + 2))(v16, 257);
  }

}

uint64_t __96__BiometricKitXPCExportedObject_setProtectedConfiguration_user_options_async_client_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 1418;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setProtectedConfiguration:forUser:withOptions:withClient:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)setSystemProtectedConfiguration:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  _BYTE *v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v9 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 5, "-[BiometricKitXPCExportedObject setSystemProtectedConfiguration:options:async:client:replyBlock:]"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    *(_QWORD *)&v36 = __Block_byref_object_dispose_;
    -[BiometricKitXPCExportedObject client:](self, "client:", a6);
    *((_QWORD *)&v36 + 1) = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __97__BiometricKitXPCExportedObject_setSystemProtectedConfiguration_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_24D2411A0;
      block[4] = self;
      v20 = v12;
      v21 = v13;
      v23 = buf;
      v22 = v14;
      v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue");
      if (v9)
      {
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v16, v15);
      }
      else
      {
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v16, v15);
      }

    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136316162;
        v25 = "client";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v32 = 1024;
        v33 = 1442;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 22);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupConfig forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_21491C593;
      LOWORD(v36) = 2080;
      *(_QWORD *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 1440;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 257);
  }

}

uint64_t __97__BiometricKitXPCExportedObject_setSystemProtectedConfiguration_options_async_client_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 1451;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "setSystemProtectedConfiguration:withOptions:withClient:", a1[5], a1[6], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)getProvisioningState:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, int64_t);
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, int64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getProvisioningState:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1483;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer getProvisioningStateWithClient:](self->_server, "getProvisioningStateWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1482;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = -1;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1474;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)getBioLockoutStateForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v6 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t, uint64_t))a5;
  v17 = -1;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getBioLockoutStateForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer getBioLockoutState:forUser:withClient:](self->_server, "getBioLockoutState:forUser:withClient:", &v17, v6, v10);
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __77__BiometricKitXPCExportedObject_getBioLockoutStateForUser_client_replyBlock___block_invoke;
      v16[3] = &unk_24D241268;
      v16[4] = self;
      dispatch_async(v12, v16);

    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 1515;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v11 = 22;
    }

    objc_autoreleasePoolPop(v9);
    v13 = v17;
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 1498;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 257;
    v13 = -1;
  }
  v8[2](v8, v11, v13);

}

void __77__BiometricKitXPCExportedObject_getBioLockoutStateForUser_client_replyBlock___block_invoke(uint64_t a1)
{
  int v1;
  int v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "loadCatacombAfterFirstUnlock");
  if (v1)
  {
    v2 = v1;
    if (__osLog)
      v3 = __osLog;
    else
      v3 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136316162;
      v5 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v6 = 2048;
      v7 = v2;
      v8 = 2080;
      v9 = &unk_21491C593;
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v12 = 1024;
      v13 = 1520;
      _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
}

- (void)getExpressModeStateForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t, uint64_t);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t, uint64_t))a5;
  v18 = -1;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getExpressModeStateForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v16 = v11;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v21 = 2048;
          v22 = v16;
          v23 = 2080;
          v24 = &unk_21491C593;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v27 = 1024;
          v28 = 1560;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer getExpressModeState:forUser:withClient:](self->_server, "getExpressModeState:forUser:withClient:", &v18, v6, v10);
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v20 = "client";
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = &unk_21491C593;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v27 = 1024;
        v28 = 1559;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
    v13 = v18;
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v27 = 1024;
      v28 = 1542;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 257;
    v13 = -1;
  }
  v8[2](v8, v12, v13);

}

- (void)getSensorCalibrationStatus:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, int64_t);
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, int64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getSensorCalibrationStatus:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1589;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer getSensorCalibrationStatusWithClient:](self->_server, "getSensorCalibrationStatusWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1588;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = -1;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1581;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = -1;
  }
  v6[2](v6, v10);

}

- (void)getCalibrationDataInfo:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getCalibrationDataInfo:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1611;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer getCalibrationDataInfoWithClient:](self->_server, "getCalibrationDataInfoWithClient:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1610;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1603;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)getSensorInfo:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getSensorInfo:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1633;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer getSensorInfoWithClient:](self->_server, "getSensorInfoWithClient:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1632;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1625;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)setDebugImages:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 6, "-[BiometricKitXPCExportedObject setDebugImages:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 1652;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer setDebugImages:withClient:](self->_server, "setDebugImages:withClient:", v6, v10);
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 1651;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 1647;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 257;
  }
  v8[2](v8, v12);

}

- (void)pullCalibrationData:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject pullCalibrationData:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1674;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer pullCalibrationDataWithClient:](self->_server, "pullCalibrationDataWithClient:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1673;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1666;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)pullCaptureBuffer:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject pullCaptureBuffer:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1696;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      -[BiometricKitXPCServer pullCaptureBufferWithClient:](self->_server, "pullCaptureBufferWithClient:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1695;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1688;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  void (**v10)(id, void *, uint64_t, uint64_t);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v7 = a4;
  v8 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = (void (**)(id, void *, uint64_t, uint64_t))a6;
  v21 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 6, "-[BiometricKitXPCExportedObject pullDebugImageData:rotated:client:replyBlock:]"))
  {
    v11 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v13)
      {
        v19 = v13;
        if (__osLog)
          v20 = __osLog;
        else
          v20 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v23 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v24 = 2048;
          v25 = v19;
          v26 = 2080;
          v27 = &unk_21491C593;
          v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v30 = 1024;
          v31 = 1720;
          _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      -[BiometricKitXPCServer pullDebugImageData:rotated:hasWidth:hasHeight:withClient:](self->_server, "pullDebugImageData:rotated:hasWidth:hasHeight:withClient:", v8, v7, (char *)&v21 + 4, &v21, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v23 = "client";
        v24 = 2048;
        v25 = 0;
        v26 = 2080;
        v27 = &unk_21491C593;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v30 = 1024;
        v31 = 1719;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v14 = 0;
    }

    objc_autoreleasePoolPop(v11);
    v16 = v21;
    v15 = HIDWORD(v21);
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_21491C593;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v30 = 1024;
      v31 = 1712;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v16 = 0;
    v15 = 0;
    v14 = 0;
  }
  v10[2](v10, v14, v15, v16);

}

- (void)getLogs:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  int v11;
  BiometricKitXPCServer *server;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v6 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, id))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 6, "-[BiometricKitXPCExportedObject getLogs:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v17 = v11;
        if (__osLog)
          v18 = __osLog;
        else
          v18 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v22 = 2048;
          v23 = v17;
          v24 = 2080;
          v25 = &unk_21491C593;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v28 = 1024;
          v29 = 1740;
          _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      v19 = 0;
      -[BiometricKitXPCServer getLogs:withDetails:](server, "getLogs:withDetails:", v6, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
    }
    else
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "client";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_21491C593;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v28 = 1024;
        v29 = 1739;
        _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v13 = 0;
      v14 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v28 = 1024;
      v29 = 1735;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 0;
    v14 = 0;
  }
  v8[2](v8, v13, v14);

}

- (void)fileRadarWithLogs:(id)a3 description:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _BOOL8);
  void *v13;
  void *v14;
  int v15;
  _BOOL8 v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _BOOL8))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 6, "-[BiometricKitXPCExportedObject fileRadarWithLogs:description:client:replyBlock:]"))
  {
    v13 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v15)
      {
        v19 = v15;
        if (__osLog)
          v20 = __osLog;
        else
          v20 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = 136316162;
          v22 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v23 = 2048;
          v24 = v19;
          v25 = 2080;
          v26 = &unk_21491C593;
          v27 = 2080;
          v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v29 = 1024;
          v30 = 1759;
          _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
        }
      }
      v16 = -[BiometricKitXPCServer fileRadarWithLogs:withDescription:](self->_server, "fileRadarWithLogs:withDescription:", v10, v11);
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316162;
        v22 = "client";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = &unk_21491C593;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v29 = 1024;
        v30 = 1758;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
      }
      v16 = 0;
    }

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      v22 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = &unk_21491C593;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v29 = 1024;
      v30 = 1754;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    v16 = 0;
  }
  v12[2](v12, v16);

}

- (void)isFingerOn:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, _BOOL8);
  void *v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _BOOL8))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isFingerOn:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1778;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer isFingerOnWithClient:](self->_server, "isFingerOnWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1777;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1773;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)enableBackgroundFdet:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject enableBackgroundFdet:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer enableBackgroundFdet:withClient:](self->_server, "enableBackgroundFdet:withClient:", v6, v10);
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__BiometricKitXPCExportedObject_enableBackgroundFdet_client_replyBlock___block_invoke;
      block[3] = &unk_24D241268;
      block[4] = self;
      dispatch_async(v12, block);

    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "client";
        v18 = 2048;
        v19 = 0;
        v20 = 2080;
        v21 = &unk_21491C593;
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v24 = 1024;
        v25 = 1799;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v11 = 22;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v24 = 1024;
      v25 = 1792;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 257;
  }
  v8[2](v8, v11);

}

void __72__BiometricKitXPCExportedObject_enableBackgroundFdet_client_replyBlock___block_invoke(uint64_t a1)
{
  int v1;
  int v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "loadCatacombAfterFirstUnlock");
  if (v1)
  {
    v2 = v1;
    if (__osLog)
      v3 = __osLog;
    else
      v3 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136316162;
      v5 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v6 = 2048;
      v7 = v2;
      v8 = 2080;
      v9 = &unk_21491C593;
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v12 = 1024;
      v13 = 1804;
      _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
}

- (void)isAriadneSignpostsEnabled:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, _BOOL8);
  void *v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _BOOL8))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isAriadneSignpostsEnabled:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1823;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer ariadneSignposts](self->_server, "ariadneSignposts");
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1822;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1818;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)isXARTAvailable:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, _BOOL8);
  void *v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _BOOL8))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isXARTAvailable:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1845;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer isXARTAvailableWithClient:](self->_server, "isXARTAvailableWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1844;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1837;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 0;
  }
  v6[2](v6, v10);

}

- (void)getDeviceState:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, int64_t);
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, int64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getDeviceState:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1867;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer getDeviceStateWithClient:](self->_server, "getDeviceStateWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1866;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = -1;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1859;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = -1;
  }
  v6[2](v6, v10);

}

- (void)startNewMatchAttempt:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 4, "-[BiometricKitXPCExportedObject startNewMatchAttempt:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1889;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer startNewMatchAttemptWithClient:](self->_server, "startNewMatchAttemptWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1888;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1881;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 257;
  }
  v6[2](v6, v10);

}

- (void)getBiometryAvailabilityForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v18 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getBiometryAvailabilityForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v16 = v11;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v21 = 2048;
          v22 = v16;
          v23 = 2080;
          v24 = &unk_21491C593;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v27 = 1024;
          v28 = 1912;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer getBiometryAvailability:forUser:withClient:](self->_server, "getBiometryAvailability:forUser:withClient:", &v18, v6, v10);
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v20 = "client";
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = &unk_21491C593;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v27 = 1024;
        v28 = 1911;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
    v13 = v18;
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v27 = 1024;
      v28 = 1904;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 0;
    v12 = 257;
  }
  v8[2](v8, v12, v13);

}

- (void)completeEnrollment:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 2, "-[BiometricKitXPCExportedObject completeEnrollment:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v13 = v9;
        if (__osLog)
          v14 = __osLog;
        else
          v14 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v17 = 2048;
          v18 = v13;
          v19 = 2080;
          v20 = &unk_21491C593;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v23 = 1024;
          v24 = 1934;
          _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer completeEnrollmentWithClient:](self->_server, "completeEnrollmentWithClient:", v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316162;
        v16 = "client";
        v17 = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = &unk_21491C593;
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v23 = 1024;
        v24 = 1933;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      v10 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v23 = 1024;
      v24 = 1926;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v10 = 257;
  }
  v6[2](v6, v10);

}

- (void)suspendEnrollment:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 2, "-[BiometricKitXPCExportedObject suspendEnrollment:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 1956;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer suspendEnrollment:withClient:](self->_server, "suspendEnrollment:withClient:", v6, v10);
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 1955;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 1948;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 257;
  }
  v8[2](v8, v12);

}

- (void)setTemplate:(id)a3 forIdentity:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 6, "-[BiometricKitXPCExportedObject setTemplate:forIdentity:client:replyBlock:]"))
  {
    v13 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v15)
      {
        v19 = v15;
        if (__osLog)
          v20 = __osLog;
        else
          v20 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = 136316162;
          v22 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v23 = 2048;
          v24 = v19;
          v25 = 2080;
          v26 = &unk_21491C593;
          v27 = 2080;
          v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v29 = 1024;
          v30 = 1978;
          _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
        }
      }
      v16 = -[BiometricKitXPCServer setTemplate:forIdentity:withClient:](self->_server, "setTemplate:forIdentity:withClient:", v10, v11, v14);
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316162;
        v22 = "client";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = &unk_21491C593;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v29 = 1024;
        v30 = 1977;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
      }
      v16 = 22;
    }

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      v22 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = &unk_21491C593;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v29 = 1024;
      v30 = 1970;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    v16 = 257;
  }
  v12[2](v12, v16);

}

- (void)isPeriocularEnrollmentSupported:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, _BOOL8);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _BOOL8 v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, _BOOL8))a4;
  v16 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isPeriocularEnrollmentSupported:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v14 = v9;
        if (__osLog)
          v15 = __osLog;
        else
          v15 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v14;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 2003;
          _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v10 = -[BiometricKitXPCServer isPeriocularEnrollmentSupported:withClient:](self->_server, "isPeriocularEnrollmentSupported:withClient:", &v16, v8);
    }
    else
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 2002;
        _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v10 = 22;
    }

    objc_autoreleasePoolPop(v7);
    v11 = v16 != 0;
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 1995;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 0;
    v10 = 257;
  }
  v6[2](v6, v10, v11);

}

- (void)getPeriocularMatchState:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v18 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getPeriocularMatchState:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v16 = v11;
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v21 = 2048;
          v22 = v16;
          v23 = 2080;
          v24 = &unk_21491C593;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v27 = 1024;
          v28 = 2026;
          _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer getPeriocularMatchStateForUser:state:withClient:](self->_server, "getPeriocularMatchStateForUser:state:withClient:", v6, &v18, v10);
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v20 = "client";
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = &unk_21491C593;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v27 = 1024;
        v28 = 2025;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
    v13 = v18;
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v27 = 1024;
      v28 = 2018;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 0;
    v12 = 257;
  }
  v8[2](v8, v12, v13);

}

- (void)removePeriocularTemplatesWithOptions:(id)a3 async:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  dispatch_block_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *);
  void *v19;
  BiometricKitXPCExportedObject *v20;
  id v21;
  id v22;
  _BYTE *v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v8 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 3, "-[BiometricKitXPCExportedObject removePeriocularTemplatesWithOptions:async:client:replyBlock:]"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    *(_QWORD *)&v36 = __Block_byref_object_dispose_;
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    *((_QWORD *)&v36 + 1) = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v16 = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __94__BiometricKitXPCExportedObject_removePeriocularTemplatesWithOptions_async_client_replyBlock___block_invoke;
      v19 = &unk_24D2411C8;
      v20 = self;
      v21 = v10;
      v23 = buf;
      v22 = v11;
      v12 = dispatch_block_create((dispatch_block_flags_t)0, &v16);
      -[BiometricKitXPCServer cmdDispatchQueue](self->_server, "cmdDispatchQueue", v16, v17, v18, v19, v20, v21);
      if (v8)
      {
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v13, v12);
      }
      else
      {
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v13, v12);
      }

    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136316162;
        v25 = "client";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v32 = 1024;
        v33 = 2041;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v11 + 2))(v11, 22);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_21491C593;
      LOWORD(v36) = 2080;
      *(_QWORD *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 2039;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 257);
  }

}

uint64_t __94__BiometricKitXPCExportedObject_removePeriocularTemplatesWithOptions_async_client_replyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199D8AE0]();
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "loadCatacombAfterFirstUnlock");
  if (v3)
  {
    v7 = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v17 = 1024;
      v18 = 2050;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 24), "removePeriocularTemplatesWithOptions:withClient:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)queryIdentityMigrationFailureForUser:(unsigned int)a3 clear:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  void (**v10)(id, uint64_t, _BOOL8);
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  _BOOL8 v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = (void (**)(id, uint64_t, _BOOL8))a6;
  v20 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 7, "-[BiometricKitXPCExportedObject queryIdentityMigrationFailureForUser:clear:client:replyBlock:]"))
  {
    v11 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v13)
      {
        v18 = v13;
        if (__osLog)
          v19 = __osLog;
        else
          v19 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v22 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v23 = 2048;
          v24 = v18;
          v25 = 2080;
          v26 = &unk_21491C593;
          v27 = 2080;
          v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v29 = 1024;
          v30 = 2084;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v14 = -[BiometricKitXPCServer queryIdentityMigrationFailureForUser:failed:clear:withClient:](self->_server, "queryIdentityMigrationFailureForUser:failed:clear:withClient:", v8, &v20, v7, v12);
    }
    else
    {
      if (__osLog)
        v17 = __osLog;
      else
        v17 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v22 = "client";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = &unk_21491C593;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v29 = 1024;
        v30 = 2083;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v14 = 22;
    }

    objc_autoreleasePoolPop(v11);
    v15 = v20 != 0;
  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = &unk_21491C593;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v29 = 1024;
      v30 = 2076;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v15 = 0;
    v14 = 257;
  }
  v10[2](v10, v14, v15);

}

- (void)logEventOrCode:(unint64_t)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", -1, 1, "-[BiometricKitXPCExportedObject logEventOrCode:]"))
  {
    _BKLogEventOrCode();
  }
  else
  {
    if (__osLog)
      v3 = __osLog;
    else
      v3 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136316162;
      v5 = "[self isClient:(ClientID)-1 entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v6 = 2048;
      v7 = 0;
      v8 = 2080;
      v9 = &unk_21491C593;
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v12 = 1024;
      v13 = 2097;
      _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
}

- (void)enableMatchAutoRetry:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 4, "-[BiometricKitXPCExportedObject enableMatchAutoRetry:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 2118;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer enableMatchAutoRetry:withClient:](self->_server, "enableMatchAutoRetry:withClient:", v6, v10);
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 2117;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 2110;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 257;
  }
  v8[2](v8, v12);

}

- (void)pauseFaceDetectTimer:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 4, "-[BiometricKitXPCExportedObject pauseFaceDetectTimer:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v11)
      {
        v15 = v11;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v19 = 2048;
          v20 = v15;
          v21 = 2080;
          v22 = &unk_21491C593;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v25 = 1024;
          v26 = 2140;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      v12 = -[BiometricKitXPCServer pauseFaceDetectTimer:withClient:](self->_server, "pauseFaceDetectTimer:withClient:", v6, v10);
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "client";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = &unk_21491C593;
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v25 = 1024;
        v26 = 2139;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 22;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v25 = 1024;
      v26 = 2132;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 257;
  }
  v8[2](v8, v12);

}

- (void)getLastMatchEvent:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, id);
  void *v7;
  void *v8;
  int v9;
  BiometricKitXPCServer *server;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, id))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getLastMatchEvent:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v15 = v9;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v15;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 2163;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      v17 = 0;
      v11 = -[BiometricKitXPCServer getLastMatchEvent:withClient:](server, "getLastMatchEvent:withClient:", &v17, v8);
      v12 = v17;
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 2162;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 0;
      v11 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 2155;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 0;
    v11 = 257;
  }
  v6[2](v6, v11, v12);

}

- (void)getDeviceHardwareState:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getDeviceHardwareState:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer getDeviceHardwareState:withClient:](self->_server, "getDeviceHardwareState:withClient:", &v13, v8);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = "client";
        v16 = 2048;
        v17 = 0;
        v18 = 2080;
        v19 = &unk_21491C593;
        v20 = 2080;
        v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v22 = 1024;
        v23 = 2186;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v9 = 22;
    }

    objc_autoreleasePoolPop(v7);
    v10 = v13;
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = &unk_21491C593;
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v22 = 1024;
      v23 = 2178;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 0;
    v9 = 257;
  }
  v6[2](v6, v9, v10);

}

- (void)listAccessories:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, id);
  void *v7;
  void *v8;
  int v9;
  BiometricKitXPCServer *server;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, id))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject listAccessories:replyBlock:]"))
  {
    v7 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v9)
      {
        v15 = v9;
        if (__osLog)
          v16 = __osLog;
        else
          v16 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v20 = 2048;
          v21 = v15;
          v22 = 2080;
          v23 = &unk_21491C593;
          v24 = 2080;
          v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v26 = 1024;
          v27 = 2210;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      v17 = 0;
      v11 = -[BiometricKitXPCServer listAccessories:client:](server, "listAccessories:client:", &v17, v8);
      v12 = v17;
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = "client";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v26 = 1024;
        v27 = 2209;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 0;
      v11 = 22;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v26 = 1024;
      v27 = 2202;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 0;
    v11 = 257;
  }
  v6[2](v6, v11, v12);

}

- (void)getFreeIdentityCountForUser:(unsigned int)a3 accessoryGroup:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v8;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v8 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  v21 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject getFreeIdentityCountForUser:accessoryGroup:client:replyBlock:]"))
  {
    v12 = (void *)MEMORY[0x2199D8AE0]();
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[BiometricKitXPCServer loadCatacombAfterFirstUnlock](self->_server, "loadCatacombAfterFirstUnlock");
      if (v14)
      {
        v19 = v14;
        if (__osLog)
          v20 = __osLog;
        else
          v20 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v23 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          v24 = 2048;
          v25 = v19;
          v26 = 2080;
          v27 = &unk_21491C593;
          v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v30 = 1024;
          v31 = 2233;
          _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v15 = -[BiometricKitXPCServer getFreeIdentityCount:forUser:accessoryGroup:client:](self->_server, "getFreeIdentityCount:forUser:accessoryGroup:client:", &v21, v8, v10, v13);
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v23 = "client";
        v24 = 2048;
        v25 = 0;
        v26 = 2080;
        v27 = &unk_21491C593;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v30 = 1024;
        v31 = 2232;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v15 = 22;
    }

    objc_autoreleasePoolPop(v12);
    v16 = v21;
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_21491C593;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v30 = 1024;
      v31 = 2225;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v16 = 0;
    v15 = 257;
  }
  v11[2](v11, v15, v16);

}

- (void)getPreferencesValueForKey:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  BiometricKitXPCServer *server;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getPreferencesValueForKey:client:replyBlock:]"))
  {
    -[BiometricKitXPCExportedObject client:](self, "client:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)MEMORY[0x2199D8AE0]();
      server = self->_server;
      v19 = 0;
      v14 = -[BiometricKitXPCServer getPreferencesValue:forKey:withClient:](server, "getPreferencesValue:forKey:withClient:", &v19, v8, v11);
      v15 = v19;
      v16 = v15;
      if ((_DWORD)v14)
      {

        v16 = 0;
      }

      objc_autoreleasePoolPop(v12);
      v9[2](v9, v14, v16);

    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "client";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_21491C593;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v28 = 1024;
        v29 = 2332;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v9[2](v9, 22, 0);
    }
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v28 = 1024;
      v29 = 2330;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9[2](v9, 3758097122, 0);
  }

}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 5, "-[BiometricKitXPCExportedObject setPreferencesValue:forKey:client:replyBlock:]"))
  {
    -[BiometricKitXPCExportedObject client:](self, "client:", a5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)MEMORY[0x2199D8AE0]();
      if (!-[BiometricKitXPCServer setPreferencesValue:forKey:withClient:](self->_server, "setPreferencesValue:forKey:withClient:", v10, v11, v14))
      {
        if (__osLog)
          v19 = __osLog;
        else
          v19 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = "[self->_server setPreferencesValue:value forKey:key withClient:client]";
          v22 = 2048;
          v23 = 0;
          v24 = 2080;
          v25 = &unk_21491C593;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          v28 = 1024;
          v29 = 2366;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }

      objc_autoreleasePoolPop(v15);
      v16 = 0;
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316162;
        v21 = "client";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_21491C593;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        v28 = 1024;
        v29 = 2359;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      v16 = 22;
    }
  }
  else
  {
    v16 = 3758097122;
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "[self isClient:clientID entitled:kBioPermissionGroupConfig forMethod:__PRETTY_FUNCTION__]";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      v28 = 1024;
      v29 = 2357;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
  }
  v12[2](v12, v16);

}

- (BiometricKitXPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  self->_server = (BiometricKitXPCServer *)a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setClientEntitlement:(int)a3
{
  self->_clientEntitlement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
