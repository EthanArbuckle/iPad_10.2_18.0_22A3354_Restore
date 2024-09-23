@implementation DEDIDSOutbound

- (int64_t)transportType
{
  return 4;
}

+ (id)outboundWithSessionID:(id)a3 withDeviceAtAddress:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  DEDIDSOutbound *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(DEDIDSOutbound);
  -[DEDIDSOutbound setConnection:](v10, "setConnection:", v7);

  -[DEDIDSOutbound setDeviceAddress:](v10, "setDeviceAddress:", v8);
  -[DEDIDSOutbound setSessionID:](v10, "setSessionID:", v9);

  return v10;
}

- (DEDIDSOutbound)init
{
  DEDIDSOutbound *v2;
  void *v3;
  os_log_t v4;
  OS_os_log *log;
  NSString *deviceAddress;
  NSString *sessionID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DEDIDSOutbound;
  v2 = -[DEDIDSOutbound init](&v9, sel_init);
  if (v2)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create((const char *)objc_msgSend(v3, "loggingSubsystem"), "ids-outbound");
    log = v2->_log;
    v2->_log = (OS_os_log *)v4;

    deviceAddress = v2->_deviceAddress;
    v2->_deviceAddress = 0;

    sessionID = v2->_sessionID;
    v2->_sessionID = 0;

  }
  return v2;
}

- (void)pingSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 10, v6, v7, 0);

}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && v9)
  {
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("sessionID"));
    objc_msgSend(v10, "setValue:forKey:", v14, CFSTR("triggerDE"));
  }
  if (v8)
    objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("triggerDEParams"));
  -[DEDIDSOutbound connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:withData:forIDSDeviceID:isResponse:", 12, v12, v13, 0);

}

- (void)pongSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 11, v6, v7, 0);

}

- (void)listAvailableExtensionsForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 2, v6, v7, 0);

}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "serialize", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("sessionID"));
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("getDEList"));
  -[DEDIDSOutbound connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:withData:forIDSDeviceID:isResponse:", 3, v17, v18, 0);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && v9)
  {
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("sessionID"));
    objc_msgSend(v10, "setValue:forKey:", v14, CFSTR("triggerDE"));
    objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("triggerDEParams"));
  }
  -[DEDIDSOutbound connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:withData:forIDSDeviceID:isResponse:", 4, v12, v13, 0);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && v12)
  {
    objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("sessionID"));
    objc_msgSend(v13, "setValue:forKey:", v17, CFSTR("triggerDE"));
    objc_msgSend(v13, "setValue:forKey:", v10, CFSTR("triggerDEParams"));
    objc_msgSend(v13, "setValue:forKey:", v11, CFSTR("triggerDERunDate"));
  }
  -[DEDIDSOutbound connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendMessage:withData:forIDSDeviceID:isResponse:", 4, v15, v16, 0);

}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v15 && v9)
  {
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("sessionID"));
    objc_msgSend(v10, "setValue:forKey:", v15, CFSTR("triggerDE"));
    objc_msgSend(v8, "serialize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("finishedDEDGroups"));

  }
  -[DEDIDSOutbound connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:withData:forIDSDeviceID:isResponse:", 5, v13, v14, 0);

}

- (void)getSessionStatusWithSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 13, v6, v7, 0);

}

- (void)getSessionStateWithSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 24, v6, v7, 0);

}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("sessionID"));
    objc_msgSend(v11, "setValue:forKey:", v15, CFSTR("sessionData"));
    objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("sessionDataFilename"));
  }
  -[DEDIDSOutbound connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:withData:forIDSDeviceID:isResponse:", 30, v13, v14, 0);

}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("sessionID"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("sessionState"));

    if (v8)
      v13 = v8;
    else
      v13 = (id)MEMORY[0x24BDBD1B8];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("sessionStateInfo"));
  }
  else
  {
    -[DEDIDSOutbound log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DEDIDSOutbound didGetState:info:sessionID:].cold.1(v14);

  }
  -[DEDIDSOutbound connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:withData:forIDSDeviceID:isResponse:", 25, v16, v17, 0);

}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && v9)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("sessionID"));
    objc_msgSend(v8, "ded_mapWithBlock:", &__block_literal_global_20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("runningDEs"));

    objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("finishedDEDGroups"));

  }
  -[DEDIDSOutbound connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:withData:forIDSDeviceID:isResponse:", 14, v14, v15, 0);

}

uint64_t __54__DEDIDSOutbound_hasCollected_isCollecting_inSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

uint64_t __54__DEDIDSOutbound_hasCollected_isCollecting_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
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
  void *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && v12)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("sessionID"));
    objc_msgSend(v10, "ded_mapWithBlock:", &__block_literal_global_39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("runningDEs"));

    objc_msgSend(v20, "ded_mapWithBlock:", &__block_literal_global_40_0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("finishedDEDGroups"));

    objc_msgSend(v11, "ded_mapWithBlock:", &__block_literal_global_41);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("extensionIdentifiers"));

  }
  -[DEDIDSOutbound connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:withData:forIDSDeviceID:isResponse:", 23, v18, v19, 0);

}

uint64_t __70__DEDIDSOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

uint64_t __70__DEDIDSOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

uint64_t __70__DEDIDSOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("filesForAdopt"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:withData:forIDSDeviceID:isResponse:", 15, v10, v11, 0);

}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("error"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:withData:forIDSDeviceID:isResponse:", 16, v10, v11, 0);

}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  objc_msgSend(v8, "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("sessionID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("uploadedBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("totalBytes"));

  -[DEDIDSOutbound connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:withData:forIDSDeviceID:isResponse:", 17, v13, v14, 0);

}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  objc_msgSend(v8, "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("sessionID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("compressedBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("totalBytes"));

  -[DEDIDSOutbound connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:withData:forIDSDeviceID:isResponse:", 32, v13, v14, 0);

}

- (void)commitSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 18, v6, v7, 0);

}

- (void)didCommitSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 19, v6, v7, 0);

}

- (void)cancelSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 20, v6, v7, 0);

}

- (void)syncSessionStatusWithSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 22, v6, v7, 0);

}

- (void)didCancelSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 21, v6, v7, 0);

}

- (void)scheduleNotificationForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 26, v6, v7, 0);

}

- (void)unscheduleNotificationForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 27, v6, v7, 0);

}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("sessionID"));
    objc_msgSend(v16, "ded_flatMapWithBlock:", &__block_literal_global_55);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("extensions"));
    objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("localization"));

  }
  -[DEDIDSOutbound connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:withData:forIDSDeviceID:isResponse:", 31, v14, v15, 0);

}

uint64_t __67__DEDIDSOutbound_loadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("sessionID"));
    objc_msgSend(v16, "ded_flatMapWithBlock:", &__block_literal_global_60);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("extensions"));
    objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("localization"));

  }
  -[DEDIDSOutbound connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:withData:forIDSDeviceID:isResponse:", 31, v14, v15, 1);

}

uint64_t __68__DEDIDSOutbound_didLoadTextDataForExtensions_localization_session___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

- (void)presentNotificationForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 28, v6, v7, 0);

}

- (void)removeNotificationForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("sessionID"));
  -[DEDIDSOutbound connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDIDSConnection packPayload:](DEDIDSConnection, "packPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDIDSOutbound deviceAddress](self, "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withData:forIDSDeviceID:isResponse:", 29, v6, v7, 0);

}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_5 != -1)
    dispatch_once(&archivedClasses_onceToken_5, &__block_literal_global_62);
  return (id)archivedClasses__outboundClasses_0;
}

void __33__DEDIDSOutbound_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[DEDExtension archivedClasses](DEDExtension, "archivedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unionSet:", v8);

  +[DEDAttachmentGroup archivedClasses](DEDAttachmentGroup, "archivedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unionSet:", v9);

  +[DEDExtensionIdentifier archivedClasses](DEDExtensionIdentifier, "archivedClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unionSet:", v10);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v13);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)archivedClasses__outboundClasses_0;
  archivedClasses__outboundClasses_0 = v11;

}

- (DEDIDSConnection)connection
{
  return (DEDIDSConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (NSString)deviceAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)didGetState:(os_log_t)log info:sessionID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "Session ID is nil cannot send state update", v1, 2u);
}

@end
