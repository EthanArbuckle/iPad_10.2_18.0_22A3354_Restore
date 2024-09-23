@implementation CKIMDaemonController

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1)
    dispatch_once(&sharedInstance_creation, &__block_literal_global_116);
  return (id)sharedInstance_sInstance_1;
}

void __38__CKIMDaemonController_sharedInstance__block_invoke()
{
  CKIMDaemonController *v0;
  void *v1;

  v0 = objc_alloc_init(CKIMDaemonController);
  v1 = (void *)sharedInstance_sInstance_1;
  sharedInstance_sInstance_1 = (uint64_t)v0;

}

+ (void)beginSimulatingDaemon
{
  if (beginSimulatingDaemon_onceToken != -1)
    dispatch_once(&beginSimulatingDaemon_onceToken, &__block_literal_global_24);
}

void __45__CKIMDaemonController_beginSimulatingDaemon__block_invoke()
{
  objc_class *v0;
  objc_method *ClassMethod;
  objc_class *v2;
  objc_method *v3;
  void *v4;
  id v5;

  v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, sel_sharedInstance);
  v2 = (objc_class *)objc_opt_class();
  v3 = class_getClassMethod(v2, sel_sharedInstance);
  method_exchangeImplementations(ClassMethod, v3);
  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupComplete:info:", 1, &unk_1E2871D30);

}

- (CKIMDaemonController)init
{
  CKIMDaemonController *v2;
  uint64_t v3;
  NSProtocolChecker *protocol;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKIMDaemonController;
  v2 = -[IMDaemonController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38C0]), "initWithProtocol:", &unk_1EE31CE20);
    protocol = v2->_protocol;
    v2->_protocol = (NSProtocolChecker *)v3;

  }
  return v2;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSProtocolChecker methodSignatureForSelector:](self->_protocol, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  const char *v3;
  id v4;

  v3 = (const char *)objc_msgSend(a3, "selector");
  if (_IMWillLog())
  {
    NSStringFromSelector(v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CKIMDaemonController listeners](self, "listeners", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "simulatedDaemon:willSendBalloonPayload:attachments:messageGUID:bundleID:", self, v10, v11, v12, v13);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  return 1;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  return 1;
}

- (id)synchronousRemoteDaemon
{
  return 0;
}

- (id)queryController
{
  return 0;
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
