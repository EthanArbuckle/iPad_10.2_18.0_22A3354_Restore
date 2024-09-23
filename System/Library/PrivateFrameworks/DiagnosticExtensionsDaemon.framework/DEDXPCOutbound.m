@implementation DEDXPCOutbound

- (int64_t)transportType
{
  return 2;
}

- (DEDXPCOutbound)initWithRemoteObject:(id)a3
{
  id v4;
  DEDXPCOutbound *v5;
  DEDXPCOutbound *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDXPCOutbound;
  v5 = -[DEDXPCOutbound init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DEDXPCOutbound setRemoteObject:](v5, "setRemoteObject:", v4);

  return v6;
}

- (void)pingSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_pingSession:", v4);

}

- (void)pongSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_pongSession:", v4);

}

- (void)listAvailableExtensionsForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_listAvailableExtensionsForSession:", v4);

}

- (void)getSessionStatusWithSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_getSessionStatusWithSession:", v4);

}

- (void)syncSessionStatusWithSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_syncSessionStatusWithSession:", v4);

}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("serialize"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &unk_24D202C20;
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  objc_msgSend(v9, "valueForKeyPath:", CFSTR("serialize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = &unk_24D202C38;
  if (v14)
    v15 = v14;
  v16 = v15;

  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "xpc_hasCollected:isCollecting:inSession:", v13, v16, v8);

}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("serialize"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_24D202C50;
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  objc_msgSend(v12, "valueForKeyPath:", CFSTR("serialize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = &unk_24D202C68;
  if (v17)
    v18 = v17;
  v19 = v18;

  objc_msgSend(v11, "valueForKey:", CFSTR("stringValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDBD1A8];
  if (v20)
    v21 = v20;
  v22 = v21;

  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "xpc_hasCollected:isCollecting:withIdentifiers:inSession:", v16, v19, v22, v10);

}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "serialize", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "xpc_deviceSupportsDiagnosticExtensions:session:", v8, v7);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "xpc_startDiagnosticWithIdentifier:parameters:session:", v10, v9, v8);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
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
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xpc_startDiagnosticWithIdentifier:parameters:deferRunUntil:session:", v13, v12, v11, v10);

}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "xpc_finishedDiagnosticWithIdentifier:result:session:", v10, v11, v8);
}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (id)MEMORY[0x24BDBD1B8];
  if (a4)
    v8 = a4;
  v9 = v8;
  v10 = a5;
  v11 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xpc_terminateExtension:info:session:", v11, v9, v10);

}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xpc_adoptFiles:forSession:", v7, v6);

}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xpc_didAdoptFilesWithError:forSession:", v7, v6);

}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xpc_uploadProgress:total:session:", a3, a4, v8);

}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xpc_compressionProgress:total:session:", a3, a4, v8);

}

- (void)commitSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_commitSession:", v4);

}

- (void)didCommitSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_didCommitSession:", v4);

}

- (void)cancelSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_cancelSession:", v4);

}

- (void)scheduleNotificationForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_notifySession:", v4);

}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_cancelNotifySession:", v4);

}

- (void)getSessionStateWithSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_getSessionStateWithSession:", v4);

}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "xpc_addData:withFilename:forSession:", v10, v9, v8);

}

- (void)didCancelSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpc_didCancelSession:", v4);

}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpc_didGetState:info:sessionID:", a3, v9, v8);

}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("serialize"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpc_loadTextDataForExtensions:localization:sessionID:", v11, v9, v8);

}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("serialize"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDXPCOutbound remoteObject](self, "remoteObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "xpc_didLoadTextDataForExtensions:localization:sessionID:", v11, v9, v8);

}

- (DEDXPCProtocol)remoteObject
{
  return (DEDXPCProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
}

@end
