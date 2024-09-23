@implementation DEDIDSInbound

- (DEDIDSInbound)init
{
  DEDIDSInbound *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DEDIDSInbound;
  v2 = -[DEDIDSInbound init](&v5, sel_init);
  if (v2)
  {
    Log_2();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[DEDIDSInbound init].cold.1();

  }
  return v2;
}

- (DEDIDSInbound)initWithConnection:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  DEDIDSInbound *v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(DEDIDSInbound);

  if (v8)
  {
    -[DEDIDSInbound setConnection:](v8, "setConnection:", v6);
    -[DEDIDSInbound setDelegate:](v8, "setDelegate:", v7);
  }

  return v8;
}

- (void)logMalformedMessage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Error in sending previous message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_4 != -1)
    dispatch_once(&archivedClasses_onceToken_4, &__block_literal_global_18);
  return (id)archivedClasses__classes_2;
}

void __32__DEDIDSInbound_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[DEDExtensionIdentifier archivedClasses](DEDExtensionIdentifier, "archivedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v2);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)archivedClasses__classes_2;
  archivedClasses__classes_2 = v3;

}

- (void)local_device_query_callback:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  if (isKnownDevice(a4, v12))
  {
    Log_2();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[DEDIDSInbound local_device_query_callback:service:account:fromID:context:].cold.3();

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[DEDDevice deviceWithDictionary:](DEDDevice, "deviceWithDictionary:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject setTransport:](v16, "setTransport:", 4);
      -[NSObject setRemoteTransport:](v16, "setRemoteTransport:", 4);
      -[NSObject setAddress:](v16, "setAddress:", v12);
      Log_2();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject identifier](v16, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "serviceIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v18;
        v25 = 2114;
        v26 = v19;
        _os_log_impl(&dword_21469E000, v17, OS_LOG_TYPE_DEFAULT, "local_device_query_callback: IDS device ready [%{public}@] on service [%{public}@]", (uint8_t *)&v23, 0x16u);

      }
      -[DEDIDSInbound connection](self, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        Log_2();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[DEDIDSInbound local_device_query_callback:service:account:fromID:context:].cold.2();

      }
      -[DEDIDSInbound connection](self, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "incomingDeviceReceived:", v16);

    }
    else
    {
      Log_2();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DEDIDSInbound local_device_query_callback:service:account:fromID:context:].cold.1();
    }

  }
}

- (void)start_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "start_session", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("config"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("callingDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("targetDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTransport:", 4);
    objc_msgSend(v15, "setAddress:", v11);
    -[DEDIDSInbound delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "idsInbound_startBugSessionWithIdentifier:configuration:caller:target:", v17, v14, v15, v16);

  }
}

- (void)did_start_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v10 = a3;
  if (isKnownDevice(a4, a6))
  {
    Log_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "did_start_session", v14, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDIDSInbound delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "idsInbound_didStartBugSessionWithInfo:", v12);

  }
}

- (void)session_ping:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "session_ping", v18, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pingWithCallback:", 0);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)session_pong:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "session_pong", v18, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pong");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)remote_list_DE:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "remote_list_DE", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "listDiagnosticExtensionsWithCompletion:", 0);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)device_supports_diagnostic_extensions:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (isKnownDevice(a4, a6))
  {
    Log_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "device_supports_diagnostic_extensions", buf, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("getDEList"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v18);
      }

      v22 = (void *)objc_msgSend(v15, "copy");
      -[DEDIDSInbound delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "idsInbound_sessionForIdentifier:", v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "supportsDiagnostics:", v22);

      }
    }

  }
}

- (void)start_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  DEDExtensionIdentifier *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint8_t buf[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "start_diagnostic_with_identifier", buf, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerDE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerDEParams"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerDERunDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v26 = v17;
        v20 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v16);
        -[DEDIDSInbound delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "idsInbound_sessionForIdentifier:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDExtensionIdentifier extensionIdentifier](v20, "extensionIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          v24 = (id)objc_msgSend(v22, "startDiagnosticExtensionWithIdentifier:parameters:deferRunUntil:completion:", v23, v26, v18, 0);
        else
          v25 = (id)objc_msgSend(v22, "startDiagnosticExtensionWithIdentifier:parameters:completion:", v23, v26, 0);

        v17 = v26;
      }

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)finished_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "finished_diagnostic_with_identifier", v22, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerDE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("finishedDEDGroups"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[DEDIDSInbound delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "finishedDiagnosticWithIdentifier:result:", v16, v18);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)remote_device_query_request:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  if (isKnownDevice(a4, v9))
  {
    Log_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "remote_device_query_request from %@", buf, 0xCu);
    }

    +[DEDDevice currentDeviceWithDaemonInfo](DEDDevice, "currentDeviceWithDaemonInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v11, "serialize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;

    if (v15)
    {
      Log_2();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DEDIDSInbound remote_device_query_request:service:account:fromID:context:].cold.1();
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject sendMessage:withData:forIDSDeviceID:isResponse:](v16, "sendMessage:withData:forIDSDeviceID:isResponse:", 1, v14, v9, 1);
    }

  }
}

- (void)terminate_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "terminate_diagnostic_with_identifier", v21, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerDE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerDEParams"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject idsInbound_sessionForIdentifier:](v19, "idsInbound_sessionForIdentifier:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "terminateExtension:withInfo:", v16, v17);

      }
      else
      {
        Log_2();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[DEDIDSInbound terminate_diagnostic_with_identifier:service:account:fromID:context:].cold.1();
      }

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)get_session_state:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "get_session_state", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getStateWithCompletion:", 0);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)did_get_session_state:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_get_session_state", v22, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sessionState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sessionStateInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "didGetState:info:", v17, v18);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v18, v11, 0);
    }

  }
}

- (void)add_session_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "add_session_data", v21, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sessionData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sessionDataFilename"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "idsInbound_sessionForIdentifier:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addData:withFilename:", v16, v17);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)get_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "get_session_status", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getSessionStatusWithCompletion:", 0);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)sync_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "sync_session_status", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "synchronizeSessionStatusWithCompletion:", 0);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)did_get_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v23[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_get_session_status", v23, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("finishedDEDGroups"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_49);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("runningDEs"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ded_mapWithBlock:", &__block_literal_global_52);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[DEDIDSInbound delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "idsInbound_sessionForIdentifier:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hasCollected:isCollecting:", v17, v19);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

  }
}

DEDAttachmentGroup *__71__DEDIDSInbound_did_get_session_status_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", a2);
}

DEDExtension *__71__DEDIDSInbound_did_get_session_status_service_account_fromID_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

- (void)did_sync_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_sync_session_status", v25, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("finishedDEDGroups"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_53);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("runningDEs"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ded_mapWithBlock:", &__block_literal_global_54);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("extensionIdentifiers"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ded_mapWithBlock:", &__block_literal_global_57);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[DEDIDSInbound delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "idsInbound_sessionForIdentifier:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hasCollected:isCollecting:identifiers:", v17, v19, v21);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

  }
}

DEDAttachmentGroup *__72__DEDIDSInbound_did_sync_session_status_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:](DEDAttachmentGroup, "groupWithDictionary:", a2);
}

DEDExtension *__72__DEDIDSInbound_did_sync_session_status_service_account_fromID_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

DEDExtensionIdentifier *__72__DEDIDSInbound_did_sync_session_status_service_account_fromID_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  DEDExtensionIdentifier *v3;

  v2 = a2;
  v3 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v2);

  return v3;
}

- (void)adopt_files:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "adopt_files", v20, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("filesForAdopt"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      Log_2();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[DEDIDSInbound adopt_files:service:account:fromID:context:].cold.1();

      -[DEDIDSInbound delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "idsInbound_sessionForIdentifier:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "adoptFiles:withCompletion:", v16, 0);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)did_adopt_files:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_adopt_files", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("error"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didAdoptFilesWithError:", v16);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)upload_progress:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      Log_2();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[DEDIDSInbound upload_progress:service:account:fromID:context:].cold.1();

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("uploadedBytes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "longLongValue");

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("totalBytes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "longLongValue");

      -[DEDIDSInbound delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uploadProgress:total:", v17, v19);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v23, v11, 0);

    }
  }

}

- (void)compression_progress:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      Log_2();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[DEDIDSInbound compression_progress:service:account:fromID:context:].cold.1();

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("compressedBytes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedLongLongValue");

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("totalBytes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedLongLongValue");

      -[DEDIDSInbound delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "compressionProgress:total:", v17, v19);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v23, v11, 0);

    }
  }

}

- (void)commit_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "commit_session", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "commit");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)did_commit_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_commit_session", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didCommit");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)cancel_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "cancel_session", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cancel");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)did_cancel_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_cancel_session", v18, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_didAbortSessionWithID:", v15);
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)schedule_notification:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "schedule_notification", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scheduleNotification");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)unschedule_notification:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "unschedule_notification", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clearNotification");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)present_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "present_notification_on_passthrough_daemon", v20, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_presentNotificationOnFilingDevice");

      -[DEDIDSInbound connection](self, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendMessage:withData:forIDSDeviceID:isResponse:", 28, v19, v11, 1);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v18, v11, 0);
    }

  }
}

- (void)did_present_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_present_notification_on_passthrough_daemon", v18, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_didPresentNotificationOnFilingDevice");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

- (void)remove_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "remove_notification_on_passthrough_daemon", v21, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "idsInbound_clearNotificationOnFilingDevice");

      }
      -[DEDIDSInbound connection](self, "connection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendMessage:withData:forIDSDeviceID:isResponse:", 29, v20, v11, 1);

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v19, v11, 0);
    }

  }
}

- (void)did_remove_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_remove_notification_on_passthrough_daemon", v19, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[DEDIDSInbound delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "idsInbound_didClearNotificationOnFilingDevice");

    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v17, v11, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)load_extension_text_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "load_extension_text_data", v22, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("localization"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("extensions"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ded_flatMapWithBlock:", &__block_literal_global_73);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "loadTextDataForExtensions:localization:completion:", v18, v16, 0);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

DEDExtension *__73__DEDIDSInbound_load_extension_text_data_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

- (void)did_load_extension_text_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v10 = a3;
  v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    Log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "did_load_extension_text_data", v22, 2u);
    }

    +[DEDIDSConnection unpackProtobuf:](DEDIDSConnection, "unpackProtobuf:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("localization"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("extensions"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ded_flatMapWithBlock:", &__block_literal_global_74);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDIDSInbound delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[DEDIDSInbound delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "didLoadTextDataForExtensions:localization:", v18, v16);

      }
    }
    else
    {
      -[DEDIDSInbound connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 0, v16, v11, 0);
    }

  }
}

DEDExtension *__77__DEDIDSInbound_did_load_extension_text_data_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", a2);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7;
  NSObject *v8;

  v7 = a6;
  IDSDelLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:incomingMessage:fromID:context:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7;
  NSObject *v8;

  v7 = a6;
  IDSDelLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:incomingData:fromID:context:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a5;
  v9 = a6;
  IDSDelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:incomingUnhandledProtobuf:fromID:context:].cold.1(v8, (uint64_t)v9, v10);

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a5;
  v9 = a6;
  IDSDelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:incomingResourceAtURL:fromID:context:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  IDSDelLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_debug_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEBUG, "incoming resource [%@] metadata [%@] from [%@]", (uint8_t *)&v14, 0x20u);
  }

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  IDSDelLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:activeAccountsChanged:].cold.1();

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  IDSDelLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Devices changed", (uint8_t *)&v10, 2u);
  }

  -[DEDIDSInbound delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "ded_mapWithBlock:", &__block_literal_global_76);
    v8 = objc_claimAutoreleasedReturnValue();
    -[DEDIDSInbound delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "idsInbound_devicesChanged:", v8);

  }
  else
  {
    IDSDelLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[DEDIDSInbound service:devicesChanged:]";
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "no delegate set for %s", (uint8_t *)&v10, 0xCu);
    }
  }

}

id __40__DEDIDSInbound_service_devicesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  DEDAddressForIDSDevice();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDDevice idsDeviceWithDevice:address:](DEDDevice, "idsDeviceWithDevice:address:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  IDSDelLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:nearbyDevicesChanged:].cold.1();

}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  IDSDelLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:connectedDevicesChanged:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v8 = a6;
  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a7;
  DEDIDSConnectionLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "serviceDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v11;
    v18 = 2114;
    v19 = v14;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "Did send IDS command with guid: [%{public}@] on service [%{public}@], success? [%i]", (uint8_t *)&v16, 0x1Cu);

  }
  if (v12)
  {
    IDSDelLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DEDIDSInbound service:account:identifier:didSendWithSuccess:error:].cold.1();

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v9 = a6;
  v23 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  DEDIDSConnectionLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "serviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v12;
    v19 = 2114;
    v20 = v15;
    v21 = 1024;
    v22 = v9;
    _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "Did send message with guid [%{public}@] on service [%{public}@], success? [%i]", (uint8_t *)&v17, 0x1Cu);

  }
  if (v13)
  {
    IDSDelLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DEDIDSInbound service:account:identifier:didSendWithSuccess:error:].cold.1();

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7
{
  id v9;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  IDSDelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134218498;
    v12 = a6;
    v13 = 2048;
    v14 = a7;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEBUG, "sent bytes [%li] total [%li] identifier [%@]", (uint8_t *)&v11, 0x20u);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v6;
  NSObject *v7;

  v6 = a5;
  IDSDelLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:identifier:hasBeenDeliveredWithContext:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a5;
  v9 = a6;
  IDSDelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:identifier:fromID:hasBeenDeliveredWithContext:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6
{
  id v6;
  NSObject *v7;

  v6 = a6;
  IDSDelLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:inviteReceivedForSession:fromID:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a6;
  v9 = a7;
  IDSDelLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:inviteReceivedForSession:fromID:withOptions:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v7;
  NSObject *v8;

  v7 = a6;
  IDSDelLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:inviteReceivedForSession:fromID:withContext:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5
{
  NSObject *v5;

  IDSDelLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:account:receivedGroupSessionParticipantUpdate:].cold.1();

}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  IDSDelLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound serviceSpaceDidBecomeAvailable:].cold.1();

}

- (void)serviceAllowedTrafficClassifiersDidReset:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  IDSDelLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound serviceAllowedTrafficClassifiersDidReset:].cold.1();

}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;

  v6 = a4;
  v7 = (void (**)(_QWORD))a5;
  IDSDelLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDIDSInbound service:didSwitchActivePairedDevice:acknowledgementBlock:].cold.1();

  v7[2](v7);
}

- (DEDIDSConnection)connection
{
  return (DEDIDSConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (DEDIDSInboundDelegate)delegate
{
  return (DEDIDSInboundDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "IDSService on DEDIDSInbound initialized.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)local_device_query_callback:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "no device payload on discovery reply from [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)local_device_query_callback:service:account:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "DEDIDSConnection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)local_device_query_callback:service:account:fromID:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "local_device_query_callback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)remote_device_query_request:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Error archiving serialized device with error: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)terminate_diagnostic_with_identifier:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "no delegate, can't perform _terminate_diagnostic", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)adopt_files:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "adopt_files API not supported via IDS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)upload_progress:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "upload_progress on session [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compression_progress:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "compression_progress on session [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "incoming message from [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingData:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "incoming data from [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:(NSObject *)a3 account:incomingUnhandledProtobuf:fromID:context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5[0] = 67109378;
  v5[1] = objc_msgSend(a1, "type");
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_21469E000, a3, OS_LOG_TYPE_DEBUG, "Incoming unhandled protobuf of type [%hu] from [%@]", (uint8_t *)v5, 0x12u);
}

- (void)service:account:incomingResourceAtURL:fromID:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_1(&dword_21469E000, v0, v1, "incoming resource [%@] from [%@]");
  OUTLINED_FUNCTION_1();
}

- (void)service:activeAccountsChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "Active Accounts changed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:nearbyDevicesChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "Nearby Devices changed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:connectedDevicesChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "Connected Devices changed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10(&dword_21469E000, v0, v1, "Error sending message: [%{public}@] error: [%{public}@]");
  OUTLINED_FUNCTION_1();
}

- (void)service:account:identifier:hasBeenDeliveredWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "identifier [%@] has been delivered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:identifier:fromID:hasBeenDeliveredWithContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_1(&dword_21469E000, v0, v1, "identifier [%@] from id [%@] has been delivered");
  OUTLINED_FUNCTION_1();
}

- (void)service:account:inviteReceivedForSession:fromID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "invite received from id [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:inviteReceivedForSession:fromID:withOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_1(&dword_21469E000, v0, v1, "invite received from id [%@] with options [%@]");
  OUTLINED_FUNCTION_1();
}

- (void)service:account:inviteReceivedForSession:fromID:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "invite received from id [%{public}@] with context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:receivedGroupSessionParticipantUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "received groupe participant update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)serviceSpaceDidBecomeAvailable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "service space became available [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)serviceAllowedTrafficClassifiersDidReset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "service traffic did reset [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:didSwitchActivePairedDevice:acknowledgementBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "did switch active paired device [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
