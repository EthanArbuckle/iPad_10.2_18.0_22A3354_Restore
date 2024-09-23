@implementation DEDSharingOutbound

- (int64_t)transportType
{
  return 3;
}

- (DEDSharingOutbound)initWithID:(id)a3 withSFSession:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  DEDSharingOutbound *v11;
  void *v12;
  os_log_t v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DEDSharingOutbound;
  v11 = -[DEDSharingOutbound init](&v15, sel_init);
  if (v11)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = os_log_create((const char *)objc_msgSend(v12, "loggingSubsystem"), "sharing-outbound");
    -[DEDSharingOutbound setLog:](v11, "setLog:", v13);

    -[DEDSharingOutbound setIdentifier:](v11, "setIdentifier:", v8);
    -[DEDSharingOutbound setSession:](v11, "setSession:", v9);
    -[DEDSharingOutbound setConnection:](v11, "setConnection:", v10);
  }

  return v11;
}

- (id)basePayloadForCommand:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("callingDevice"));

  -[DEDSharingOutbound identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("sessionID"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("session"));
  return v6;
}

- (void)pingSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound session](self, "session", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("ping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendWithFlags:object:", 0, v4);

}

- (void)pongSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound session](self, "session", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("pong"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendWithFlags:object:", 0, v4);

}

- (void)listAvailableExtensionsForSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound session](self, "session", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("listExtensions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendWithFlags:object:", 0, v4);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("startDiagnostic"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("parameters"));
  -[DEDSharingOutbound session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendWithFlags:object:", 0, v10);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("startDiagnostic"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("parameters"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("deferDate"));

  -[DEDSharingOutbound session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendWithFlags:object:", 0, v13);

}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("terminateExtension"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("info"));
  -[DEDSharingOutbound session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendWithFlags:object:", 0, v10);

}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("supportsExtensions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "serialize", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("extensions"));
  -[DEDSharingOutbound session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendWithFlags:object:", 0, v6);

}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("finishedDiagnostic"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

  objc_msgSend(v7, "serialize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("group"));
  -[DEDSharingOutbound session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendWithFlags:object:", 0, v11);

}

- (void)getSessionStatusWithSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("getStatus"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)getSessionStateWithSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("getState"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v7 = a4;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("didGetState"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

  if (v7)
    v9 = v7;
  else
    v9 = (id)MEMORY[0x24BDBD1B8];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("info"));

  -[DEDSharingOutbound session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendWithFlags:object:", 0, v11);

}

- (void)syncSessionStatusWithSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("syncStatus"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("didGetStatus"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ded_mapWithBlock:", &__block_literal_global_31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("extensions"));
  objc_msgSend(v8, "ded_mapWithBlock:", &__block_literal_global_57_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("groups"));
  -[DEDSharingOutbound session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendWithFlags:object:", 0, v12);

}

uint64_t __58__DEDSharingOutbound_hasCollected_isCollecting_inSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

uint64_t __58__DEDSharingOutbound_hasCollected_isCollecting_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("didSyncStatus"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ded_mapWithBlock:", &__block_literal_global_62_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("extensions"));
  objc_msgSend(v11, "ded_mapWithBlock:", &__block_literal_global_63);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("groups"));
  objc_msgSend(v9, "ded_mapWithBlock:", &__block_literal_global_64);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("identifiers"));
  -[DEDSharingOutbound session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendWithFlags:object:", 0, v16);

}

uint64_t __74__DEDSharingOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

uint64_t __74__DEDSharingOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialize");
}

uint64_t __74__DEDSharingOutbound_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("adoptFiles"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("filesForAdopt"));

  -[DEDSharingOutbound session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendWithFlags:object:", 0, v7);

}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("didAdoptFiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("error"));
  -[DEDSharingOutbound session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendWithFlags:object:", 0, v5);

}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("uploadProgress"), a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("uploaded"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("total"));

  -[DEDSharingOutbound session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendWithFlags:object:", 0, v11);

}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("compressionProgress"), a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("compressed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("total"));

  -[DEDSharingOutbound session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendWithFlags:object:", 0, v11);

}

- (void)commitSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("commitSession"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)didCommitSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("didCommitSession"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)cancelSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("cancelSession"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)scheduleNotificationForSession:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[DEDSharingOutbound log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DEDSharingOutbound scheduleNotificationForSession:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[DEDSharingOutbound log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DEDSharingOutbound scheduleNotificationForSession:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a5;
  -[DEDSharingOutbound log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[DEDSharingOutbound addSessionData:withFilename:forSession:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

}

- (void)didCancelSession:(id)a3
{
  void *v4;
  id v5;

  -[DEDSharingOutbound basePayloadForCommand:](self, "basePayloadForCommand:", CFSTR("didCancelSession"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSharingOutbound session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithFlags:object:", 0, v5);

}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[DEDSharingOutbound log](self, "log", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DEDSharingOutbound loadTextDataForExtensions:localization:sessionID:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[DEDSharingOutbound log](self, "log", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DEDSharingOutbound didLoadTextDataForExtensions:localization:session:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SFSession)session
{
  return (SFSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DEDSharingConnection)connection
{
  return (DEDSharingConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
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
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)scheduleNotificationForSession:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "Remote devices cannot use notifications. Session ID: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addSessionData:(uint64_t)a3 withFilename:(uint64_t)a4 forSession:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "Adding Session Data is not implemented for Sharing Framework. Session ID: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)loadTextDataForExtensions:(uint64_t)a3 localization:(uint64_t)a4 sessionID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a1, a3, "%s not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)didLoadTextDataForExtensions:(uint64_t)a3 localization:(uint64_t)a4 session:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a1, a3, "%s not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
