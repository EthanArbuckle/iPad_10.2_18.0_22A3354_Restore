@implementation ACCiAP2ShimServerClient

- (ACCiAP2ShimServerClient)initWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 xpcConnection:(id)a5 eaProtocols:(id)a6 andBundleId:(id)a7
{
  id v13;
  id v14;
  id v15;
  ACCiAP2ShimServerClient *v16;
  ACCiAP2ShimServerClient *v17;
  __int128 v18;
  uint64_t v19;
  NSString *bundleId;
  dispatch_queue_t v21;
  OS_dispatch_queue *processAssertionQ;
  uint64_t v23;
  NSArray *clientEAProtocols;
  __int128 v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  NSObject *v34;
  id v35;
  const char *v36;
  NSObject *v37;
  id v38;
  _BOOL4 entitlementForAllAccessories;
  dispatch_source_t v40;
  OS_dispatch_source *processAssertionTimer;
  NSObject *v42;
  ACCiAP2ShimServerClient *v43;
  __int128 v44;
  BOOL v45;
  _QWORD handler[4];
  ACCiAP2ShimServerClient *v48;
  objc_super v49;
  _BYTE buf[32];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)ACCiAP2ShimServerClient;
  v16 = -[ACCiAP2ShimServerClient init](&v49, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_capabilities = a3;
    v16->_iapSessionRefCount = 0;
    v18 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v16->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v16->_auditToken.val[4] = v18;
    objc_storeStrong((id *)&v16->_xpcConnection, a5);
    v19 = objc_msgSend(v15, "copy");
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v19;

    v17->_processId = -1;
    v21 = dispatch_queue_create("IAPEAClient Process Assertion Queue", 0);
    processAssertionQ = v17->_processAssertionQ;
    v17->_processAssertionQ = (OS_dispatch_queue *)v21;

    v17->_clientRequiresAccReset = 0;
    v17->_entitlementForAllAccessories = 0;
    v17->_processAssertion = 0;
    v17->_processAssertionStartTime = 0;
    v23 = objc_msgSend(v14, "copy");
    clientEAProtocols = v17->_clientEAProtocols;
    v17->_clientEAProtocols = (NSArray *)v23;

    v25 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    *(_OWORD *)&buf[16] = v25;
    v17->_entitlementForAllAccessories = __hasEntitlementForAuditToken(CFSTR("com.apple.private.externalaccessory.showallaccessories"), buf);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v26 = MEMORY[0x24BDACB70];
      v27 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl(&dword_217DCB000, v26, OS_LOG_TYPE_INFO, "[#ServerClient] INIT - capability=0x%x", buf, 8u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v28 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v28 = MEMORY[0x24BDACB70];
      v29 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v30 = "YES";
      if ((a3 & 0x10) == 0)
        v30 = "NO";
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl(&dword_217DCB000, v28, OS_LOG_TYPE_INFO, "[#ServerClient] %@ supports EA while suspended = %s", buf, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v31 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v31 = MEMORY[0x24BDACB70];
      v32 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v33 = "YES";
      if ((a3 & 0x20) == 0)
        v33 = "NO";
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v33;
      _os_log_impl(&dword_217DCB000, v31, OS_LOG_TYPE_INFO, "[#ServerClient] %@ supports EA while backgrounded = %s", buf, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v34 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v34 = MEMORY[0x24BDACB70];
      v35 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v36 = "YES";
      if ((a3 & 0x8000) == 0)
        v36 = "NO";
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v36;
      _os_log_impl(&dword_217DCB000, v34, OS_LOG_TYPE_INFO, "[#ServerClient] %@ supports Application state = %s", buf, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v37 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v37 = MEMORY[0x24BDACB70];
      v38 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      entitlementForAllAccessories = v17->_entitlementForAllAccessories;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = entitlementForAllAccessories;
      _os_log_impl(&dword_217DCB000, v37, OS_LOG_TYPE_INFO, "[#ServerClient] _entitlementForAllAccessories = %d", buf, 8u);
    }

    v40 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v17->_processAssertionQ);
    processAssertionTimer = v17->_processAssertionTimer;
    v17->_processAssertionTimer = (OS_dispatch_source *)v40;

    v42 = v17->_processAssertionTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __97__ACCiAP2ShimServerClient_initWithCapabilities_auditToken_xpcConnection_eaProtocols_andBundleId___block_invoke;
    handler[3] = &unk_24D9060B8;
    v43 = v17;
    v48 = v43;
    dispatch_source_set_event_handler(v42, handler);
    dispatch_source_set_timer((dispatch_source_t)v17->_processAssertionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v17->_processAssertionTimer);
    v45 = 0;
    if ((v17->_capabilities & 2) != 0)
    {
      v44 = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)buf = *(_OWORD *)a4->var0;
      *(_OWORD *)&buf[16] = v44;
      if (__hasEntitlementForAuditToken(CFSTR("com.apple.iapd.accessibility"), buf))
        v45 = 1;
    }
    v43->_supportsAccessibility = v45;

  }
  return v17;
}

void __97__ACCiAP2ShimServerClient_initWithCapabilities_auditToken_xpcConnection_eaProtocols_andBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72))
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
      v8[0] = 67109376;
      v8[1] = v7;
      v9 = 1024;
      v10 = v6;
      _os_log_impl(&dword_217DCB000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] releasing process assertion - clientID=%d pid=%d", (uint8_t *)v8, 0xEu);
    }

    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 72));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 88), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  unsigned int clientID;
  NSObject *processAssertionTimer;
  OS_dispatch_source *v8;
  NSObject *processAssertionQ;
  OS_dispatch_queue *v10;
  OS_xpc_object *xpcConnection;
  NSString *bundleId;
  NSArray *clientEAProtocols;
  objc_super v14;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 67109120;
    v17 = clientID;
    _os_log_impl(&dword_217DCB000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] DEALLOC - clientID=%d", buf, 8u);
  }

  processAssertionTimer = self->_processAssertionTimer;
  if (processAssertionTimer)
  {
    dispatch_source_cancel(processAssertionTimer);
    v8 = self->_processAssertionTimer;
    self->_processAssertionTimer = 0;

  }
  processAssertionQ = self->_processAssertionQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ACCiAP2ShimServerClient_dealloc__block_invoke;
  block[3] = &unk_24D9060B8;
  block[4] = self;
  dispatch_sync(processAssertionQ, block);
  self->_processAssertionStartTime = 0;
  dispatch_sync((dispatch_queue_t)self->_processAssertionQ, &__block_literal_global_0);
  v10 = self->_processAssertionQ;
  self->_processAssertionQ = 0;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  bundleId = self->_bundleId;
  self->_bundleId = 0;

  clientEAProtocols = self->_clientEAProtocols;
  self->_clientEAProtocols = 0;

  v14.receiver = self;
  v14.super_class = (Class)ACCiAP2ShimServerClient;
  -[ACCiAP2ShimServerClient dealloc](&v14, sel_dealloc);
}

void __34__ACCiAP2ShimServerClient_dealloc__block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCiAP2ShimServerClient>[clientID=%u bundId=%@ capabilities=%xh supported: location=%d camera=%d accessibility=%d, requiredAccReset=%d]"), self->_clientID, self->_bundleId, self->_capabilities, self->_locationSupportedByClient, self->_cameraSupportedByClient, self->_supportsAccessibility, self->_clientRequiresAccReset);
}

- (void)takeProcessAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSString *bundleId;
  int processId;
  NSObject *v13;
  id v14;
  NSString *v15;
  int v16;
  int v17;
  NSString *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_processAssertion)
  {
LABEL_7:
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      bundleId = self->_bundleId;
      processId = self->_processId;
      v17 = 138412546;
      v18 = bundleId;
      v19 = 1024;
      v20 = processId;
      _os_log_impl(&dword_217DCB000, v10, OS_LOG_TYPE_INFO, "[#ServerClient] creating process assertion - appId=%@ pid=%d", (uint8_t *)&v17, 0x12u);
    }

    self->_processAssertion = (SBSProcessAssertion *)SBSProcessAssertionCreateForPID();
    self->_processAssertionStartTime = time(0);
    goto LABEL_35;
  }
  if (time(0) - self->_processAssertionStartTime >= 3)
  {
    if (self->_processAssertion)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v5 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v15 = self->_bundleId;
        v16 = self->_processId;
        v17 = 138412546;
        v18 = v15;
        v19 = 1024;
        v20 = v16;
        _os_log_impl(&dword_217DCB000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] renewing process assertion - appId=%@ pid=%d", (uint8_t *)&v17, 0x12u);
      }

      self->_processAssertionStartTime = 0;
      goto LABEL_35;
    }
    goto LABEL_7;
  }
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_217DCB000, v13, OS_LOG_TYPE_INFO, "[#ServerClient] using ea process hysteresis", (uint8_t *)&v17, 2u);
  }

LABEL_35:
}

- (void)releaseProcessAssertion
{
  SBSProcessAssertion *processAssertion;
  SBSProcessAssertion **p_processAssertion;

  p_processAssertion = &self->_processAssertion;
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    CFRelease(processAssertion);
    *p_processAssertion = 0;
    p_processAssertion[1] = 0;
  }
}

- (BOOL)canSendConnectionEventForAccessory:(id)a3
{
  id v4;
  char v5;
  char v6;
  __int16 v7;
  unsigned int v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSString *bundleId;
  unsigned int v13;
  unsigned int v14;
  _BOOL4 v15;
  unsigned int v16;
  _BOOL4 v17;
  NSObject *v18;
  id v19;
  NSString *v20;
  _BOOL4 entitlementForAllAccessories;
  int v22;
  unsigned int v23;
  id v25;
  void *v26;
  unsigned int v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  NSString *v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  _BOOL4 v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ACCiAP2ShimServerClient capabilities](self, "capabilities");
  v6 = -[ACCiAP2ShimServerClient capabilities](self, "capabilities");
  v7 = -[ACCiAP2ShimServerClient capabilities](self, "capabilities");
  v8 = -[ACCiAP2ShimServerClient applicationState](self, "applicationState");
  v27 = -[ACCiAP2ShimServerClient applicationState](self, "applicationState");
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE4F910]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (-[NSArray count](self->_clientEAProtocols, "count"))
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke;
    v28[3] = &unk_24D906128;
    v28[4] = self;
    v28[5] = &v29;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v28);
    if (!*((_BYTE *)v30 + 24))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        bundleId = self->_bundleId;
        *(_DWORD *)buf = 138412290;
        v34 = bundleId;
        _os_log_impl(&dword_217DCB000, v10, OS_LOG_TYPE_DEFAULT, "[#ServerClient] No protocols found for client %@", buf, 0xCu);
      }

    }
  }
  if (*((_BYTE *)v30 + 24) || self->_entitlementForAllAccessories)
  {
    v13 = v6 & 0x20;
    v14 = v7 & 0x8000;
    v15 = 1;
    v16 = v5 & 0x10;
    if ((v5 & 0x10) == 0 && v7 < 0)
    {
      v17 = v8 == 4;
      if (v27 > 4)
        v17 = 1;
      if (!v13)
        v17 = 0;
      v15 = v27 > 4 || v17;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v25 = v4;
      v26 = v9;
      v20 = self->_bundleId;
      entitlementForAllAccessories = self->_entitlementForAllAccessories;
      v22 = *((unsigned __int8 *)v30 + 24);
      v23 = -[ACCiAP2ShimServerClient applicationState](self, "applicationState");
      *(_DWORD *)buf = 138414594;
      v34 = v20;
      v35 = 1024;
      v36 = v16 >> 4;
      v37 = 1024;
      v38 = v13 >> 5;
      v39 = 1024;
      v40 = v8 == 4;
      v41 = 1024;
      v42 = v27 > 4;
      v43 = 1024;
      v44 = v14 >> 15;
      v45 = 1024;
      v46 = entitlementForAllAccessories;
      v47 = 1024;
      v48 = v22;
      v49 = 1024;
      v50 = v23;
      v51 = 1024;
      v52 = v15;
      _os_log_impl(&dword_217DCB000, v18, OS_LOG_TYPE_INFO, "[#ServerClient] bundleID %@ supportsEAWhenSuspended = %d, supportsEAInBackground = %d, clientAppStateInBackground = %d, clientAppStateInForeground = %d, clientLinksUIApplication = %d, _entitlementForAllAccessories = %d, anyProtocolFound = %d, self.applicationState = 0x%X, canSendConnectionEvent = %d", buf, 0x42u);
      v4 = v25;
      v9 = v26;
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke_2;
  v10[3] = &unk_24D906100;
  v11 = v6;
  if (objc_msgSend(v7, "indexOfObjectPassingTest:", v10) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_217DCB000, v8, OS_LOG_TYPE_INFO, "[#ServerClient] protocol %@ found from accessory", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

BOOL __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

- (BOOL)hasEntitlementForAllAccessories
{
  return self->_entitlementForAllAccessories;
}

- (id)_applicationInfoForBundleIDSync:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _getApplicationStateMonitor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationInfoForApplication:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)processId
{
  int result;
  void *v4;
  void *v5;
  int v6;

  result = self->_processId;
  if (result == -1)
  {
    self->_processId = 0;
    if (self->_bundleId)
    {
      -[ACCiAP2ShimServerClient _applicationInfoForBundleIDSync:](self, "_applicationInfoForBundleIDSync:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE0B4F0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntegerValue");

      self->_processId = v6;
      return self->_processId;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[3].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (BOOL)locationSupportedByClient
{
  return self->_locationSupportedByClient;
}

- (void)setLocationSupportedByClient:(BOOL)a3
{
  self->_locationSupportedByClient = a3;
}

- (BOOL)cameraSupportedByClient
{
  return self->_cameraSupportedByClient;
}

- (void)setCameraSupportedByClient:(BOOL)a3
{
  self->_cameraSupportedByClient = a3;
}

- (BOOL)supportsAccessibility
{
  return self->_supportsAccessibility;
}

- (BOOL)clientRequiresAccReset
{
  return self->_clientRequiresAccReset;
}

- (void)setClientRequiresAccReset:(BOOL)a3
{
  self->_clientRequiresAccReset = a3;
}

- (BOOL)interestedInBLENotifications
{
  return self->_interestedInBLENotifications;
}

- (void)setInterestedInBLENotifications:(BOOL)a3
{
  self->_interestedInBLENotifications = a3;
}

- (BOOL)entitlementForAllAccessories
{
  return self->_entitlementForAllAccessories;
}

- (NSArray)clientEAProtocols
{
  return self->_clientEAProtocols;
}

- (OS_dispatch_queue)processAssertionQ
{
  return self->_processAssertionQ;
}

- (SBSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (int64_t)processAssertionStartTime
{
  return self->_processAssertionStartTime;
}

- (OS_dispatch_source)processAssertionTimer
{
  return self->_processAssertionTimer;
}

- (int)iapSessionRefCount
{
  return self->_iapSessionRefCount;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
  objc_storeStrong((id *)&self->_processAssertionQ, 0);
  objc_storeStrong((id *)&self->_clientEAProtocols, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
