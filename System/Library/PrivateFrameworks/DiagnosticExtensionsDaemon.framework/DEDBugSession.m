@implementation DEDBugSession

- (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_3);
  return (OS_os_log *)(id)log_log;
}

void __20__DEDBugSession_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-bs");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

- (OS_dispatch_queue)callbackQueue
{
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue **p_callbackQueue;

  p_callbackQueue = &self->_callbackQueue;
  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_storeStrong((id *)p_callbackQueue, MEMORY[0x24BDAC9B8]);
    callbackQueue = *p_callbackQueue;
  }
  return callbackQueue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDBugSession)initWithConfiguration:(id)a3
{
  id v5;
  DEDBugSession *v6;
  DEDBugSession *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DEDBugSession;
  v6 = -[DEDBugSession init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    -[DEDBugSession setFinisherDidCommit:](v6, "setFinisherDidCommit:", 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    -[DEDBugSession setDeListCompletions:](v7, "setDeListCompletions:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    -[DEDBugSession setDeCompletions:](v7, "setDeCompletions:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    -[DEDBugSession setAdoptFilesCompletions:](v7, "setAdoptFilesCompletions:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    -[DEDBugSession setPendingOperations:](v7, "setPendingOperations:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    -[DEDBugSession setOngoingCompletionHandlers:](v7, "setOngoingCompletionHandlers:", v12);

    -[DEDBugSession setPriorClientTransportType:](v7, "setPriorClientTransportType:", 0);
    -[DEDBugSession setPriorWorkerTransportType:](v7, "setPriorWorkerTransportType:", 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    -[DEDBugSession setFilePromises:](v7, "setFilePromises:", v13);

    objc_storeStrong((id *)&v7->_config, a3);
    -[DEDBugSession set_finisher:](v7, "set_finisher:", 0);
    v14 = (void *)objc_opt_new();
    -[DEDBugSession setIdentifierManager:](v7, "setIdentifierManager:", v14);

    -[DEDBugSession _logOperationQueue](v7, "_logOperationQueue");
  }

  return v7;
}

- (id)finisher
{
  void *v3;
  void *v4;
  uint64_t v5;
  __objc2_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession _finisher](self, "_finisher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[DEDBugSession config](self, "config");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "finishingMove");

      if (v5 == 1)
      {
        v6 = DEDSeedingFinisher;
LABEL_12:
        v14 = [v6 alloc];
        -[DEDBugSession config](self, "config");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithConfiguration:session:", v15, self);
        -[DEDBugSession set_finisher:](self, "set_finisher:", v16);

        goto LABEL_13;
      }
      -[DEDBugSession config](self, "config");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "finishingMove");

      if (v9 == 2)
      {
        v6 = DEDRadarFinisher;
        goto LABEL_12;
      }
      -[DEDBugSession config](self, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "finishingMove");

      if (v11 == 3)
      {
        v6 = DEDCloudKitFinisher;
        goto LABEL_12;
      }
      -[DEDBugSession config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "finishingMove");

      if (v13 == 4)
      {
        v6 = DEDTestingFinisher;
        goto LABEL_12;
      }
    }
LABEL_13:
    -[DEDBugSession _finisher](self, "_finisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  v7 = 0;
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;

  v23 = a3;
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[DEDBugSession deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v5, CFSTR("deviceIdentifier"));

  -[DEDBugSession config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v6, CFSTR("config"));

  -[DEDBugSession client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeInteger:forKey:", objc_msgSend(v7, "transportType"), CFSTR("clientTransportType"));

  -[DEDBugSession client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[DEDBugSession client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "encodeObject:forKey:", v11, CFSTR("clientAddress"));

  }
  -[DEDBugSession worker](self, "worker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeInteger:forKey:", objc_msgSend(v12, "transportType"), CFSTR("workerTransportType"));

  -[DEDBugSession identifierManager](self, "identifierManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v13, CFSTR("identifierManager"));

  objc_msgSend(v23, "encodeBool:forKey:", -[DEDBugSession finisherDidCommit](self, "finisherDidCommit"), CFSTR("didCommit"));
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v15, CFSTR("operations"));

  objc_sync_exit(v14);
  -[DEDBugSession _finisher](self, "_finisher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DEDBugSession _finisher](self, "_finisher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "encodeObject:forKey:", v17, CFSTR("finisher"));

  }
  -[DEDBugSession _notifier](self, "_notifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[DEDBugSession _notifier](self, "_notifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "conformsToProtocol:", &unk_254D84B00);

    if (v21)
    {
      -[DEDBugSession _notifier](self, "_notifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "encodeObject:forKey:", v22, CFSTR("notifier"));

    }
  }

}

- (DEDBugSession)initWithCoder:(id)a3
{
  id v4;
  DEDBugSession *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *deviceIdentifier;
  void *v10;
  uint64_t v11;
  DEDBugSessionConfiguration *config;
  uint64_t v13;
  NSString *priorClientAddress;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *pendingOperations;
  void *v18;
  uint64_t v19;
  DEDFinisher *finisher;
  void *v21;
  uint64_t v22;
  DEDExtensionIdentifierManager *identifierManager;
  uint64_t v24;
  DEDExtensionIdentifierManager *v25;
  void *v26;
  uint64_t v27;
  DEDNotifier *notifier;
  int v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DEDBugSession;
  v5 = -[DEDBugSession init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    +[DEDBugSessionConfiguration archivedClasses](DEDBugSessionConfiguration, "archivedClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("config"));
    v11 = objc_claimAutoreleasedReturnValue();
    config = v5->_config;
    v5->_config = (DEDBugSessionConfiguration *)v11;

    v5->_priorClientTransportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientTransportType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientAddress"));
    v13 = objc_claimAutoreleasedReturnValue();
    priorClientAddress = v5->_priorClientAddress;
    v5->_priorClientAddress = (NSString *)v13;

    v5->_priorWorkerTransportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workerTransportType"));
    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("operations"));
    v16 = objc_claimAutoreleasedReturnValue();
    pendingOperations = v5->_pendingOperations;
    v5->_pendingOperations = (NSMutableDictionary *)v16;

    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("finisher"));
    v19 = objc_claimAutoreleasedReturnValue();
    finisher = v5->__finisher;
    v5->__finisher = (DEDFinisher *)v19;

    +[DEDExtensionIdentifierManager archivedClasses](DEDExtensionIdentifierManager, "archivedClasses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("identifierManager"));
    v22 = objc_claimAutoreleasedReturnValue();
    identifierManager = v5->_identifierManager;
    v5->_identifierManager = (DEDExtensionIdentifierManager *)v22;

    if (!v5->_identifierManager)
    {
      v24 = objc_opt_new();
      v25 = v5->_identifierManager;
      v5->_identifierManager = (DEDExtensionIdentifierManager *)v24;

    }
    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("notifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    notifier = v5->__notifier;
    v5->__notifier = (DEDNotifier *)v27;

    v29 = objc_msgSend(v4, "containsValueForKey:", CFSTR("didCommit"));
    if (v29)
      LOBYTE(v29) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didCommit"));
    v5->_finisherDidCommit = v29;
    -[DEDBugSession _logOperationQueue](v5, "_logOperationQueue");
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)DEDBugSession;
  -[DEDBugSession description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - identifier: [%@] - client: [%@] - worker: [%@]"), v4, self->_identifier, self->_client, self->_worker);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)prettyDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DEDBugSession state](self, "state");
  if ((unint64_t)(v5 + 1) > 9)
    v6 = "Unknown";
  else
    v6 = off_24D1E4840[v5 + 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BugSession identifier: %@ state: %s"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)DEDBugSession;
  -[DEDBugSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: ID: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)archivedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__DEDBugSession_archivedClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (archivedClasses_onceToken_0 != -1)
    dispatch_once(&archivedClasses_onceToken_0, block);
  return (id)archivedClasses__classes;
}

void __32__DEDBugSession_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  +[DEDBugSessionConfiguration archivedClasses](DEDBugSessionConfiguration, "archivedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v6);

  +[DEDNotifierConfiguration archivedClasses](DEDNotifierConfiguration, "archivedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v7);

  +[DEDBugSessionOperation archivedClasses](DEDBugSessionOperation, "archivedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v8);

  +[DEDSeedingFinisher archivedClasses](DEDSeedingFinisher, "archivedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v9);

  +[DEDRadarFinisher archivedClasses](DEDRadarFinisher, "archivedClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v10);

  +[DEDCloudKitFinisher archivedClasses](DEDCloudKitFinisher, "archivedClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v11);

  +[DEDTestingFinisher archivedClasses](DEDTestingFinisher, "archivedClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v12);

  +[DEDExtensionIdentifierManager archivedClasses](DEDExtensionIdentifierManager, "archivedClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v13);

  +[DEDUserNotificationNotifier archivedClasses](DEDUserNotificationNotifier, "archivedClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v14);

  +[DEDFollowUpNotifier archivedClasses](DEDFollowUpNotifier, "archivedClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v15);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v18);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)archivedClasses__classes;
  archivedClasses__classes = v16;

}

- (id)configuration
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[DEDBugSession config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DEDBugSession config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DEDBugSession configuration].cold.1();

    v5 = 0;
  }
  return v5;
}

- (void)attachCompletionHandlerForOngoingOperation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v6 = a4;
  v7 = a3;
  -[DEDBugSession log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "attaching completion handler to ongoing operation", v13, 2u);
  }

  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = (void *)MEMORY[0x2199D4184](v9);
  -[DEDBugSession ongoingCompletionHandlers](self, "ongoingCompletionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);
}

- (void)attachCompletionHandlerForDEDExtensionIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[DEDBugSession identifierManager](self, "identifierManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isKnownIdentifier:", v6);

  if ((v9 & 1) == 0)
  {
    -[DEDBugSession log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDBugSession attachCompletionHandlerForDEDExtensionIdentifier:handler:].cold.1((uint64_t)v6, self);

  }
  v11 = (void *)objc_msgSend(v7, "copy");
  v12 = (void *)MEMORY[0x2199D4184]();
  -[DEDBugSession ongoingCompletionHandlers](self, "ongoingCompletionHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

}

- (id)knownExtensions
{
  void *v3;
  void *v4;
  void *v5;

  -[DEDBugSession cachedExtensions](self, "cachedExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DEDBugSession cachedExtensions](self, "cachedExtensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v5;
}

- (void)resumePendingOperations
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_13(&dword_21469E000, a4, a3, "BS [%@] will resume %@", (uint8_t *)a3);

}

- (NSArray)allExtensionIdentifiers
{
  void *v2;
  void *v3;

  -[DEDBugSession identifierManager](self, "identifierManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)pingWithCallback:(id)a3
{
  id v4;
  NSObject *v5;
  DEDWorkerProtocol *worker;
  void *v7;

  v4 = a3;
  -[DEDBugSession log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDBugSession pingWithCallback:].cold.1((uint64_t)v4, self);

  -[DEDBugSession setPingHandler:](self, "setPingHandler:", v4);
  worker = self->_worker;
  -[DEDBugSession identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDWorkerProtocol pingSession:](worker, "pingSession:", v7);

}

- (void)listDiagnosticExtensionsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DEDWorkerProtocol *worker;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a3;
  -[DEDBugSession cachedExtensions](self, "cachedExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEDBugSession cachedExtensions](self, "cachedExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v6);

  }
  else
  {
    if (v11)
    {
      -[DEDBugSession deListCompletions](self, "deListCompletions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v11, "copy");
      v9 = (void *)MEMORY[0x2199D4184]();
      objc_msgSend(v7, "addObject:", v9);

    }
    worker = self->_worker;
    -[DEDBugSession identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol listAvailableExtensionsForSession:](worker, "listAvailableExtensionsForSession:", v5);
  }

}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  DEDWorkerProtocol *worker;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DEDSessionStateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[DEDBugSession identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "Getting session state on [%{public}@]", buf, 0xCu);

  }
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("session-state")))
  {
    -[DEDBugSession setSessionStateCompletionBlock:](self, "setSessionStateCompletionBlock:", v4);
    worker = self->_worker;
    -[DEDBugSession identifier](self, "identifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol getSessionStateWithSession:](worker, "getSessionStateWithSession:", v8);
  }
  else
  {
    -[DEDBugSession log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDBugSession getStateWithCompletion:].cold.1(self);

    v10 = (void *)MEMORY[0x2199D4184](v4);
    -[DEDBugSession setSessionStateCompletionBlock:](self, "setSessionStateCompletionBlock:", 0);
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__DEDBugSession_getStateWithCompletion___block_invoke;
    block[3] = &unk_24D1E45D8;
    v13 = v10;
    v8 = v10;
    dispatch_async(v11, block);

  }
}

void __40__DEDBugSession_getStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Device does not have capability %@"), CFSTR("session-state"), *MEMORY[0x24BDD0FC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD1540];
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v6, 103, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addData:(id)a3 withFilename:(id)a4
{
  id v6;
  id v7;
  DEDWorkerProtocol *worker;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution-v2")))
  {
    worker = self->_worker;
    -[DEDBugSession identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol addSessionData:withFilename:forSession:](worker, "addSessionData:withFilename:forSession:", v6, v7, v9);

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDBugSession addData:withFilename:].cold.1(self);

  }
}

- (void)_addSessionData:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[DEDBugSession finisher](self, "finisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[DEDBugSession finisher](self, "finisher");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject writeData:filename:](v10, "writeData:filename:", v6, v7);
  }
  else
  {
    -[DEDBugSession log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDBugSession _addSessionData:filename:].cold.1();
  }

}

- (void)getSessionStatusWithCompletion:(id)a3
{
  DEDWorkerProtocol *worker;
  id v5;

  -[DEDBugSession setStatusCompletionBlock:](self, "setStatusCompletionBlock:", a3);
  worker = self->_worker;
  -[DEDBugSession identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDWorkerProtocol getSessionStatusWithSession:](worker, "getSessionStatusWithSession:", v5);

}

- (void)synchronizeSessionStatusWithCompletion:(id)a3
{
  id v4;
  DEDWorkerProtocol *worker;
  NSObject *v6;

  v4 = a3;
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
  {
    -[DEDBugSession setSyncCompletionBlock:](self, "setSyncCompletionBlock:", v4);
    worker = self->_worker;
    -[DEDBugSession identifier](self, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol syncSessionStatusWithSession:](worker, "syncSessionStatusWithSession:", v6);
  }
  else
  {
    -[DEDBugSession log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DEDBugSession synchronizeSessionStatusWithCompletion:].cold.1();
  }

}

- (void)startDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    -[DEDBugSession log](self, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:].cold.1();
    goto LABEL_15;
  }
  if (!-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
  {
    -[DEDBugSession log](self, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:].cold.2();
LABEL_15:

    goto LABEL_22;
  }
  -[DEDBugSession filePromises](self, "filePromises");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  if (v13)
  {
    objc_msgSend(v10, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession storeCollectionCompletion:forIdentifier:](self, "storeCollectionCompletion:forIdentifier:", v13, v16);

  }
  if (!-[DEDBugSession isTarget](self, "isTarget"))
    goto LABEL_20;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "earlierDate:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 != v12)
  {
    -[DEDBugSession identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDDeferredExtensionInfo activityStringForBugSessionIdentifier:dedIdentifier:](DEDDeferredExtensionInfo, "activityStringForBugSessionIdentifier:dedIdentifier:", v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDBugSession willPerformOperationWithID:type:options:](self, "willPerformOperationWithID:type:options:", v20, 2, v11);
    -[DEDBugSession save](self, "save");
    if (v22)
    {
      -[DEDBugSession log](self, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_21469E000, v23, OS_LOG_TYPE_DEFAULT, "Rescheduling an existing collect operation.", (uint8_t *)&v27, 2u);
      }

      objc_msgSend(v22, "schedule");
      goto LABEL_21;
    }

LABEL_20:
    -[DEDBugSession worker](self, "worker");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession identifier](self, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startDiagnosticWithIdentifier:parameters:deferRunUntil:session:", v22, v11, v12, v26);

LABEL_21:
    goto LABEL_22;
  }
  -[DEDBugSession log](self, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138543362;
    v28 = v12;
    _os_log_impl(&dword_21469E000, v25, OS_LOG_TYPE_DEFAULT, "Deferred execution was scheduled in past (%{public}@), running immediately.", (uint8_t *)&v27, 0xCu);
  }

  -[DEDBugSession finallyStartDiagnosticWithIdentifier:parameters:completion:](self, "finallyStartDiagnosticWithIdentifier:parameters:completion:", v10, v11, v13);
LABEL_22:

}

- (void)startDiagnosticExtension:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a4;
  v8 = a5;
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DEDBugSession startDiagnosticExtensionWithIdentifier:parameters:completion:](self, "startDiagnosticExtensionWithIdentifier:parameters:completion:", v9, v11, v8);

}

- (id)startDiagnosticExtensionWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v21[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "earlierDate:", v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v12)
    {
      -[DEDBugSession log](self, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21469E000, v19, OS_LOG_TYPE_DEFAULT, "Deferred execution was scheduled in past, running immediately.", v21, 2u);
      }

      -[DEDBugSession startDiagnosticExtensionWithIdentifier:parameters:completion:](self, "startDiagnosticExtensionWithIdentifier:parameters:completion:", v10, v11, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[DEDBugSession identifierManager](self, "identifierManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifierForExtensionIdentifier:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:](self, "startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:", v17, v11, v12, v13);
    }
  }
  else
  {
    -[DEDBugSession log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:].cold.2();

    v17 = 0;
  }

  return v17;
}

- (id)startDiagnosticExtensionWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DEDBugSession identifierManager](self, "identifierManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierForExtensionIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:completion:](self, "startDiagnosticExtensionWithDEDIdentifier:parameters:completion:", v12, v9, v8);
  return v12;
}

- (void)startDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  DEDWorkerProtocol *worker;
  void *v11;
  void *v12;
  char v13;

  v8 = a3;
  v9 = a4;
  v13 = 0;
  -[DEDBugSession _prepareForStartDiagnosticExtensionWithDEDIdentifier:parameters:newCollectRemovedPendingKill:completion:](self, "_prepareForStartDiagnosticExtensionWithDEDIdentifier:parameters:newCollectRemovedPendingKill:completion:", v8, v9, &v13, a5);
  if (!v13)
  {
    worker = self->_worker;
    objc_msgSend(v8, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol startDiagnosticWithIdentifier:parameters:session:](worker, "startDiagnosticWithIdentifier:parameters:session:", v11, v9, v12);

  }
}

- (void)_prepareForStartDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 newCollectRemovedPendingKill:(BOOL *)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD block[5];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "invocationNumber") < 1
    || -[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
  {
    -[DEDBugSession filePromises](self, "filePromises");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    if (v12)
    {
      objc_msgSend(v10, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDBugSession storeCollectionCompletion:forIdentifier:](self, "storeCollectionCompletion:forIdentifier:", v12, v15);

    }
    if (-[DEDBugSession isTarget](self, "isTarget"))
    {
      if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
      {
        LODWORD(v16) = 0;
      }
      else
      {
        objc_msgSend(v10, "extensionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", v18, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "extensionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", v19, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        -[DEDBugSession pendingOperations](self, "pendingOperations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v20);
        -[DEDBugSession pendingOperations](self, "pendingOperations");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v41);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[DEDBugSession pendingOperations](self, "pendingOperations");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[DEDBugSession log](self, "log");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "stringValue");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v44 = v25;
              _os_log_impl(&dword_21469E000, v24, OS_LOG_TYPE_DEFAULT, "Found matching kill operation for new requested DE [%{public}@], will let it finish", buf, 0xCu);

            }
            -[DEDBugSession log](self, "log");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              -[DEDBugSession pendingOperations](self, "pendingOperations");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", v41);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v44 = v28;
              _os_log_impl(&dword_21469E000, v26, OS_LOG_TYPE_INFO, "Removing matching kill operation: %@", buf, 0xCu);

            }
            -[DEDBugSession pendingOperations](self, "pendingOperations");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeObjectForKey:", v41);

            LODWORD(v16) = 1;
          }
        }
        else
        {

          LODWORD(v16) = 0;
        }
        objc_sync_exit(v20);

      }
      if (a5)
        *a5 = (char)v16;
      if ((_DWORD)v16)
      {
        -[DEDBugSession log](self, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          -[DEDBugSession identifier](self, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v30;
          _os_log_impl(&dword_21469E000, v29, OS_LOG_TYPE_DEFAULT, "Start collection command found matching cancel on DE: [%{public}@]", buf, 0xCu);

        }
      }
      else
      {
        -[DEDBugSession client](self, "client");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[DEDBugSession client](self, "client");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "transportType");

        }
        else
        {
          v33 = 0;
        }

        if (+[DEDCollectionNotification shouldFireNotificationForTransport:](DEDCollectionNotification, "shouldFireNotificationForTransport:", v33))
        {
          v34 = _os_activity_create(&dword_21469E000, "Collect Notify", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __121__DEDBugSession__prepareForStartDiagnosticExtensionWithDEDIdentifier_parameters_newCollectRemovedPendingKill_completion___block_invoke;
          block[3] = &unk_24D1E4600;
          block[4] = self;
          os_activity_apply(v34, block);

        }
        -[DEDBugSession finisher](self, "finisher");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_opt_respondsToSelector();

        if ((v36 & 1) != 0)
        {
          -[DEDBugSession finisher](self, "finisher");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringValue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "didStartCollectingDiagnosticExtensionWithIdentifier:", v38);

        }
        objc_msgSend(v10, "stringValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDBugSession willPerformOperationWithID:type:options:](self, "willPerformOperationWithID:type:options:", v39, 1, v11);

        -[DEDBugSession save](self, "save");
      }
    }
  }
  else
  {
    -[DEDBugSession log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v17, OS_LOG_TYPE_DEFAULT, "Running the same extension multiple times requires enhanced execution.", buf, 2u);
    }

  }
}

void __121__DEDBugSession__prepareForStartDiagnosticExtensionWithDEDIdentifier_parameters_newCollectRemovedPendingKill_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "will fire collection notification for bug session %{public}@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDCollectionNotification fireNotificationWithFinishingMove:](DEDCollectionNotification, "fireNotificationWithFinishingMove:", objc_msgSend(v4, "finishingMove"));

}

- (void)finallyStartDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDDeferredExtensionInfo activityStringForBugSessionIdentifier:dedIdentifier:](DEDDeferredExtensionInfo, "activityStringForBugSessionIdentifier:dedIdentifier:", v11, v8);
    v12 = objc_claimAutoreleasedReturnValue();

    +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "unschedule");
    -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 2, v12);
    -[DEDBugSession save](self, "save");
    -[DEDBugSession _prepareForStartDiagnosticExtensionWithDEDIdentifier:parameters:newCollectRemovedPendingKill:completion:](self, "_prepareForStartDiagnosticExtensionWithDEDIdentifier:parameters:newCollectRemovedPendingKill:completion:", v8, v9, 0, v10);
    +[DEDDaemon sharedInstance](DEDDaemon, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finallyStartDiagnosticWithIdentifier:parameters:session:", v16, v9, v17);

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDBugSession identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136446466;
      v20 = "-[DEDBugSession finallyStartDiagnosticWithIdentifier:parameters:completion:]";
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] called on non target instance of [%{public}@]", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (void)scheduleDiagnosticCollectionForClassBAccessWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  DEDExtensionIdentifier *v9;
  void *v10;
  void *v11;
  DEDDeferredExtensionInfo *v12;
  void *v13;
  void *v14;
  DEDDeferredExtensionInfo *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDBugSession log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = 138543362;
    v17 = v6;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "Will reschedule attachment collection for Class B availability for extension [%{public}@]", (uint8_t *)&v16, 0xCu);
  }

  v9 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v6);
  -[DEDBugSession identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDDeferredExtensionInfo activityStringForBugSessionIdentifier:dedIdentifier:](DEDDeferredExtensionInfo, "activityStringForBugSessionIdentifier:dedIdentifier:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDBugSession willPerformOperationWithID:type:options:](self, "willPerformOperationWithID:type:options:", v11, 2, v7);
  v12 = [DEDDeferredExtensionInfo alloc];
  -[DEDBugSession identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DEDDeferredExtensionInfo initWithBugSessionIdentifier:dedIdentifier:runOnDate:withGracePeriod:](v12, "initWithBugSessionIdentifier:dedIdentifier:runOnDate:withGracePeriod:", v13, v9, v14, 0.0);

  -[DEDDeferredExtensionInfo setRequiresClassBDataAccess:](v15, "setRequiresClassBDataAccess:", 1);
  -[DEDDeferredExtensionInfo setParameters:](v15, "setParameters:", v7);

  -[DEDDeferredExtensionInfo schedule](v15, "schedule");
}

- (void)removeAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "extensionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rootURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession terminateExtension:withInfo:](self, "terminateExtension:withInfo:", v7, 0);

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEDBugSession removeAttachment:].cold.1();

  }
}

- (void)cancelDiagnosticExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession cancelDiagnosticExtensionWithIdentifier:](self, "cancelDiagnosticExtensionWithIdentifier:", v6);

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DEDBugSession cancelDiagnosticExtension:].cold.1();

  }
}

- (void)cancelDiagnosticExtensionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDBugSession identifierManager](self, "identifierManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "knownIdentifiersForExtensionIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "stringValue", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDBugSession terminateExtension:withInfo:](self, "terminateExtension:withInfo:", v13, 0);

        -[DEDBugSession identifierManager](self, "identifierManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "revokeIdentifier:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[DEDBugSession save](self, "save");
}

- (void)cancelDiagnosticExtensionWithIdentifier:(id)a3 invocationNumber:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 && !-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
  {
    -[DEDBugSession log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling a non-zero invocation requires enhanced execution.", buf, 2u);
    }
  }
  else
  {
    -[DEDBugSession identifierManager](self, "identifierManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "knownIdentifiersForExtensionIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "invocationNumber", (_QWORD)v15) == a4)
            -[DEDBugSession cancelDiagnosticExtensionWithDEDExtensionIdentifier:](self, "cancelDiagnosticExtensionWithDEDExtensionIdentifier:", v14);
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

    -[DEDBugSession save](self, "save");
  }

}

- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution")))
  {
    -[DEDBugSession identifierManager](self, "identifierManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isKnownIdentifier:", v4);

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDBugSession terminateExtension:withInfo:](self, "terminateExtension:withInfo:", v7, 0);

      -[DEDBugSession identifierManager](self, "identifierManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "revokeIdentifier:", v4);

      -[DEDBugSession save](self, "save");
    }
    else
    {
      -[DEDBugSession log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[DEDBugSession cancelDiagnosticExtensionWithDEDExtensionIdentifier:].cold.1((uint64_t)v4, self);

    }
  }
  else
  {
    -[DEDBugSession log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDBugSession cancelDiagnosticExtensionWithDEDExtensionIdentifier:].cold.2();

  }
}

- (void)_terminateExtensionWithIdentifier:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  DEDWorkerProtocol *worker;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    -[DEDBugSession log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEDBugSession _terminateExtensionWithIdentifier:info:].cold.1();

  }
  worker = self->_worker;
  -[DEDBugSession identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDWorkerProtocol terminateExtension:info:session:](worker, "terminateExtension:info:session:", v6, v7, v10);

}

- (void)commit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  DEDWorkerProtocol *worker;
  id v9;
  uint8_t buf[16];

  if (!-[DEDBugSession isTarget](self, "isTarget"))
    goto LABEL_7;
  -[DEDBugSession clearNotification](self, "clearNotification");
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", CFSTR("finishOperation"), 1000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  if (!v6)
  {
    -[DEDBugSession willPerformOperationWithID:type:options:](self, "willPerformOperationWithID:type:options:", CFSTR("finishOperation"), 1000, 0);
    -[DEDBugSession save](self, "save");
LABEL_7:
    worker = self->_worker;
    -[DEDBugSession identifier](self, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol commitSession:](worker, "commitSession:", v9);

    return;
  }
  -[DEDBugSession log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "received commit more than once", buf, 2u);
  }

}

- (void)cancel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession clearNotification](self, "clearNotification");
    -[DEDBugSession willPerformOperationWithID:type:options:](self, "willPerformOperationWithID:type:options:", CFSTR("cancelOperation"), 2000, MEMORY[0x24BDBD1B8]);
    -[DEDBugSession save](self, "save");
    -[DEDBugSession ongoingExtensionCollectionOperations](self, "ongoingExtensionCollectionOperations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession scheduledDeferredExtensionCollectionOperations](self, "scheduledDeferredExtensionCollectionOperations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") || objc_msgSend(v4, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v27;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v27 != v8)
              objc_enumerationMutation(v5);
            -[DEDBugSession cancelDiagnosticExtensionWithIdentifier:](self, "cancelDiagnosticExtensionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v7);
      }

      +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v4;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), (_QWORD)v22);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              objc_msgSend(v16, "dedIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[DEDBugSession cancelDiagnosticExtensionWithDEDExtensionIdentifier:](self, "cancelDiagnosticExtensionWithDEDExtensionIdentifier:", v18);

              objc_msgSend(v17, "unschedule");
            }

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v13);
      }

    }
    else
    {
      -[DEDBugSession _cancel](self, "_cancel");
    }

  }
  else
  {
    -[DEDBugSession worker](self, "worker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cancelSession:", v20);

    -[DEDBugSession cleanup](self, "cleanup");
  }
  -[DEDBugSession identifierManager](self, "identifierManager", (_QWORD)v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reset");

}

- (void)adoptFiles:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  DEDAttachmentHandler *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  DEDWorkerProtocol *worker;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[DEDBugSession adoptFilesCompletions](self, "adoptFilesCompletions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x2199D4184](v7);
    objc_msgSend(v8, "insertObject:atIndex:", v9, 0);

  }
  v10 = objc_alloc_init(DEDAttachmentHandler);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        -[DEDAttachmentHandler identifierForAdoptingFile:](v10, "identifierForAdoptingFile:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[DEDBugSession filePromises](self, "filePromises");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v16);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  worker = self->_worker;
  -[DEDBugSession identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDWorkerProtocol adoptFiles:forSession:](worker, "adoptFiles:forSession:", v11, v19);

}

- (void)scheduleNotification
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Target device [%{public}@] does not have Remote Notification capability. Cannot schedule notification", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)clearNotification
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Target device [%{public}@] does not have Remote Notification capability. Cannot clear notification", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  DEDWorkerProtocol *worker;
  void *v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("enhanced-execution-v2")))
  {
    if (v10)
      -[DEDBugSession setDeTextDataLoadCompletion:](self, "setDeTextDataLoadCompletion:", v10);
    worker = self->_worker;
    -[DEDBugSession identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDWorkerProtocol loadTextDataForExtensions:localization:sessionID:](worker, "loadTextDataForExtensions:localization:sessionID:", v8, v9, v12);

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DEDBugSession loadTextDataForExtensions:localization:completion:].cold.1(self);

  }
}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  DEDClientProtocol *client;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[DEDBugSession deTextDataLoadCompletion](self, "deTextDataLoadCompletion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEDBugSession deTextDataLoadCompletion](self, "deTextDataLoadCompletion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    -[DEDBugSession setDeTextDataLoadCompletion:](self, "setDeTextDataLoadCompletion:", 0);
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__DEDBugSession_didLoadTextDataForExtensions_localization___block_invoke;
    v15[3] = &unk_24D1E4628;
    v17 = v10;
    v16 = v6;
    v12 = v10;
    dispatch_async(v11, v15);

  }
  else
  {
    client = self->_client;
    -[DEDBugSession identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDClientProtocol didLoadTextDataForExtensions:localization:session:](client, "didLoadTextDataForExtensions:localization:session:", v6, v7, v14);

  }
}

uint64_t __59__DEDBugSession_didLoadTextDataForExtensions_localization___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)pong
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[DEDBugSession pong]";
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13(&dword_21469E000, a2, v4, "%s %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_2();
}

void __21__DEDBugSession_pong__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)supportsDiagnostics:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  DEDClientProtocol *client;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[DEDBugSession log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDBugSession supportsDiagnostics:].cold.1(self, v5);

  -[DEDBugSession deListCompletions](self, "deListCompletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DEDBugSession deListCompletions](self, "deListCompletions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");

    -[DEDBugSession hashExtensions:](self, "hashExtensions:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession setCachedExtensions:](self, "setCachedExtensions:", v9);

    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__DEDBugSession_supportsDiagnostics___block_invoke;
    v13[3] = &unk_24D1E4628;
    v15 = v7;
    v14 = v4;
    dispatch_async(v10, v13);

    v11 = v15;
  }
  else
  {
    client = self->_client;
    -[DEDBugSession identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDClientProtocol deviceSupportsDiagnosticExtensions:session:](client, "deviceSupportsDiagnosticExtensions:session:", v4, v11);
  }

}

uint64_t __37__DEDBugSession_supportsDiagnostics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)didAdoptFilesWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  DEDClientProtocol *client;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  -[DEDBugSession adoptFilesCompletions](self, "adoptFilesCompletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[DEDBugSession adoptFilesCompletions](self, "adoptFilesCompletions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDBugSession adoptFilesCompletions](self, "adoptFilesCompletions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");

    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__DEDBugSession_didAdoptFilesWithError___block_invoke;
    v14[3] = &unk_24D1E4628;
    v16 = v8;
    v15 = v4;
    v11 = v8;
    dispatch_async(v10, v14);

  }
  else
  {
    client = self->_client;
    -[DEDBugSession identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDClientProtocol didAdoptFilesWithError:forSession:](client, "didAdoptFilesWithError:forSession:", v4, v13);

  }
}

uint64_t __40__DEDBugSession_didAdoptFilesWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4
{
  DEDClientProtocol *client;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  _QWORD block[7];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  client = self->_client;
  -[DEDBugSession identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDClientProtocol uploadProgress:total:sessionID:](client, "uploadProgress:total:sessionID:", a3, a4, v8);

  -[DEDBugSession uploadDelegate](self, "uploadDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__DEDBugSession_uploadProgress_total___block_invoke;
    block[3] = &unk_24D1E4650;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(v10, block);
LABEL_3:

    goto LABEL_4;
  }
  if (self->_client && -[DEDBugSession instanceType](self, "instanceType") == 1)
  {
    -[DEDBugSession log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDBugSession identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "uploadDelegate is nil in session [%{public}@]. Cannot send update", buf, 0xCu);

    }
    goto LABEL_3;
  }
LABEL_4:
  v11 = -[DEDBugSession isTarget](self, "isTarget");
  if (a3 == a4 && !v11)
    -[DEDBugSession cleanupFinishedUploads:](self, "cleanupFinishedUploads:", 1);
}

void __38__DEDBugSession_uploadProgress_total___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "uploadDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uploadProgress:total:session:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4
{
  DEDClientProtocol *client;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[7];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  client = self->_client;
  -[DEDBugSession identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDClientProtocol compressionProgress:total:sessionID:](client, "compressionProgress:total:sessionID:", a3, a4, v8);

  -[DEDBugSession uploadDelegate](self, "uploadDelegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[DEDBugSession uploadDelegate](self, "uploadDelegate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__DEDBugSession_compressionProgress_total___block_invoke;
    block[3] = &unk_24D1E4650;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(v13, block);

  }
  else if (self->_client && -[DEDBugSession instanceType](self, "instanceType") == 1)
  {
    -[DEDBugSession log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDBugSession identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "uploadDelegate is nil or doesn't respond to compressionProgress in session [%{public}@]. Cannot send update", buf, 0xCu);

    }
  }
}

void __43__DEDBugSession_compressionProgress_total___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "uploadDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compressionProgress:total:session:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)didCommit
{
  DEDClientProtocol *client;
  void *v4;

  client = self->_client;
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDClientProtocol didCommitSession:](client, "didCommitSession:", v4);

  -[DEDBugSession setFinisherDidCommit:](self, "setFinisherDidCommit:", 1);
}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  DEDClientProtocol *client;
  DEDWorkerProtocol *worker;
  void *v21;
  DEDWorkerProtocol *v22;
  void *v23;
  char v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!self->_client)
  {
    -[DEDBugSession log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "_finishedDiagnosticWithIdentifier without client", buf, 2u);
    }

  }
  objc_msgSend(v7, "setFromBugSession:", self);
  -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 1, v6);
  if (-[DEDBugSession shouldCollectDiagnosticWithId:](self, "shouldCollectDiagnosticWithId:", v6))
  {
    -[DEDBugSession ongoingCompletionHandlers](self, "ongoingCompletionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    -[DEDBugSession ongoingCompletionHandlers](self, "ongoingCompletionHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v6);

    -[DEDBugSession nextCompletionBlockForIdentifier:](self, "nextCompletionBlockForIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    -[DEDBugSession finisher](self, "finisher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[DEDBugSession finisher](self, "finisher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didCollectAttachmentGroup:", v7);

    }
    if (v12 | v10)
    {
      -[DEDBugSession callbackQueue](self, "callbackQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__DEDBugSession_finishedDiagnosticWithIdentifier_result___block_invoke;
      block[3] = &unk_24D1E4678;
      v28 = (id)v12;
      v27 = v7;
      v29 = (id)v10;
      dispatch_async(v16, block);

      v17 = v28;
    }
    else
    {
      client = self->_client;
      -[DEDBugSession identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDClientProtocol finishedDiagnosticWithIdentifier:result:session:](client, "finishedDiagnosticWithIdentifier:result:session:", v6, v7, v17);
    }

  }
  else
  {
    -[DEDBugSession log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v18, OS_LOG_TYPE_DEFAULT, "DE has finished but should be aborted, will delete all files", buf, 2u);
    }

    -[DEDBugSession _terminateExtensionWithIdentifier:info:](self, "_terminateExtensionWithIdentifier:info:", v6, 0);
  }
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    if (-[DEDBugSession readyToCancel](self, "readyToCancel"))
    {
      -[DEDBugSession _cancel](self, "_cancel");
    }
    else
    {
      if (-[DEDBugSession readyToNotify](self, "readyToNotify"))
      {
        worker = self->_worker;
        -[DEDBugSession identifier](self, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDWorkerProtocol scheduleNotificationForSession:](worker, "scheduleNotificationForSession:", v21);
      }
      else
      {
        if (!-[DEDBugSession readyToFinish](self, "readyToFinish"))
          goto LABEL_24;
        v22 = self->_worker;
        -[DEDBugSession identifier](self, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDWorkerProtocol commitSession:](v22, "commitSession:", v21);
      }

      -[DEDBugSession finisher](self, "finisher");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        -[DEDBugSession finisher](self, "finisher");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "didFinishAllCollections");

      }
    }
  }
LABEL_24:

}

uint64_t __57__DEDBugSession_finishedDiagnosticWithIdentifier_result___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[4]);
  return result;
}

- (void)didGetState:(int64_t)a3 info:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  int64_t v17;

  v6 = a4;
  -[DEDBugSession sessionStateCompletionBlock](self, "sessionStateCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DEDBugSession sessionStateCompletionBlock](self, "sessionStateCompletionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    -[DEDBugSession setSessionStateCompletionBlock:](self, "setSessionStateCompletionBlock:", 0);
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__DEDBugSession_didGetState_info___block_invoke;
    block[3] = &unk_24D1E46A0;
    v16 = v9;
    v17 = a3;
    v15 = v6;
    v11 = v9;
    dispatch_async(v10, block);

  }
  else
  {
    -[DEDBugSession client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didGetState:info:sessionID:", a3, v6, v13);

  }
}

uint64_t __34__DEDBugSession_didGetState_info___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4], 0);
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4
{
  -[DEDBugSession hasCollected:isCollecting:identifiers:](self, "hasCollected:isCollecting:identifiers:", a3, a4, 0);
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 identifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  DEDExtensionIdentifierManager *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  DEDClientProtocol *client;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf;
  _BYTE v60[15];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDBugSession log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DEDBugSession hasCollected:isCollecting:identifiers:].cold.3(v8);
  v44 = v10;

  -[DEDBugSession log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[DEDBugSession hasCollected:isCollecting:identifiers:].cold.2(v9);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v62 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v18, "extensionID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[DEDBugSession filePromises](self, "filePromises");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "rootURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v20, "addObject:", v22);

        }
        else
        {
          -[DEDBugSession log](self, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[DEDBugSession hasCollected:isCollecting:identifiers:].cold.1(&buf, v60, v20);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v15);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v56 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        -[DEDBugSession filePromises](self, "filePromises");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v30);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v25);
  }

  v31 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke;
  v54[3] = &unk_24D1E46C8;
  v54[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v54);
  if (v44)
  {
    v32 = -[DEDExtensionIdentifierManager initWithExtensionIdentifiers:]([DEDExtensionIdentifierManager alloc], "initWithExtensionIdentifiers:", v44);
    -[DEDBugSession setIdentifierManager:](self, "setIdentifierManager:", v32);

  }
  -[DEDBugSession statusCompletionBlock](self, "statusCompletionBlock");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {

  }
  else
  {
    -[DEDBugSession syncCompletionBlock](self, "syncCompletionBlock");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      client = self->_client;
      -[DEDBugSession identifier](self, "identifier");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (v44)
        -[DEDClientProtocol hasCollected:isCollecting:withIdentifiers:inSession:](client, "hasCollected:isCollecting:withIdentifiers:inSession:", v13, v23, v44, v42);
      else
        -[DEDClientProtocol hasCollected:isCollecting:inSession:](client, "hasCollected:isCollecting:inSession:", v13, v23, v42);
      goto LABEL_32;
    }
  }
  -[DEDBugSession statusCompletionBlock](self, "statusCompletionBlock");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[DEDBugSession statusCompletionBlock](self, "statusCompletionBlock");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession setStatusCompletionBlock:](self, "setStatusCompletionBlock:", 0);
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v37 = objc_claimAutoreleasedReturnValue();
    block[0] = v31;
    block[1] = 3221225472;
    block[2] = __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_2;
    block[3] = &unk_24D1E46F0;
    v53 = v36;
    v51 = v13;
    v52 = v23;
    v38 = v36;
    dispatch_async(v37, block);

  }
  -[DEDBugSession syncCompletionBlock](self, "syncCompletionBlock");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[DEDBugSession syncCompletionBlock](self, "syncCompletionBlock");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession setSyncCompletionBlock:](self, "setSyncCompletionBlock:", 0);
    -[DEDBugSession callbackQueue](self, "callbackQueue");
    v41 = objc_claimAutoreleasedReturnValue();
    v45[0] = v31;
    v45[1] = 3221225472;
    v45[2] = __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_3;
    v45[3] = &unk_24D1E4718;
    v49 = v40;
    v46 = v13;
    v47 = v23;
    v48 = v44;
    v42 = v40;
    dispatch_async(v41, v45);

LABEL_32:
  }

}

uint64_t __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFromBugSession:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)terminateExtension:(id)a3 withInfo:(id)a4
{
  id v6;
  NSObject *v7;
  DEDExtensionIdentifier *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  DEDExtensionIdentifier *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  DEDExtensionIdentifier *v31;
  DEDBugSession *v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = a4;
  -[DEDBugSession log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v6;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Will terminate extension [%{public}@]", buf, 0xCu);
  }

  v8 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v6);
  +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __45__DEDBugSession_terminateExtension_withInfo___block_invoke;
  v30[3] = &unk_24D1E4740;
  v24 = v8;
  v31 = v24;
  v32 = self;
  objc_msgSend(v10, "ded_selectItemsPassingTest:", v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v17, "unschedule");
        -[DEDBugSession scheduledDeferredExtensionCollectionOperations](self, "scheduledDeferredExtensionCollectionOperations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "activityString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "containsObject:", v19);

        if (v20)
        {
          objc_msgSend(v17, "activityString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 2, v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v14);
  }

  -[DEDBugSession identifierManager](self, "identifierManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "revokeIdentifier:", v24);

  -[DEDBugSession filePromises](self, "filePromises");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObject:", v6);

  -[DEDBugSession willPerformOperationWithID:type:options:](self, "willPerformOperationWithID:type:options:", v6, 0, v25);
  -[DEDBugSession save](self, "save");
  -[DEDBugSession _terminateExtensionWithIdentifier:info:](self, "_terminateExtensionWithIdentifier:info:", v6, v25);

}

uint64_t __45__DEDBugSession_terminateExtension_withInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "dedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "bugSessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)didCancel
{
  DEDClientProtocol *client;
  void *v4;

  client = self->_client;
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDClientProtocol didCancelSession:](client, "didCancelSession:", v4);

  if (-[DEDBugSession isTarget](self, "isTarget"))
    -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 2000, CFSTR("cancelOperation"));
}

- (OS_dispatch_queue)diskAccessQueue
{
  DEDBugSession *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[DEDBugSession _diskAccessQueue](v2, "_diskAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.ded.disk-access-queue-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDBugSession log](v2, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDBugSession identifier](v2, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Creating diskAccessQueue [%{public}@] for session [%{public}@]", buf, 0x16u);

    }
    v10 = objc_retainAutorelease(v7);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    -[DEDBugSession set_diskAccessQueue:](v2, "set_diskAccessQueue:", v11);

  }
  objc_sync_exit(v2);

  -[DEDBugSession _diskAccessQueue](v2, "_diskAccessQueue");
  return (OS_dispatch_queue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[DEDBugSession log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDBugSession identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "will cancel session [%{public}@]", (uint8_t *)&v5, 0xCu);

  }
  -[DEDBugSession cleanup](self, "cleanup");
  -[DEDBugSession didCancel](self, "didCancel");
}

- (void)setConfig:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  DEDBugSessionConfiguration *v7;
  NSObject *p_super;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDBugSession log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDBugSession identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] setConfig", (uint8_t *)&v9, 0xCu);

  }
  if (-[DEDBugSession hasCapability:](self, "hasCapability:", CFSTR("mutable-bug-session")))
  {
    if (objc_msgSend(v4, "finishingMove"))
    {
      -[DEDBugSession set_finisher:](self, "set_finisher:", 0);
      -[DEDBugSession set_notifier:](self, "set_notifier:", 0);
      v7 = (DEDBugSessionConfiguration *)v4;
      p_super = &self->_config->super;
      self->_config = v7;
    }
    else
    {
      -[DEDBugSession log](self, "log");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21469E000, p_super, OS_LOG_TYPE_INFO, "BugSession configuration has unset Finishing Move. Will not reset finisher", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    -[DEDBugSession log](self, "log");
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[DEDBugSession setConfig:].cold.1(self);
  }

}

- (DEDBugSessionConfiguration)config
{
  return self->_config;
}

- (void)didStart
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[DEDBugSession log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDBugSession identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v4;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did start", (uint8_t *)&v12, 0xCu);

  }
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", CFSTR("cancelOperation"), 2000);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[DEDBugSession log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[DEDBugSession identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "found cancel operation for restarted session [%{public}@], will remove", (uint8_t *)&v12, 0xCu);

      }
      -[DEDBugSession pendingOperations](self, "pendingOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v6);

    }
    objc_sync_exit(v5);

  }
}

- (void)cleanup
{
  -[DEDBugSession cleanupFinishedUploads:](self, "cleanupFinishedUploads:", 0);
}

- (void)cleanupFinishedUploads:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  DEDAttachmentHandler *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[5];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v3 = a3;
  v54 = *MEMORY[0x24BDAC8D0];
  -[DEDBugSession log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDBugSession identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "will cleanup session [%{public}@]", buf, 0xCu);

  }
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    v41 = v3;
    -[DEDBugSession removeFromStore](self, "removeFromStore");
    v7 = objc_alloc_init(DEDAttachmentHandler);
    -[DEDBugSession identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDAttachmentHandler removeDirectoryForBugSessionIdentifier:](v7, "removeDirectoryForBugSessionIdentifier:", v8);

    -[DEDBugSession finisher](self, "finisher");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[DEDBugSession finisher](self, "finisher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        dispatch_get_global_queue(0, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __40__DEDBugSession_cleanupFinishedUploads___block_invoke;
        block[3] = &unk_24D1E4600;
        block[4] = self;
        dispatch_async(v13, block);

      }
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v20, "bugSessionIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDBugSession identifier](self, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if (v23)
            objc_msgSend(v20, "unschedule");
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v17);
    }

    v3 = v41;
  }
  if (-[DEDBugSession isTarget](self, "isTarget"))
    goto LABEL_21;
  -[DEDBugSession worker](self, "worker");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "transportType") == 3)
  {

LABEL_21:
    -[DEDBugSession log](self, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[DEDBugSession cleanupFinishedUploads:].cold.1();

    +[DEDDaemon sharedInstance](DEDDaemon, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "controller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  -[DEDBugSession worker](self, "worker");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "transportType");

  if (v26 == 4)
    goto LABEL_21;
  -[DEDBugSession worker](self, "worker");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "transportType");

  if (v39 == 2)
  {
    -[DEDBugSession log](self, "log");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v40, OS_LOG_TYPE_INFO, "Cleaning up app side", buf, 2u);
    }

    +[DEDManager sharedInstance](DEDManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
LABEL_24:
  if (v3)
  {
    -[DEDBugSession identifier](self, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "didFinishSessionWithIdentifier:", v30);

  }
  -[DEDBugSession identifier](self, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeSessionWithIdentifier:", v31);

  -[DEDBugSession log](self, "log");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDBugSession identifier](self, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sessions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");
    objc_msgSend(v29, "sessions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "allKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v33;
    v49 = 2048;
    v50 = v35;
    v51 = 2114;
    v52 = v37;
    _os_log_impl(&dword_21469E000, v32, OS_LOG_TYPE_DEFAULT, "Removed bug session from memory (%{public}@), [%lu] remaining sessions: %{public}@", buf, 0x20u);

  }
}

void __40__DEDBugSession_cleanupFinishedUploads___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "finisher");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cleanup");

}

- (void)didFinishAllUploads
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 1000, CFSTR("finishOperation"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession uploadStartTime](self, "uploadStartTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = v5;

    -[DEDBugSession setUploadStartTime:](self, "setUploadStartTime:", 0);
    v7 = (void *)objc_opt_new();
    -[DEDBugSession identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "directoryForBugSessionIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(MEMORY[0x24BE2C9A0], "getDirectorySize:", v9);
    -[DEDBugSession config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics finisherDidCompleteWithDuration:uploadedByteCount:usingFinishingMove:withState:](DEDAnalytics, "finisherDidCompleteWithDuration:uploadedByteCount:usingFinishingMove:withState:", (unint64_t)v6, v10, objc_msgSend(v11, "finishingMove"), 1);

    +[DEDAnalytics didCompleteBugSessionWithState:](DEDAnalytics, "didCompleteBugSessionWithState:", 1);
  }
  -[DEDBugSession cleanupFinishedUploads:](self, "cleanupFinishedUploads:", 1);
}

- (BOOL)readyToCancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type") == 2000;

  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v3);
  return v9;
}

- (BOOL)readyToFinish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type") == 1000;

  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v3);
  return v9;
}

- (BOOL)isRunningDE:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
    objc_sync_exit(v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCollectDiagnosticWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[DEDBugSession isTarget](self, "isTarget"))
    goto LABEL_6;
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  if (v8)
  {
    -[DEDBugSession log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "hashingKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "found kill DE operation [%{public}@]", (uint8_t *)&v13, 0xCu);

    }
    v11 = 0;
  }
  else
  {
LABEL_6:
    v11 = 1;
  }

  return v11;
}

- (void)didTerminateDiagnosticExtension:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DEDWorkerProtocol *worker;
  void *v10;
  DEDWorkerProtocol *v11;
  DEDExtensionIdentifier *v12;

  v6 = a4;
  v7 = a3;
  -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 0, v7);
  v12 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v7);
  -[DEDBugSession identifierManager](self, "identifierManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "revokeIdentifier:", v12);

  -[DEDBugSession save](self, "save");
  -[DEDBugSession notifyPromiseCancellationIfNeeded:info:](self, "notifyPromiseCancellationIfNeeded:info:", v7, v6);

  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    if (!-[DEDBugSession readyToCancel](self, "readyToCancel"))
    {
      if (-[DEDBugSession readyToNotify](self, "readyToNotify"))
      {
        worker = self->_worker;
        -[DEDBugSession identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDWorkerProtocol scheduleNotificationForSession:](worker, "scheduleNotificationForSession:", v10);
      }
      else
      {
        if (!-[DEDBugSession readyToFinish](self, "readyToFinish"))
          goto LABEL_9;
        v11 = self->_worker;
        -[DEDBugSession identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDWorkerProtocol commitSession:](v11, "commitSession:", v10);
      }

      goto LABEL_9;
    }
    -[DEDBugSession _cancel](self, "_cancel");
  }
LABEL_9:

}

- (void)notifyPromiseCancellationIfNeeded:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession finisher](self, "finisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[DEDBugSession finisher](self, "finisher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didCancelCollectionOnExtension:", v6);

    }
    -[DEDBugSession log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[DEDBugSession notifyPromiseCancellationIfNeeded:info:].cold.1((uint64_t)v6, self);

    +[DEDDaemon sharedInstance](DEDDaemon, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDBugSession identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "teardownDeferredDiagnosticsWithIdentifier:parameters:session:", v6, v7, v13);

  }
}

- (id)ongoingCollectOperationsWithOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "ded_selectItemsPassingTest:", &__block_literal_global_110);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ded_mapWithBlock:", &__block_literal_global_112);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession log](self, "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[DEDBugSession identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v13;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEBUG, "BS [%@] Pending operations %@, to kill %@", buf, 0x20u);

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke_113;
  v14[3] = &unk_24D1E4740;
  v15 = v6;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v4, "ded_rejectItemsPassingTest:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 0;
}

uint64_t __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke_113(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "type") == 1 || objc_msgSend(v3, "type") == 2)
    && (v4 = *(void **)(a1 + 32),
        objc_msgSend(v3, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5),
        v5,
        (_DWORD)v4))
  {
    v6 = *(NSObject **)(a1 + 40);
    v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = v6;
      objc_msgSend(v3, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "Found collect operation [%{public}@] marked for deletion", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)ongoingExtensionCollectionOperations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession ongoingCollectOperationsWithOperations:](self, "ongoingCollectOperationsWithOperations:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_114);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v8;
}

BOOL __53__DEDBugSession_ongoingExtensionCollectionOperations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (id)scheduledDeferredExtensionCollectionOperations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession ongoingCollectOperationsWithOperations:](self, "ongoingCollectOperationsWithOperations:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_115);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v8;
}

BOOL __63__DEDBugSession_scheduledDeferredExtensionCollectionOperations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

- (void)didAdoptGroup:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DEDBugSession finisher](self, "finisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DEDBugSession finisher](self, "finisher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didAdoptAttachmentGroup:", v7);

  }
}

- (int64_t)instanceType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  -[DEDBugSession client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[DEDBugSession worker](self, "worker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[DEDBugSession log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DEDBugSession instanceType].cold.1();

      return 0;
    }
  }
  -[DEDBugSession client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "transportType") == 4)
  {

    return 4;
  }
  -[DEDBugSession client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "transportType");

  if (v7 == 3)
    return 4;
  -[DEDBugSession worker](self, "worker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "transportType");

  if (v10 == 1)
    return 3;
  -[DEDBugSession worker](self, "worker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "transportType") == 3)
  {

    return 2;
  }
  -[DEDBugSession worker](self, "worker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "transportType");

  if (v14 == 4)
    return 2;
  -[DEDBugSession worker](self, "worker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "transportType");

  if (v16 != 2)
  {
    -[DEDBugSession log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DEDBugSession instanceType].cold.2(self);

    return 0;
  }
  return 1;
}

- (BOOL)isTarget
{
  void *v2;
  BOOL v3;

  -[DEDBugSession worker](self, "worker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transportType") == 1;

  return v3;
}

- (id)hashExtensions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)nextCompletionBlockForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[DEDBugSession deCompletions](self, "deCompletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "removeLastObject");
      v8 = (void *)MEMORY[0x2199D4184](v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)storeCollectionCompletion:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[DEDBugSession deCompletions](self, "deCompletions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v9 = (void *)objc_msgSend(v12, "copy");
  v10 = (void *)MEMORY[0x2199D4184]();
  objc_msgSend(v8, "addObject:", v10);

  -[DEDBugSession deCompletions](self, "deCompletions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v8, v6);

}

- (BOOL)hasCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[DEDBugSession config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestedCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)notifier
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  __objc2_class *v7;
  char *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[DEDBugSession _notifier](self, "_notifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_22;
  v4 = -[DEDBugSession instanceType](self, "instanceType");
  if (v4 < 2)
  {
    -[DEDBugSession log](self, "log");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      -[DEDBugSession notifier].cold.1(self, v8);
  }
  else if (v4 - 2 >= 2)
  {
    if (v4 != 4)
      goto LABEL_18;
    -[DEDBugSession client](self, "client");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "conformsToProtocol:", &unk_254D88E98) & 1) != 0)
    {
      -[DEDBugSession client](self, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_254D84968);

      if (!v10)
        goto LABEL_18;
      -[DEDBugSession client](self, "client");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      -[DEDBugSession set_notifier:](self, "set_notifier:", v8);
    }
  }
  else
  {
    -[DEDBugSession config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "notifyingMove");

    if (v6 == 1)
    {
      v7 = DEDUserNotificationNotifier;
      goto LABEL_14;
    }
    if (v6 == 2)
    {
      v7 = DEDFollowUpNotifier;
LABEL_14:
      v11 = [v7 alloc];
      -[DEDBugSession config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithConfiguration:session:", v12, self);
      -[DEDBugSession set_notifier:](self, "set_notifier:", v13);

      goto LABEL_18;
    }
    -[DEDBugSession log](self, "log");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21469E000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Unknown notifier specified.", (uint8_t *)&v20, 2u);
    }
  }

LABEL_18:
  -[DEDBugSession _notifier](self, "_notifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DEDBugSession log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDBugSession _notifier](self, "_notifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_DEFAULT, "Using notifier [%{public}@]", (uint8_t *)&v20, 0xCu);

    }
  }
LABEL_22:
  -[DEDBugSession _notifier](self, "_notifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)readyToNotify
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type") == 100;

  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v3);
  return v9;
}

- (void)presentNotificationOnFilingDevice
{
  void *v3;
  void *v4;

  -[DEDBugSession notifier](self, "notifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentNotificationForSession:", v4);

  if (-[DEDBugSession instanceType](self, "instanceType") == 3)
    -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 100, CFSTR("notifyOperation"));
}

- (void)idsInbound_presentNotificationOnFilingDevice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "[%{public}s] not supported in instance type [%ld]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)idsInbound_didPresentNotificationOnFilingDevice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "[%{public}s] not supported in instance type [%ld]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)clearNotificationOnFilingDevice
{
  void *v3;
  void *v4;

  -[DEDBugSession notifier](self, "notifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNotificationForSession:", v4);

  if (-[DEDBugSession instanceType](self, "instanceType") == 3)
    -[DEDBugSession didFinishOperation:withIdentifier:](self, "didFinishOperation:withIdentifier:", 100, CFSTR("notifyOperation"));
}

- (void)idsInbound_clearNotificationOnFilingDevice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "[%{public}s] not supported in instance type [%ld]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)idsInbound_didClearNotificationOnFilingDevice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "[%{public}s] not supported in instance type [%ld]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)removeFromStore
{
  id v3;

  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    +[DEDPersistence sharedInstance](DEDPersistence, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeBugSession:", self);

  }
}

- (void)save
{
  id v3;

  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    +[DEDPersistence sharedInstance](DEDPersistence, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateBugSession:", self);

  }
}

- (void)willPerformOperationWithID:(id)a3 type:(int64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v10);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setIdentifier:", v8);
    objc_msgSend(v11, "setType:", a4);
    objc_msgSend(v11, "setOptions:", v9);
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hashingKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

    -[DEDBugSession log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "hashingKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_INFO, "will persist operation [%{public}@]", (uint8_t *)&v16, 0xCu);

    }
    objc_sync_exit(v10);

  }
  -[DEDBugSession _logOperationQueue](self, "_logOperationQueue");

}

- (void)didFinishOperation:(int64_t)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", v6, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    objc_sync_exit(v7);
    if (a3 == 2000)
    {
      -[DEDBugSession log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[DEDBugSession identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Did finish cancel operation on [%{public}@]", (uint8_t *)&v12, 0xCu);

      }
    }
    else
    {
      -[DEDBugSession save](self, "save");
    }
  }
  -[DEDBugSession _logOperationQueue](self, "_logOperationQueue");

}

- (void)setUploadDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  DEDBugSession *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[DEDBugSession instanceType](self, "instanceType") == 1)
  {
    -[DEDBugSession log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDBugSession identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v4;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Setting uploadDelegate: [%{public}@] session [%{public}@]", (uint8_t *)&v8, 0x16u);

    }
  }
  v7 = self;
  objc_sync_enter(v7);
  -[DEDBugSession set__uploadDelegate:](v7, "set__uploadDelegate:", v4);
  objc_sync_exit(v7);

}

- (DEDUploadStatusDelegate)uploadDelegate
{
  DEDBugSession *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[DEDBugSession __uploadDelegate](v2, "__uploadDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (DEDUploadStatusDelegate *)v3;
}

- (void)_streamOperationQueue
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DEDBugSession__streamOperationQueue__block_invoke;
  block[3] = &unk_24D1E4600;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __38__DEDBugSession__streamOperationQueue__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_logOperationQueue");
  return objc_msgSend(*(id *)(a1 + 32), "_streamOperationQueue");
}

- (void)_logOperationQueue
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_logOperationQueue_onceToken != -1)
    dispatch_once(&_logOperationQueue_onceToken, &__block_literal_global_171);
  if (-[DEDBugSession isTarget](self, "isTarget"))
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    v4 = (id)_logOperationQueue_opDebugLog;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[DEDBugSession identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDBugSession pendingOperations](self, "pendingOperations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEBUG, "BS [%@] Operations %@", (uint8_t *)&v8, 0x16u);

    }
    objc_sync_exit(v3);

  }
}

void __35__DEDBugSession__logOperationQueue__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-op-watch");
  v1 = (void *)_logOperationQueue_opDebugLog;
  _logOperationQueue_opDebugLog = (uint64_t)v0;

}

+ (id)testingInstance
{
  return (id)objc_opt_new();
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)priorClientTransportType
{
  return self->_priorClientTransportType;
}

- (void)setPriorClientTransportType:(int64_t)a3
{
  self->_priorClientTransportType = a3;
}

- (int64_t)priorWorkerTransportType
{
  return self->_priorWorkerTransportType;
}

- (void)setPriorWorkerTransportType:(int64_t)a3
{
  self->_priorWorkerTransportType = a3;
}

- (NSMutableSet)filePromises
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFilePromises:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)_diskAccessQueue
{
  return self->__diskAccessQueue;
}

- (void)set_diskAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->__diskAccessQueue, a3);
}

- (id)pingHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPingHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (DEDUploadStatusDelegate)__uploadDelegate
{
  return (DEDUploadStatusDelegate *)objc_loadWeakRetained((id *)&self->___uploadDelegate);
}

- (void)set__uploadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->___uploadDelegate, a3);
}

- (NSMutableArray)deListCompletions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeListCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)deCompletions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)adoptFilesCompletions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdoptFilesCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)ongoingCompletionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOngoingCompletionHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (DEDExtensionIdentifierManager)identifierManager
{
  return (DEDExtensionIdentifierManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdentifierManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDate)uploadStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUploadStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)finisherDidCommit
{
  return self->_finisherDidCommit;
}

- (void)setFinisherDidCommit:(BOOL)a3
{
  self->_finisherDidCommit = a3;
}

- (NSMutableDictionary)pendingOperations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPendingOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (id)statusCompletionBlock
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setStatusCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)sessionStateCompletionBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setSessionStateCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)syncCompletionBlock
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setSyncCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (id)deTextDataLoadCompletion
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setDeTextDataLoadCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSDictionary)cachedExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCachedExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (DEDClientProtocol)client
{
  return (DEDClientProtocol *)objc_getProperty(self, a2, 184, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)priorClientAddress
{
  return self->_priorClientAddress;
}

- (void)setPriorClientAddress:(id)a3
{
  objc_storeStrong((id *)&self->_priorClientAddress, a3);
}

- (DEDWorkerProtocol)worker
{
  return (DEDWorkerProtocol *)objc_getProperty(self, a2, 200, 1);
}

- (void)setWorker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (DEDFinisher)_finisher
{
  return (DEDFinisher *)objc_getProperty(self, a2, 208, 1);
}

- (void)set_finisher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (DEDNotifier)_notifier
{
  return (DEDNotifier *)objc_getProperty(self, a2, 216, 1);
}

- (void)set_notifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->__notifier, 0);
  objc_storeStrong((id *)&self->__finisher, 0);
  objc_storeStrong((id *)&self->_worker, 0);
  objc_storeStrong((id *)&self->_priorClientAddress, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cachedExtensions, 0);
  objc_storeStrong(&self->_deTextDataLoadCompletion, 0);
  objc_storeStrong(&self->_syncCompletionBlock, 0);
  objc_storeStrong(&self->_sessionStateCompletionBlock, 0);
  objc_storeStrong(&self->_statusCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_uploadStartTime, 0);
  objc_storeStrong((id *)&self->_identifierManager, 0);
  objc_storeStrong((id *)&self->_ongoingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_adoptFilesCompletions, 0);
  objc_storeStrong((id *)&self->_deCompletions, 0);
  objc_storeStrong((id *)&self->_deListCompletions, 0);
  objc_destroyWeak((id *)&self->___uploadDelegate);
  objc_storeStrong(&self->_pingHandler, 0);
  objc_storeStrong((id *)&self->__diskAccessQueue, 0);
  objc_storeStrong((id *)&self->_filePromises, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id)stateInfo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[DEDBugSession finisherWithState](self, "finisherWithState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalStateInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1B8];
  v5 = v3;

  return v5;
}

- (int64_t)state
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  NSObject *v20;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  _DWORD v32[2];
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (-[DEDBugSession readyToFinish](self, "readyToFinish"))
  {
    -[DEDBugSession finisherWithState](self, "finisherWithState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUploading");

    if ((v5 & 1) == 0)
    {
      -[DEDBugSession finisherWithState](self, "finisherWithState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isCompressing");

      if ((v26 & 1) == 0)
      {
        -[DEDBugSession finisherWithState](self, "finisherWithState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isUploading");

        if ((v28 & 1) != 0)
        {
          v6 = 7;
          goto LABEL_29;
        }
        Log_4();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_21469E000, v30, OS_LOG_TYPE_DEFAULT, "Finisher not compressing, uploading or finished but session is ready to finish", (uint8_t *)v32, 2u);
        }

      }
      v6 = 5;
      goto LABEL_29;
    }
    v6 = 6;
  }
  else
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    -[DEDBugSession ongoingExtensionCollectionOperations](self, "ongoingExtensionCollectionOperations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[DEDBugSession scheduledDeferredExtensionCollectionOperations](self, "scheduledDeferredExtensionCollectionOperations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = -[DEDBugSession isCancelling](self, "isCancelling");
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", CFSTR("notifyOperation"), 100);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v7);
    v18 = -[DEDBugSession hasDirectory](self, "hasDirectory");
    v19 = -[DEDBugSession hasStaleDirectory](self, "hasStaleDirectory");
    DEDSessionStateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v32[0] = 67110656;
      v32[1] = v9 != 0;
      v33 = 1024;
      v34 = v11 != 0;
      v35 = 1024;
      v36 = v13 != 0;
      v37 = 1024;
      v38 = v18;
      v39 = 1024;
      v40 = v19;
      v41 = 1024;
      v42 = v14;
      v43 = 1024;
      v44 = v17 != 0;
      _os_log_debug_impl(&dword_21469E000, v20, OS_LOG_TYPE_DEBUG, "IC: [%i] HDCO: [%i] HPO: [%i] HDIR: [%i] HSDIR [%i] IC [%i] HNO [%i]", (uint8_t *)v32, 0x2Cu);
    }
    v21 = v9 != 0;

    v22 = v14 || v21 || v11 != 0;
    v23 = 3;
    if (v21)
      v23 = 4;
    if (v14)
      v6 = 8;
    else
      v6 = v23;
    if (!v22)
    {
      if (!v13 || v17)
      {
        v29 = 2;
        if (v19)
          v29 = -1;
        if (v18)
          v6 = v29;
        else
          v6 = 1;
      }
      else
      {
        Log_4();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[DEDBugSession(DaemonTasks) state].cold.1(v24);

        v6 = -2;
      }
    }
  }
LABEL_29:
  objc_sync_exit(v3);

  return v6;
}

- (BOOL)isCancelling
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[DEDBugSession pendingOperations](self, "pendingOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDBugSessionOperation hashingKeyWithId:type:](DEDBugSessionOperation, "hashingKeyWithId:type:", CFSTR("cancelOperation"), 2000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ded_selectItemsPassingTest:", &__block_literal_global_24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    -[DEDBugSession pendingOperations](self, "pendingOperations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ded_selectItemsPassingTest:", &__block_literal_global_8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v12 == v16)
    {
      -[DEDBugSession pendingOperations](self, "pendingOperations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v18, "count") == 2 * v12;

      return v8;
    }
    return 0;
  }
  return 1;
}

BOOL __42__DEDBugSession_DaemonTasks__isCancelling__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 1 || objc_msgSend(v2, "type") == 2;

  return v3;
}

BOOL __42__DEDBugSession_DaemonTasks__isCancelling__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 0;
}

- (id)finisherWithState
{
  void *v2;
  id v3;

  -[DEDBugSession finisher](self, "finisher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_254D88178))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)hasDirectory
{
  DEDAttachmentHandler *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(DEDAttachmentHandler);
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentHandler directoryForBugSessionIdentifier:](v3, "directoryForBugSessionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0);
  return (char)v4;
}

- (BOOL)hasStaleDirectory
{
  DEDAttachmentHandler *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(DEDAttachmentHandler);
  -[DEDBugSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentHandler directoryForBugSessionIdentifier:](v3, "directoryForBugSessionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[DEDBugSession hasDirectory](self, "hasDirectory"))
  {
    v6 = *MEMORY[0x24BDBCBE0];
    v7 = *MEMORY[0x24BDBCBF0];
    v20[0] = *MEMORY[0x24BDBCBE0];
    v20[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v5, "resourceValuesForKeys:error:", v8, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;

    if (v10)
    {
      Log_4();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DEDBugSession(DaemonTasks) hasStaleDirectory].cold.1(self, (uint64_t)v10, v11);
      v12 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v14, "setDay:", -7);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(MEMORY[0x24BDBCE60]);
      objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v14, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && -[NSObject compare:](v11, "compare:", v17) == -1)
      {
        v12 = 1;
      }
      else if (v13)
      {
        v12 = objc_msgSend(v13, "compare:", v17) == -1;
      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)configuration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "could not copy configuration because it is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)attachCompletionHandlerForDEDExtensionIdentifier:(uint64_t)a1 handler:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v3, v4, "Unknown DEDExtensionIdentifier [%{public}@] for bug session [%{public}@] - adding to completion handlers anyway.", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)pingWithCallback:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x2199D4184]();
  objc_msgSend(a2, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(&dword_21469E000, v4, v5, "%s with handler %@ on %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)getStateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "[%{public}@] does not support session sate API.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)addData:(void *)a1 withFilename:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16(&dword_21469E000, v2, v3, "Session [%{public}@] does not have [%{public}@]. Cannot proceed with [%{public}s]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)_addSessionData:filename:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_21469E000, v0, OS_LOG_TYPE_ERROR, "Finisher does not handle writeData:filename:. Will drop [%{public}@]", v1, 0xCu);
}

- (void)synchronizeSessionStatusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Synchronize session status requires enhanced execution. Use -getSessionStatusWithCompletion: instead.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Deferred execution method was called, but with no date. Aborting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "This session does not support deferred execution. Aborting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)removeAttachment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "given attachment group has not extension identifier, cannot remove it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)cancelDiagnosticExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "extension identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v3, v4, "Trying to cancel an invocation for an unknown DED identifier [%@] for bug session [%@].", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Cancelling a DEDIdentifier-based collection requires enhanced execution.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)_terminateExtensionWithIdentifier:info:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "cannot terminate extensions with null identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)loadTextDataForExtensions:(void *)a1 localization:completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16(&dword_21469E000, v2, v3, "Session [%{public}@] does not have [%{public}@]. Cannot proceed with [%{public}s]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)supportsDiagnostics:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[DEDBugSession supportsDiagnostics:]";
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13(&dword_21469E000, a2, v4, "%s %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)hasCollected:(uint8_t *)buf isCollecting:(_BYTE *)a2 identifiers:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "group extensions id is nil, will not track file promise", buf, 2u);
}

- (void)hasCollected:(void *)a1 isCollecting:identifiers:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15(&dword_21469E000, v2, v3, "is collecting %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)hasCollected:(void *)a1 isCollecting:identifiers:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("rootURL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15(&dword_21469E000, v2, v3, "has collected %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)setConfig:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "tried to modify session [%{public}@] that does not have mutable capability", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)cleanupFinishedUploads:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "Cleaning up daemon side (on device with target session or passed through to remote daemon)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)notifyPromiseCancellationIfNeeded:(uint64_t)a1 info:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(&dword_21469E000, v2, v3, "%s %@ %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)instanceType
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Cannot determine instance type in session [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)notifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "[%{public}s] not supported in instance type [%ld]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
