@implementation FTRegConnectionHandler

- (FTRegConnectionHandler)initWithServiceType:(int64_t)a3 name:(id)a4 capabilities:(unsigned int)a5
{
  id v8;
  FTRegConnectionHandler *v9;
  FTRegConnectionHandler *v10;
  uint64_t v11;
  NSString *name;
  void *v13;
  uint64_t v14;
  NSString *listenerID;
  uint64_t v16;
  NSString *logName;
  objc_super v19;

  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FTRegConnectionHandler;
  v9 = -[FTRegConnectionHandler init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_serviceType = a3;
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_caps = a5;
    FTCServiceNameForServiceType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.ft.reg.connection.%@.%@"), v13, v10->_name);
    v14 = objc_claimAutoreleasedReturnValue();
    listenerID = v10->_listenerID;
    v10->_listenerID = (NSString *)v14;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ConnectionHandler(%@|%@)"), v13, v10->_name);
    v16 = objc_claimAutoreleasedReturnValue();
    logName = v10->_logName;
    v10->_logName = (NSString *)v16;

    -[FTRegConnectionHandler _startListeningForNotifications](v10, "_startListeningForNotifications");
    -[FTRegConnectionHandler connectToDaemon](v10, "connectToDaemon");

  }
  return v10;
}

- (FTRegConnectionHandler)initWithServiceType:(int64_t)a3 name:(id)a4
{
  return -[FTRegConnectionHandler initWithServiceType:name:capabilities:](self, "initWithServiceType:name:capabilities:", a3, a4, *MEMORY[0x24BE50A08]);
}

- (void)dealloc
{
  objc_super v3;

  -[FTRegConnectionHandler _stopListeningForNotifications](self, "_stopListeningForNotifications");
  -[FTRegConnectionHandler _disconnectFromDaemon](self, "_disconnectFromDaemon");
  v3.receiver = self;
  v3.super_class = (Class)FTRegConnectionHandler;
  -[FTRegConnectionHandler dealloc](&v3, sel_dealloc);
}

- (NSString)_serviceName
{
  -[FTRegConnectionHandler serviceType](self, "serviceType");
  return (NSString *)FTCServiceNameForServiceType();
}

- (void)_startListeningForNotifications
{
  id v3;

  if ((*(_BYTE *)&self->_handlerFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonConnected_, *MEMORY[0x24BE50118], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonDisconnected_, *MEMORY[0x24BE50120], 0);
    *(_BYTE *)&self->_handlerFlags |= 1u;

  }
}

- (void)_stopListeningForNotifications
{
  id v3;

  if ((*(_BYTE *)&self->_handlerFlags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50118], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50120], 0);
    *(_BYTE *)&self->_handlerFlags &= ~1u;

  }
}

- (void)setCaps:(unsigned int)a3
{
  if (self->_caps != a3)
  {
    self->_caps = a3;
    -[FTRegConnectionHandler connectToDaemon](self, "connectToDaemon");
  }
}

- (BOOL)_isServiceSupported
{
  void *v3;
  int64_t v4;
  char v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FTRegConnectionHandler serviceType](self, "serviceType");
  if (v4)
  {
    if (v4 == 2)
    {
      v5 = objc_msgSend(v3, "callingAvailable");
    }
    else
    {
      if (v4 != 1)
      {
        v6 = 0;
        goto LABEL_9;
      }
      v5 = objc_msgSend(v3, "iMessageAvailable");
    }
  }
  else
  {
    v5 = objc_msgSend(v3, "faceTimeAvailable");
  }
  v6 = v5;
LABEL_9:

  return v6;
}

- (BOOL)isConnectedToDaemon
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isConnected"))
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTRegConnectionHandler _listenerID](self, "_listenerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasListenerForID:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)connectToDaemon:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[FTRegConnectionHandler _isServiceSupported](self, "_isServiceSupported");
  csui_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to daemon if necessary - blocking:%@", (uint8_t *)&v17, 0xCu);
  }

  if (!v5)
  {
    csui_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "  => Not supported on this device, not connecting", (uint8_t *)&v17, 2u);
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTRegConnectionHandler _listenerID](self, "_listenerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "hasListenerForID:", v9);

  if ((v10 & 1) == 0)
  {
    csui_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[FTRegConnectionHandler _listenerID](self, "_listenerID");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "  => Adding listener for the first time: %@", (uint8_t *)&v17, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTRegConnectionHandler _listenerID](self, "_listenerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addListenerID:capabilities:", v14, -[FTRegConnectionHandler caps](self, "caps"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject blockUntilConnected](v15, "blockUntilConnected");
LABEL_14:

  }
  return v5;
}

- (BOOL)connectToDaemon
{
  return -[FTRegConnectionHandler connectToDaemon:](self, "connectToDaemon:", 0);
}

- (void)_disconnectFromDaemon
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  csui_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FTRegConnectionHandler _listenerID](self, "_listenerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Removing listener: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTRegConnectionHandler _listenerID](self, "_listenerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeListenerID:", v6);

}

- (void)_handleDaemonConnected:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  csui_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Connected to daemon", v4, 2u);
  }

}

- (void)_handleDaemonDisconnected:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  csui_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Disconnected from daemon", v4, 2u);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (unsigned)caps
{
  return self->_caps;
}

- (NSString)_listenerID
{
  return self->_listenerID;
}

- (void)_setListenerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)_logName
{
  return self->_logName;
}

- (void)set_logName:(id)a3
{
  objc_storeStrong((id *)&self->_logName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
