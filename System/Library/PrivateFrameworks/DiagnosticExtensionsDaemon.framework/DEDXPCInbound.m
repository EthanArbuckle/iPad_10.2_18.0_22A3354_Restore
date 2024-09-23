@implementation DEDXPCInbound

- (DEDXPCInbound)initWithDelegate:(id)a3 senderPid:(id)a4
{
  id v6;
  id v7;
  DEDXPCInbound *v8;
  void *v9;
  os_log_t v10;
  OS_os_log *log;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DEDXPCInbound;
  v8 = -[DEDXPCInbound init](&v13, sel_init);
  if (v8)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create((const char *)objc_msgSend(v9, "loggingSubsystem"), "xpc-inbound");
    log = v8->_log;
    v8->_log = (OS_os_log *)v10;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_senderPid, a4);
  }

  return v8;
}

- (void)xpc_ping
{
  id v3;

  -[DEDXPCInbound delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpcInbound_ping:", self);

}

- (void)xpc_pong
{
  id v2;

  -[DEDXPCInbound delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcInbound_pong");

}

- (void)xpc_discoverAllAvailableDevices
{
  id v3;

  -[DEDXPCInbound delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpcInbound_discoverAllAvailableDevices:", self);

}

- (void)xpc_stopDeviceDiscovery
{
  id v3;

  -[DEDXPCInbound delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpcInbound_stopDeviceDiscovery:", self);

}

- (void)xpc_didDiscoverDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setTransport:", 2);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[DEDXPCInbound delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xpcInbound_didDiscoverDevices:", v4);

}

- (void)xpc_gotDeviceUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setTransport:", 2);
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcInbound_gotDeviceUpdate:", v4);

}

- (void)xpc_startPairSetupForDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcInbound_startPairSetupForDevice:fromInbound:", v4, self);

}

- (void)xpc_promptPINForDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcInbound_promptPINForDevice:", v4);

}

- (void)xpc_tryPIN:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xpcInbound_tryPIN:forDevice:fromInbound:", v7, v6, self);

}

- (void)xpc_successPINForDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcInbound_successPINForDevice:", v4);

}

- (void)xpc_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "setTransport:", 2);
  objc_msgSend(v11, "setAddress:", CFSTR("0"));
  -[DEDXPCInbound delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xpcInbound_startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", v13, v12, v11, v10, self);

}

- (void)xpc_didStartBugSessionWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  DEDSessionStartLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "(DEDXPCInbound) didStartBugSessionWithInfo", v9, 2u);
  }

  -[DEDXPCInbound delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    DEDSessionStartLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_didStartBugSessionWithInfo:].cold.1();

  }
  -[DEDXPCInbound delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xpcInbound_didStartBugSessionWithInfo:", v4);

}

- (void)xpc_hasActiveSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcInbound_hasActiveSession:fromInbound:", v4, self);

}

- (void)xpc_hasActiveSessionReply:(id)a3 isActive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xpcInbound_hasActiveSessionReply:isActive:", v6, v4);

}

- (void)xpc_didCancelSession:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_didAbortSessionWithID:", v6);

  }
}

- (void)xpc_listClientXPCConnections
{
  id v3;

  -[DEDXPCInbound delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_listClientXPCConnectionsFromInbound:", self);

}

- (void)xpc_listClientXPCConnectionsReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcInbound_listClientXPCConnectionsReply:", v4);

}

- (void)xpc_forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:", a3, v9, v8);

}

- (void)xpc_pingSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pingWithCallback:", 0);
  }

}

- (void)xpc_pongSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pong");

  }
}

- (void)xpc_listAvailableExtensionsForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listDiagnosticExtensionsWithCompletion:", 0);

  }
}

- (void)xpc_deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDXPCInbound delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v16 = (void *)objc_msgSend(v9, "copy");
    -[DEDXPCInbound delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "xpcInbound_sessionForIdentifier:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "supportsDiagnostics:", v16);

  }
}

- (void)xpc_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  void *v10;
  DEDExtensionIdentifier *v11;
  DEDExtensionIdentifier *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v17);
    v12 = v11;
    if (v11)
    {
      -[DEDExtensionIdentifier extensionIdentifier](v11, "extensionIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v13;
    }
    -[DEDXPCInbound delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "xpcInbound_sessionForIdentifier:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "startDiagnosticExtensionWithIdentifier:parameters:completion:", v17, v8, 0);

  }
}

- (void)xpc_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  DEDExtensionIdentifier *v14;
  DEDExtensionIdentifier *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[DEDXPCInbound delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v20);
    v15 = v14;
    if (v14)
    {
      -[DEDExtensionIdentifier extensionIdentifier](v14, "extensionIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();

      v20 = (id)v16;
    }
    -[DEDXPCInbound delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "xpcInbound_sessionForIdentifier:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "startDiagnosticExtensionWithIdentifier:parameters:deferRunUntil:completion:", v20, v10, v11, 0);

  }
}

- (void)xpc_finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "xpcInbound_sessionForIdentifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishedDiagnosticWithIdentifier:result:", v14, v13);

  }
}

- (void)xpc_terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xpcInbound_sessionForIdentifier:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSObject terminateExtension:withInfo:](v13, "terminateExtension:withInfo:", v8, v9);
    }
    else
    {
      -[DEDXPCInbound log](self, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DEDXPCInbound xpc_terminateExtension:info:session:].cold.2((uint64_t)v8, v14);

    }
  }
  else
  {
    -[DEDXPCInbound log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_terminateExtension:info:session:].cold.1();
  }

}

- (void)xpc_getSessionStateWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xpcInbound_sessionForIdentifier:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSObject getStateWithCompletion:](v7, "getStateWithCompletion:", 0);
    }
    else
    {
      -[DEDXPCInbound log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v4;
        _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "no session found for identifier [%{public}@]. Cannot get state.", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    -[DEDXPCInbound log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_getSessionStateWithSession:].cold.1();
  }

}

- (void)xpc_didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "xpcInbound_sessionForIdentifier:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NSObject didGetState:info:](v12, "didGetState:info:", a3, v8);
    }
    else
    {
      -[DEDXPCInbound log](self, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = v9;
        _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "no session found for identifier [%{public}@]. Cannot reply with state", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    -[DEDXPCInbound log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_didGetState:info:sessionID:].cold.1();
  }

}

- (void)xpc_getSessionStatusWithSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getSessionStatusWithCompletion:", 0);

  }
}

- (void)xpc_syncSessionStatusWithSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronizeSessionStatusWithCompletion:", 0);

  }
}

- (void)xpc_hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    objc_msgSend(v8, "ded_mapWithBlock:", &__block_literal_global_33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ded_mapWithBlock:", &__block_literal_global_15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDXPCInbound delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "xpcInbound_sessionForIdentifier:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hasCollected:isCollecting:", v12, v11);

  }
}

DEDExtension *__57__DEDXPCInbound_xpc_hasCollected_isCollecting_inSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

DEDAttachmentGroup *__57__DEDXPCInbound_xpc_hasCollected_isCollecting_inSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", a2);
}

- (void)xpc_hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[DEDXPCInbound delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    objc_msgSend(v10, "ded_mapWithBlock:", &__block_literal_global_16_0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ded_mapWithBlock:", &__block_literal_global_17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ded_mapWithBlock:", &__block_literal_global_18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDXPCInbound delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "xpcInbound_sessionForIdentifier:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hasCollected:isCollecting:identifiers:", v15, v14, v16);

  }
}

DEDExtension *__73__DEDXPCInbound_xpc_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

DEDAttachmentGroup *__73__DEDXPCInbound_xpc_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", a2);
}

DEDExtensionIdentifier *__73__DEDXPCInbound_xpc_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  DEDExtensionIdentifier *v3;

  v2 = a2;
  v3 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v2);

  return v3;
}

- (void)xpc_adoptFiles:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[DEDXPCInbound delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject xpcInbound_sessionForIdentifier:](v9, "xpcInbound_sessionForIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adoptFiles:withCompletion:", v6, 0);

  }
  else
  {
    -[DEDXPCInbound log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_adoptFiles:forSession:].cold.1();
  }

}

- (void)xpc_didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[DEDXPCInbound delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject xpcInbound_sessionForIdentifier:](v9, "xpcInbound_sessionForIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didAdoptFilesWithError:", v6);

  }
  else
  {
    -[DEDXPCInbound log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_didAdoptFilesWithError:forSession:].cold.1();
  }

}

- (void)xpc_uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uploadProgress:total:", a3, a4);
}

- (void)xpc_compressionProgress:(unint64_t)a3 total:(unint64_t)a4 session:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "compressionProgress:total:", a3, a4);
}

- (void)xpc_commitSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commit");

  }
}

- (void)xpc_didCommitSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didCommit");

  }
}

- (void)xpc_cancelSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

  }
}

- (void)xpc_notifySession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleNotification");

  }
}

- (void)xpc_cancelNotifySession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDXPCInbound delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearNotification");

  }
}

- (void)xpc_addData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDXPCInbound delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DEDXPCInbound delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xpcInbound_sessionForIdentifier:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSObject addData:withFilename:](v13, "addData:withFilename:", v8, v9);
    }
    else
    {
      -[DEDXPCInbound log](self, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v10;
        _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "no session found for identifier [%{public}@]. Cannot send data.", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    -[DEDXPCInbound log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DEDXPCInbound xpc_addData:withFilename:forSession:].cold.1();
  }

}

- (void)xpc_loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "ded_flatMapWithBlock:", &__block_literal_global_20);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "loadTextDataForExtensions:localization:completion:", v12, v9, 0);
}

DEDExtension *__70__DEDXPCInbound_xpc_loadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

- (void)xpc_didLoadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "ded_flatMapWithBlock:", &__block_literal_global_21_0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDXPCInbound delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "didLoadTextDataForExtensions:localization:", v12, v9);
}

DEDExtension *__73__DEDXPCInbound_xpc_didLoadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

- (NSNumber)senderPid
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSenderPid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DEDXPCInboundDelegate)delegate
{
  return (DEDXPCInboundDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_senderPid, 0);
}

- (void)xpc_didStartBugSessionWithInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "(DEDXPCInbound) Delegate is nil, cannot ACK session start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpc_terminateExtension:info:session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "no delegate in XPC Inbound", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpc_terminateExtension:(uint64_t)a1 info:(NSObject *)a2 session:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "no session found for identifier [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)xpc_getSessionStateWithSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "no delegate in XPC Inbound. Cannot get state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpc_didGetState:info:sessionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "no delegate in XPC Inbound. Cannot reply with state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpc_adoptFiles:forSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "No delegate. Will not adopt files.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpc_didAdoptFilesWithError:forSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "No delegate. Will not reply to adopt files.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)xpc_addData:withFilename:forSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "no delegate in XPC Inbound. Cannot add session data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

@end
