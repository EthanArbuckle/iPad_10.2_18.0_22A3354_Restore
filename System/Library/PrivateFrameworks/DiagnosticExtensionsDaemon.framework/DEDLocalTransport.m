@implementation DEDLocalTransport

- (int64_t)transportType
{
  return 1;
}

- (DEDLocalTransport)initWithClientDelegate:(id)a3
{
  id v4;
  DEDLocalTransport *v5;
  void *v6;
  os_log_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DEDLocalTransport;
  v5 = -[DEDLocalTransport init](&v9, sel_init);
  if (v5)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create((const char *)objc_msgSend(v6, "loggingSubsystem"), "t-local");
    -[DEDLocalTransport setLog:](v5, "setLog:", v7);

  }
  -[DEDLocalTransport setClientDelegate:](v5, "setClientDelegate:", v4);

  return v5;
}

- (DEDLocalTransport)initWithWorkerDelegate:(id)a3
{
  id v4;
  DEDLocalTransport *v5;
  void *v6;
  os_log_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DEDLocalTransport;
  v5 = -[DEDLocalTransport init](&v9, sel_init);
  if (v5)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create((const char *)objc_msgSend(v6, "loggingSubsystem"), "t-local");
    -[DEDLocalTransport setLog:](v5, "setLog:", v7);

  }
  -[DEDLocalTransport setWorkerDelegate:](v5, "setWorkerDelegate:", v4);

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  objc_class *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)DEDLocalTransport;
  -[DEDLocalTransport description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientDelegate);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->_workerDelegate);
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: clientDelegate: [%@] workerDelegate: [%@]"), v4, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)pingSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pingSession:", v4);

}

- (void)listAvailableExtensionsForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listAvailableExtensionsForSession:", v4);

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
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDiagnosticWithIdentifier:parameters:session:", v10, v9, v8);

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
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDiagnosticWithIdentifier:parameters:deferRunUntil:session:", v13, v12, v11, v10);

}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "terminateExtension:info:session:", v10, v9, v8);

}

- (void)getSessionStateWithSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSessionStateWithSession:", v4);

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
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSessionData:withFilename:forSession:", v10, v9, v8);

}

- (void)syncSessionStatusWithSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncSessionStatusWithSession:", v4);

}

- (void)getSessionStatusWithSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSessionStatusWithSession:", v4);

}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adoptFiles:forSession:", v7, v6);

}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didAdoptFilesWithError:forSession:", v7, v6);

}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uploadProgress:total:sessionID:", a3, a4, v8);

}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "compressionProgress:total:sessionID:", a3, a4, v8);

}

- (void)commitSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitSession:", v4);

}

- (void)cancelSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelSession:", v4);

}

- (void)scheduleNotificationForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleNotificationForSession:", v4);

}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleNotificationForSession:", v4);

}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDLocalTransport workerDelegate](self, "workerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loadTextDataForExtensions:localization:sessionID:", v10, v9, v8);

}

- (void)pongSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pongSession:", v4);

}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceSupportsDiagnosticExtensions:session:", v7, v6);

}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishedDiagnosticWithIdentifier:result:session:", v10, v9, v8);

}

- (void)didCommitSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCommitSession:", v4);

}

- (void)didCancelSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCancelSession:", v4);

}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hasCollected:isCollecting:inSession:", v10, v9, v8);

}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
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
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hasCollected:isCollecting:withIdentifiers:inSession:", v13, v12, v11, v10);

}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didGetState:info:sessionID:", a3, v9, v8);

}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDLocalTransport clientDelegate](self, "clientDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didLoadTextDataForExtensions:localization:session:", v10, v9, v8);

}

- (DEDClientProtocol)clientDelegate
{
  return (DEDClientProtocol *)objc_loadWeakRetained((id *)&self->_clientDelegate);
}

- (void)setClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clientDelegate, a3);
}

- (DEDWorkerProtocol)workerDelegate
{
  return (DEDWorkerProtocol *)objc_loadWeakRetained((id *)&self->_workerDelegate);
}

- (void)setWorkerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_workerDelegate, a3);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_workerDelegate);
  objc_destroyWeak((id *)&self->_clientDelegate);
}

@end
