@implementation IDSDaemonController

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  int v6;
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isQueueCurrent");

  if (v6)
    v7 = sel_sendMessageWithSendParameters_ == a3;
  else
    v7 = 0;
  if (v7)
  {
    -[IDSDaemonControllerForwarder setPriority:](self->_forwarder, "setPriority:", -[IDSDaemonController curXPCMessagePriority](self, "curXPCMessagePriority"));
    -[IDSDaemonController setCurXPCMessagePriority:](self, "setCurXPCMessagePriority:", 0);
  }
  return self->_forwarder;
}

- (IDSDaemonController)init
{
  NSObject *v3;
  IDSDaemonController *v4;
  IDSDaemonController *v5;
  IDSDaemonController *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *ivarQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *remoteMessageQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *connectingQueue;
  dispatch_group_t v14;
  OS_dispatch_group *daemonConnectedGroup;
  uint64_t v16;
  NSProtocolChecker *protocol;
  IDSDaemonListener *v18;
  IDSDaemonListener *daemonListener;
  IDSDaemonControllerForwarder *v20;
  IDSDaemonControllerForwarder *forwarder;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *listenerID;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v28;

  if (_IDSRunningInDaemon())
  {
    +[IDSLogging DaemonController](IDSLogging, "DaemonController");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907E6410((uint64_t)self, v3);

    v4 = 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)IDSDaemonController;
    v5 = -[IDSDaemonController init](&v28, sel_init);
    v6 = v5;
    if (v5)
    {
      -[IDSDaemonController _setAutoReconnect:](v5, "_setAutoReconnect:", 1);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("com.apple.IDSDaemonControllerIvarQueue", v7);
      ivarQueue = v6->_ivarQueue;
      v6->_ivarQueue = (OS_dispatch_queue *)v8;

      dispatch_queue_set_specific((dispatch_queue_t)v6->_ivarQueue, "IDSDaemonControllerContext", (void *)1, 0);
      v10 = dispatch_queue_create("com.apple.IDSDaemonControllerQueue", v7);
      remoteMessageQueue = v6->_remoteMessageQueue;
      v6->_remoteMessageQueue = (OS_dispatch_queue *)v10;

      v12 = dispatch_queue_create("com.apple.IDSDaemonControllerConnectingQueue", v7);
      connectingQueue = v6->_connectingQueue;
      v6->_connectingQueue = (OS_dispatch_queue *)v12;

      v6->_curXPCMessagePriority = 0;
      v14 = dispatch_group_create();
      daemonConnectedGroup = v6->_daemonConnectedGroup;
      v6->_daemonConnectedGroup = (OS_dispatch_group *)v14;

      dispatch_group_enter((dispatch_group_t)v6->_daemonConnectedGroup);
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38C0]), "initWithProtocol:", &unk_1EE1E6A60);
      protocol = v6->_protocol;
      v6->_protocol = (NSProtocolChecker *)v16;

      v18 = objc_alloc_init(IDSDaemonListener);
      daemonListener = v6->_daemonListener;
      v6->_daemonListener = v18;

      v20 = -[IDSDaemonControllerForwarder initWithProtocol:ivarQueue:remoteMessageQueue:]([IDSDaemonControllerForwarder alloc], "initWithProtocol:ivarQueue:remoteMessageQueue:", v6->_protocol, v6->_ivarQueue, v6->_remoteMessageQueue);
      forwarder = v6->_forwarder;
      v6->_forwarder = v20;

      IMGetMainBundleIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v23 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v23;
      }
      v24 = objc_msgSend(v22, "copy");
      listenerID = v6->_listenerID;
      v6->_listenerID = (NSString *)v24;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_1906F0CB0, (CFStringRef)*MEMORY[0x1E0D35010], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    }
    self = v6;
    v4 = self;
  }

  return v4;
}

- (void)removeListenerID:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1906E49BC;
    v5[3] = &unk_1E2C607A8;
    v5[4] = self;
    v6 = v4;
    -[IDSDaemonController _performBlock:](self, "_performBlock:", v5);

  }
}

- (void)_noteSetupComplete
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1906E2D40;
  v2[3] = &unk_1E2C60550;
  v2[4] = self;
  -[IDSDaemonController _performBlock:](self, "_performBlock:", v2);
}

- (void)_performBlock:(id)a3
{
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", a3, 0);
}

- (BOOL)consumeQueryContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(v5, "removeObjectForKey:", v3);

  return v7;
}

- (void)_remoteObjectCleanup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1906E9840;
  v2[3] = &unk_1E2C60550;
  v2[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v2, 1);
}

+ (id)sharedInstance
{
  if (qword_1ECDD6718 != -1)
    dispatch_once(&qword_1ECDD6718, &unk_1E2C5F6D0);
  return (id)qword_1ECDD66D8;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[IDSDaemonController services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDaemonController commands](self, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDaemonController _connectToDaemonWithLaunch:services:commands:capabilities:](self, "_connectToDaemonWithLaunch:services:commands:capabilities:", v3, v5, v6, -[IDSDaemonController capabilities](self, "capabilities"));

  return 1;
}

- (id)services
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE194;
  v9 = sub_1906EE09C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906E8F9C;
  v4[3] = &unk_1E2C606B8;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)commands
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE194;
  v9 = sub_1906EE09C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906E90F4;
  v4[3] = &unk_1E2C606B8;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_localObjectCleanup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1906E97BC;
  v2[3] = &unk_1E2C60550;
  v2[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v2, 1);
}

- (void)_setServices:(id)a3 commands:(id)a4 capabilities:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  _BYTE v20[24];
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[IDSDaemonController _setServices:](self, "_setServices:", v8);
  v11 = -[IDSDaemonController _setCommands:](self, "_setCommands:", v9);
  v12 = -[IDSDaemonController _setCapabilities:](self, "_setCapabilities:", v5);
  v13 = v12;
  if (v10 || v11 || v12)
  {
    if ((objc_msgSend(v8, "containsObject:", CFSTR("com.apple.private.alloy.pbbridge")) & 1) != 0
      || objc_msgSend(v8, "containsObject:", CFSTR("com.apple.private.alloy.accountssync")))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = CFSTR("NO");
        *(_DWORD *)v20 = 138413570;
        *(_QWORD *)&v20[4] = v8;
        *(_WORD *)&v20[22] = 1024;
        if (v10)
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        if (v11)
          v17 = CFSTR("YES");
        else
          v17 = CFSTR("NO");
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v9;
        if (v13)
          v15 = CFSTR("YES");
        v21 = v5;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Sending down new services %@ commands %@ capabilities %d. sendServices %@ sendCommands %@ sendCaps %@", v20, 0x3Au);
      }

    }
    +[IDSLogging DaemonController](IDSLogging, "DaemonController", *(_OWORD *)v20, *(_QWORD *)&v20[16]);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v20 = 138412802;
      *(_QWORD *)&v20[4] = v8;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v9;
      *(_WORD *)&v20[22] = 1024;
      v21 = v5;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_INFO, "Sending down new services %@ commands %@ capabilities %d", v20, 0x1Cu);
    }

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setListenerServices:commands:capabilities:", v8, v9, v5);

  }
}

- (BOOL)_setServices:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1906E9338;
    v8[3] = &unk_1E2C606E0;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v8, 1);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_setCommands:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1906E93CC;
    v8[3] = &unk_1E2C606E0;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v8, 1);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_setCapabilities:(unsigned int)a3
{
  char v3;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1906E924C;
  v5[3] = &unk_1E2C60708;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v5, 1);
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)isConnecting
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906E9504;
  v4[3] = &unk_1E2C606B8;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_connectToDaemonWithLaunch:(BOOL)a3 services:(id)a4 commands:(id)a5 capabilities:(unsigned int)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  int v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unsigned int v22;
  char v23;
  BOOL v24;
  _QWORD v25[5];
  char v26;
  uint8_t buf[4];
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isNonUIInstall");

  if ((v13 & 1) == 0)
  {
    v14 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.private.alloy.pbbridge"));
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "systemIsShuttingDown");

    if (v16)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1906F1654;
      v25[3] = &unk_1E2C60620;
      v26 = v14;
      v25[4] = self;
      v17 = v25;
LABEL_6:
      -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v17, 1);
      goto LABEL_7;
    }
    if (self->_fatalErrorOccured)
    {
      v17 = &unk_1E2C60170;
      goto LABEL_6;
    }
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v28 = a6;
        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "connectToDaemonWithLaunch capabilities %d", buf, 8u);
      }

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1906F17C8;
    v19[3] = &unk_1E2C60668;
    v23 = v14;
    v22 = a6;
    v19[4] = self;
    v20 = v10;
    v21 = v11;
    v24 = a3;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v19, 1);

  }
LABEL_7:

}

- (BOOL)isConnected
{
  void *v3;
  char v4;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonUIInstall");

  if ((v4 & 1) != 0)
    return 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -86;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906E8F10;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
  v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)capabilities
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906E8E80;
  v4[3] = &unk_1E2C606B8;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_performBlock:(id)a3 wait:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(void);
  void (**v7)(void);
  void (**block)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  v7 = v6;
  if (v6)
  {
    block = v6;
    if (v4)
    {
      if (dispatch_get_specific("IDSDaemonControllerContext"))
        block[2]();
      else
        dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_ivarQueue, v6);
    }
    v7 = block;
  }

}

- (IDSDaemonListener)listener
{
  return self->_daemonListener;
}

- (BOOL)remoteObjectExists
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906E95AC;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setAutoReconnect:(BOOL)a3
{
  self->_autoReconnect = a3;
}

- (void)_noteDisconnected
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1906E99E4;
  v2[3] = &unk_1E2C60550;
  v2[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v2, 1);
}

- (BOOL)connectToDaemon
{
  return -[IDSDaemonController connectToDaemonWithLaunch:](self, "connectToDaemonWithLaunch:", 1);
}

- (IDSDaemonProtocol)remoteObject
{
  return self->_remoteObject;
}

- (id)localObject
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE194;
  v9 = sub_1906EE09C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906EAF88;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)localObjectExists
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906EAF6C;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)disconnectFromDaemon
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonUIInstall");

  if ((v4 & 1) == 0)
    -[IDSDaemonController _disconnectFromDaemonWithForce:](self, "_disconnectFromDaemonWithForce:", 0);
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 services:(id)a4 commands:(id)a5 capabilities:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  char v13;

  v6 = *(_QWORD *)&a6;
  v8 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isNonUIInstall");

  if ((v13 & 1) == 0)
    -[IDSDaemonController _connectToDaemonWithLaunch:services:commands:capabilities:](self, "_connectToDaemonWithLaunch:services:commands:capabilities:", v8, v10, v11, v6);

  return 1;
}

- (void)blockUntilConnected
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonUIInstall");

  if ((v4 & 1) == 0)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
    +[IDSLogging DaemonController](IDSLogging, "DaemonController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_INFO, "Request to block until connected", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v9 = buf;
    v10 = 0x2020000000;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1906E8358;
    v7[3] = &unk_1E2C606B8;
    v7[4] = self;
    v7[5] = buf;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
    if (v9[24])
    {
      -[IDSDaemonController connectingQueue](self, "connectingQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v6, &unk_1E2C60190);

    }
    _Block_object_dispose(buf, 8);
  }
}

- (OS_dispatch_queue)connectingQueue
{
  return self->_connectingQueue;
}

- (BOOL)_makeConnectionWithLaunch:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isNonUIInstall"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "systemIsShuttingDown");

    if ((v9 & 1) == 0)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_1906E7AC0;
      v12[3] = &unk_1E2C60598;
      v15 = a3;
      v12[4] = self;
      v14 = &v16;
      v13 = v6;
      -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v12, 1);
      v10 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
      goto LABEL_6;
    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)_disconnectFromDaemonWithForce:(BOOL)a3
{
  void *v5;
  char v6;
  _QWORD v7[5];
  BOOL v8;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  if ((v6 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1906E68C4;
    v7[3] = &unk_1E2C60620;
    v7[4] = self;
    v8 = a3;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
  }
}

- (BOOL)_autoReconnect
{
  return self->_autoReconnect;
}

- (void)_listenerSetUpdated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1906E98B4;
  v2[3] = &unk_1E2C60550;
  v2[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v2, 1);
}

- (BOOL)hasListenerForID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906E9A74;
  v7[3] = &unk_1E2C60780;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)addListenerID:(id)a3 services:(id)a4 commands:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  IDSDaemonController *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1906ED828;
  v15[3] = &unk_1E2C60758;
  v11 = v9;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v13 = v8;
  v19 = self;
  v20 = &v21;
  v18 = v13;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v15, 1);
  LOBYTE(self) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

- (BOOL)addListenerID:(id)a3 services:(id)a4
{
  return -[IDSDaemonController addListenerID:services:commands:](self, "addListenerID:services:commands:", a3, a4, 0);
}

+ (void)_blockUntilSendQueueIsEmpty
{
  id v2;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_blockUntilSendQueueIsEmpty");

}

- (void)_blockUntilSendQueueIsEmpty
{
  void *v3;
  char v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNonUIInstall"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "systemIsShuttingDown");

    if ((v4 & 1) == 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = sub_1906E9B08;
      v6[3] = &unk_1E2C60550;
      v6[4] = self;
      -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v6, 1);
    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *daemonConnectedGroup;
  OS_dispatch_group *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, 0, 0);

  -[IDSDaemonController _localObjectCleanup](self, "_localObjectCleanup");
  -[IDSDaemonController _remoteObjectCleanup](self, "_remoteObjectCleanup");
  daemonConnectedGroup = self->_daemonConnectedGroup;
  if (daemonConnectedGroup)
  {
    dispatch_group_leave(daemonConnectedGroup);
    v6 = self->_daemonConnectedGroup;
    self->_daemonConnectedGroup = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)IDSDaemonController;
  -[IDSDaemonController dealloc](&v7, sel_dealloc);
}

- (void)_handleDaemonException:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  +[IDSLogging DaemonController](IDSLogging, "DaemonController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1907E649C((uint64_t)v3, v4, v5);

}

+ (BOOL)_applicationWillTerminate
{
  return byte_1EE1E1F68;
}

+ (void)_setApplicationWillTerminate
{
  byte_1EE1E1F68 = 1;
  objc_msgSend(a1, "_blockUntilSendQueueIsEmpty");
}

- (void)setCurXPCMessagePriority:(int)a3
{
  void *v5;
  int v6;
  NSObject *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E6814();

  }
  self->_curXPCMessagePriority = a3;
}

- (int)curXPCMessagePriority
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907E68A4();

  }
  return self->_curXPCMessagePriority;
}

- (void)addedDelegateForService:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  IDSDaemonController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1906F1E74;
  v10[3] = &unk_1E2C60730;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v10, 1);

}

- (id)servicesForListenerID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = sub_1906EE194;
    v14 = sub_1906EE09C;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1906F20F0;
    v7[3] = &unk_1E2C60780;
    v9 = &v10;
    v7[4] = self;
    v8 = v4;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    -[IDSDaemonController services](self, "services");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)setServices:(id)a3 forListenerID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  IDSDaemonController *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1906F223C;
  v11[3] = &unk_1E2C607D0;
  v8 = v7;
  v15 = &v16;
  v12 = v8;
  v13 = self;
  v9 = v6;
  v14 = v9;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v11, 1);
  LOBYTE(self) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

- (BOOL)setCommands:(id)a3 forListenerID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  IDSDaemonController *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1906F243C;
  v11[3] = &unk_1E2C607D0;
  v8 = v7;
  v15 = &v16;
  v12 = v8;
  v13 = self;
  v9 = v6;
  v14 = v9;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v11, 1);
  LOBYTE(self) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

- (id)commandsForListenerID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = sub_1906EE194;
    v14 = sub_1906EE09C;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1906F2650;
    v7[3] = &unk_1E2C60780;
    v9 = &v10;
    v7[4] = self;
    v8 = v4;
    -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    -[IDSDaemonController commands](self, "commands");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906F2770;
  v7[3] = &unk_1E2C60780;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v7, 1);
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return self;
}

- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4 shouldLog:(BOOL)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  IDSDaemonController *v14;
  uint64_t *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1906F28A8;
  v12[3] = &unk_1E2C607F8;
  v9 = v8;
  v17 = a5;
  v16 = a3;
  v14 = self;
  v15 = &v18;
  v13 = v9;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v12, 1);
  v10 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (NSString)listenerID
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE194;
  v9 = sub_1906EE09C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906F2C1C;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)_agentDidLaunchNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1906F2CF0;
  v3[3] = &unk_1E2C60550;
  v3[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v3, 0);
}

- (void)localObjectDiedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1906F2D5C;
  v3[3] = &unk_1E2C60550;
  v3[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v3, 1);
}

- (void)remoteObjectDiedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1906F2F0C;
  v3[3] = &unk_1E2C60550;
  v3[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v3, 1);
}

- (void)sendXPCObject:(id)a3 objectContext:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  IMInsertBoolsToXPCDictionary();
  xpc_dictionary_set_value(v8, "object", v7);

  v9 = (void *)objc_msgSend(v6, "copy", 1, 0);
  IMInsertDictionariesToXPCDictionary();

  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1906F3294;
  v15[3] = &unk_1E2C607A8;
  v15[4] = self;
  v16 = v8;
  v11 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = sub_1906F33B0;
  v13[3] = &unk_1E2C60820;
  v13[4] = self;
  v14 = (id)MEMORY[0x19400FE1C](v15);
  v12 = v14;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v13, 1, v9, 0);

}

- (void)forwardMethodWithReplyIsSync:(BOOL)a3 block:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, IDSDaemonController *);
  const __CFString *v7;

  v4 = a3;
  v6 = (void (**)(id, IDSDaemonController *))a4;
  if (v4)
    v7 = CFSTR("QueryWithReplySync");
  else
    v7 = CFSTR("QueryWithReply");
  -[IDSDaemonController setQueryContext:](self, "setQueryContext:", v7);
  v6[2](v6, self);

  MEMORY[0x1E0DE7D20](self, sel_unsetQueryContext_);
}

- (void)forwardMethodWithBoostedPriority:(id)a3
{
  void (**v4)(id, IDSDaemonController *);

  v4 = (void (**)(id, IDSDaemonController *))a3;
  -[IDSDaemonController setQueryContext:](self, "setQueryContext:", CFSTR("QueryWithBoost"));
  v4[2](v4, self);

  MEMORY[0x1E0DE7D20](self, sel_unsetQueryContext_);
}

- (void)setQueryContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);

}

- (void)unsetQueryContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(v4, "removeObjectForKey:", v7);

}

- (id)forwarderWithCompletion:(id)a3
{
  id v4;
  IDSDaemonControllerForwarder *v5;

  v4 = a3;
  v5 = -[IDSDaemonControllerForwarder initWithProtocol:ivarQueue:remoteMessageQueue:completion:]([IDSDaemonControllerForwarder alloc], "initWithProtocol:ivarQueue:remoteMessageQueue:completion:", self->_protocol, self->_ivarQueue, self->_remoteMessageQueue, v4);

  return v5;
}

- (void)systemApplicationDidSuspend
{
  NSObject *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1907E6B7C();

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906F36C8;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
}

- (void)systemApplicationDidEnterBackground
{
  NSObject *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1907E6BA8();

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906F376C;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v4, 1);
}

- (void)systemApplicationWillEnterForeground
{
  NSObject *v2;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_1907E6BD4();

}

- (void)systemApplicationDidResume
{
  NSObject *v2;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_1907E6C00();

}

- (OS_dispatch_queue)_remoteMessageQueue
{
  return self->_remoteMessageQueue;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (void)setConnectingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectingQueue, 0);
  objc_storeStrong((id *)&self->_notificationServices, 0);
  objc_storeStrong((id *)&self->_listenerCapabilities, 0);
  objc_storeStrong((id *)&self->_cachedCommands, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_listenerCommands, 0);
  objc_storeStrong((id *)&self->_cachedServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_listenerServices, 0);
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_daemonConnectedGroup, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_forwarder, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
