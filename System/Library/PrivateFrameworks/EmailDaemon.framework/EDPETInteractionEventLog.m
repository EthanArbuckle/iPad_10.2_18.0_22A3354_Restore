@implementation EDPETInteractionEventLog

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDPETInteractionEventLog_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_68 != -1)
    dispatch_once(&log_onceToken_68, block);
  return (OS_os_log *)(id)log_log_68;
}

void __31__EDPETInteractionEventLog_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_68;
  log_log_68 = (uint64_t)v1;

}

- (EDPETInteractionEventLog)initWithDirectory:(id)a3 userProfileProvider:(id)a4 contactStore:(id)a5 vipManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDPETInteractionEventLog *v15;
  EDPETInteractionEventLog *v16;
  EFLazyCache *v17;
  EFLazyCache *contactIDCache;
  EFMutableInt64Set *v19;
  EFMutableInt64Set *currentLogMessageIDs;
  uint64_t v21;
  SGMailIntelligenceStringHasher *stringHasher;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *workQueue;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)EDPETInteractionEventLog;
  v15 = -[EDPETInteractionEventLog init](&v28, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_directory, a3);
    objc_storeStrong((id *)&v16->_profileProvider, a4);
    objc_storeStrong((id *)&v16->_contactStore, a5);
    objc_storeStrong((id *)&v16->_vipManager, a6);
    v17 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E0D1EED8]);
    contactIDCache = v16->_contactIDCache;
    v16->_contactIDCache = v17;

    atomic_store(1u, &v16->_sequenceNumber);
    v19 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E0D1EF08]);
    currentLogMessageIDs = v16->_currentLogMessageIDs;
    v16->_currentLogMessageIDs = v19;

    atomic_store(-[EDPETInteractionEventLog _openCurrentLogfile](v16, "_openCurrentLogfile"), (unsigned __int8 *)&v16->_shouldLog);
    v21 = objc_opt_new();
    stringHasher = v16->_stringHasher;
    v16->_stringHasher = (SGMailIntelligenceStringHasher *)v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_BACKGROUND, 0);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = dispatch_queue_create("com.apple.email.EDPETInteractionEventLog.workQueue", v24);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v25;

  }
  return v16;
}

- (int64_t)userID
{
  int64_t result;

  result = self->_userID;
  if (!result)
  {
    result = -[EDPETInteractionEventLog hashedString:](self, "hashedString:", CFSTR("USER-ID"));
    self->_userID = result;
  }
  return result;
}

- (int64_t)deviceID
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;

  result = self->_deviceID;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_deviceID = -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v6);

    return self->_deviceID;
  }
  return result;
}

- (id)persistentBits
{
  id *p_persistentBits;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  EDInteractionEventLogLegacyPersistentBitsProvider *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  p_persistentBits = (id *)&self->_persistentBits;
  if (!self->_persistentBits)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.suggestions.mail-intelligence"));
    objc_msgSend(v3, "objectForKey:", CFSTR("mailIntelligencePersistentBits"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *p_persistentBits;
    *p_persistentBits = (id)v4;

    if (!*p_persistentBits)
    {
      +[EDPETInteractionEventLog log](EDPETInteractionEventLog, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[EDPETInteractionEventLog persistentBits].cold.3();

      v7 = objc_alloc_init(EDInteractionEventLogLegacyPersistentBitsProvider);
      -[EDInteractionEventLogLegacyPersistentBitsProvider _persistentBits](v7, "_persistentBits");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *p_persistentBits;
      *p_persistentBits = (id)v8;

      if (!*p_persistentBits)
      {
        +[EDPETInteractionEventLog log](EDPETInteractionEventLog, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[EDPETInteractionEventLog persistentBits].cold.2();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random_uniform(8u));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *p_persistentBits;
        *p_persistentBits = (id)v11;

      }
    }
    objc_msgSend(v3, "setObject:forKey:");

  }
  +[EDPETInteractionEventLog log](EDPETInteractionEventLog, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[EDPETInteractionEventLog persistentBits].cold.1((uint64_t)p_persistentBits, v13, v14, v15, v16, v17, v18, v19);

  return *p_persistentBits;
}

- (void)_resetIdentifiers
{
  self->_userID = 0;
  self->_deviceID = 0;
}

- (NSString)meContactIdentifier
{
  NSString *meContactIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  meContactIdentifier = self->_meContactIdentifier;
  if (!meContactIdentifier)
  {
    -[EDPETInteractionEventLog contactStore](self, "contactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = self->_meContactIdentifier;
    self->_meContactIdentifier = v9;

    meContactIdentifier = self->_meContactIdentifier;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](meContactIdentifier, "isEqual:", v11) & 1) != 0)
    v12 = 0;
  else
    v12 = self->_meContactIdentifier;
  v13 = v12;

  return v13;
}

- (void)_rotateLogWithCompressedData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeFile");

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D1E038]))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v6, "setFormatOptions:", 307);
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interaction_log,at=%@,v=%ld.pblog.archived"), v9, 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interaction_log,at=%@,v=%ld.pblog.lzma"), v9, 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPETInteractionEventLog directory](self, "directory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDPETInteractionEventLog directory](self, "directory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPETInteractionEventLog currentLogFile](self, "currentLogFile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "moveItemAtURL:toURL:error:", v17, v13, 0);

    objc_msgSend(v18, "writeToURL:atomically:", v15, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[EDPETInteractionEventLog currentLogFile](self, "currentLogFile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtURL:error:", v9, 0);
  }

  -[EDPETInteractionEventLog _resetIdentifiers](self, "_resetIdentifiers");
  atomic_store(-[EDPETInteractionEventLog _openCurrentLogfile](self, "_openCurrentLogfile"), (unsigned __int8 *)&self->_shouldLog);

}

- (BOOL)_openCurrentLogfile
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  -[EDPETInteractionEventLog directory](self, "directory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETInteractionEventLog _buildLogFileURLInDir:](self, "_buildLogFileURLInDir:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETInteractionEventLog setCurrentLogFile:](self, "setCurrentLogFile:", v4);

  -[EDPETInteractionEventLog currentLogFile](self, "currentLogFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDPETInteractionEventLog _openFileForAppending:](self, "_openFileForAppending:", v5);

  if ((_DWORD)v6 == -1)
    return 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v6, 1);
  -[EDPETInteractionEventLog setLogFileHandle:](self, "setLogFileHandle:", v7);

  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "seekToEndOfFile");

  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "offsetInFile");

  if (v10)
  {
    -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "seekToFileOffset:", 0);

    -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "readDataToEndOfFileAndReturnError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "seekToEndOfFile");

    v18 = -1;
    -[EDPETInteractionEventLog currentLogMessageIDs](self, "currentLogMessageIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPETInteractionEventLog _scanForMessageIDs:logVersion:](self, "_scanForMessageIDs:logVersion:", v13, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIndexes:", v16);

    if (v18 != 15)
      -[EDPETInteractionEventLog _writeHeader](self, "_writeHeader");
  }
  else
  {
    -[EDPETInteractionEventLog _writeHeader](self, "_writeHeader");
    -[EDPETInteractionEventLog currentLogMessageIDs](self, "currentLogMessageIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllIndexes");
  }

  return !-[EDPETInteractionEventLog _isLogQuotaReached](self, "_isLogQuotaReached");
}

- (id)_buildLogFileURLInDir:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPETInteractionEventLog.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory.isFileURL"));

  }
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("interaction_log.pblog"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)_openFileForAppending:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 522, 384);
  if (v4 == -1)
  {
    v5 = *__error();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v10 = v3;
      v11 = 1024;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_ERROR, "Could not open '%@': %d: %@", buf, 0x1Cu);
    }

  }
  return v4;
}

- (id)_framedMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v7;
  __int16 v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v4, "length") + 5);
  v9 = objc_msgSend(v3, "messageFrameType");
  objc_msgSend(v5, "appendBytes:length:", &v9, 1);
  v8 = bswap32(objc_msgSend(v4, "length")) >> 16;
  objc_msgSend(v5, "appendBytes:length:", &v8, 2);
  objc_msgSend(v5, "appendData:", v4);
  v7 = v8 ^ HIBYTE(v8) ^ 0x55;
  objc_msgSend(v5, "appendBytes:length:", &v7, 1);

  return v5;
}

- (id)_scanForMessageIDs:(id)a3 logVersion:(int64_t *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  int64_t *v12;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v7 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__EDPETInteractionEventLog__scanForMessageIDs_logVersion___block_invoke;
  v10[3] = &unk_1E949F9E0;
  v12 = a4;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateFramesInData:block:", v5, v10);

  return v8;
}

void __58__EDPETInteractionEventLog__scanForMessageIDs_logVersion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  EDPBMessageDataIDOnly *v6;
  id v7;

  v5 = a3;
  if (a2 == 5)
  {
    v7 = v5;
    v6 = -[EDPBMessageDataIDOnly initWithData:]([EDPBMessageDataIDOnly alloc], "initWithData:", v5);
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", -[EDPBMessageDataIDOnly messageId](v6, "messageId"));
    goto LABEL_5;
  }
  if (a2 == 4)
  {
    v7 = v5;
    v6 = -[EDPBInteractionEventHeader initWithData:]([EDPBInteractionEventHeader alloc], "initWithData:", v5);
    **(_QWORD **)(a1 + 40) = -[EDPBMessageDataIDOnly version](v6, "version");
LABEL_5:

    v5 = v7;
  }

}

- (void)_writeEvent:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  if ((v5 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[EDPETInteractionEventLog _writeEvent:].cold.2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

    -[EDPETInteractionEventLog _framedMessage:](self, "_framedMessage:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "writeData:", v13);

    -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "synchronizeFile");

    if (-[EDPETInteractionEventLog _isLogQuotaReached](self, "_isLogQuotaReached"))
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[EDPETInteractionEventLog _writeEvent:].cold.1();

      -[EDPETInteractionEventLog _writeQuotaReachedEvent](self, "_writeQuotaReachedEvent");
    }

  }
}

- (void)_writeMessageDataIfNecessary:(id)a3
{
  -[EDPETInteractionEventLog _writeMessageDataIfNecessary:account:](self, "_writeMessageDataIfNecessary:account:", a3, 0);
}

- (void)_writeMessageDataIfNecessary:(id)a3 account:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v17, "messageIDHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ec_messageIDSubstring");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v9);

    if (v17)
    {
      if (v10)
      {
        -[EDPETInteractionEventLog currentLogMessageIDs](self, "currentLogMessageIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsIndex:", v10);

        if ((v12 & 1) == 0)
        {
          -[EDPETInteractionEventLog _messageDataEventForMessage:account:](self, "_messageDataEventForMessage:account:", v17, v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDPETInteractionEventLog currentLogMessageIDs](self, "currentLogMessageIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addIndex:", v10);

          -[EDPETInteractionEventLog _framedMessage:](self, "_framedMessage:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "writeData:", v15);

        }
      }
    }
  }

}

- (void)_writeHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  EDPBInteractionEventHeader *v7;

  v7 = objc_alloc_init(EDPBInteractionEventHeader);
  -[EDPBInteractionEventHeader setVersion:](v7, "setVersion:", 15);
  -[EDPBInteractionEventHeader setUserId:](v7, "setUserId:", -[EDPETInteractionEventLog userID](self, "userID"));
  -[EDPBInteractionEventHeader setDeviceId:](v7, "setDeviceId:", -[EDPETInteractionEventLog deviceID](self, "deviceID"));
  -[EDPETInteractionEventLog _currentLocaleIdentifier](self, "_currentLocaleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventHeader setLocale:](v7, "setLocale:", v3);

  -[EDPBInteractionEventHeader setTimezoneOffset:](v7, "setTimezoneOffset:", -[EDPETInteractionEventLog _timezoneOffset](self, "_timezoneOffset"));
  -[EDPETInteractionEventLog persistentBits](self, "persistentBits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventHeader setUserSegment:](v7, "setUserSegment:", objc_msgSend(v4, "unsignedIntValue"));

  -[EDPBInteractionEventHeader setCategoryRootInstalled:](v7, "setCategoryRootInstalled:", 1);
  -[EDPETInteractionEventLog _framedMessage:](self, "_framedMessage:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeData:", v5);

}

- (void)_writeQuotaReachedEvent
{
  void *v3;
  unsigned int *p_sequenceNumber;
  unsigned int v5;
  void *v6;
  void *v7;
  EDPETQuotaReachedEvent *v8;

  atomic_store(0, (unsigned __int8 *)&self->_shouldLog);
  v8 = objc_alloc_init(EDPETQuotaReachedEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETQuotaReachedEvent setTimestamp:](v8, "setTimestamp:", -[EDPETInteractionEventLog _truncatedUNIXTimestampFromDate:](self, "_truncatedUNIXTimestampFromDate:", v3));

  p_sequenceNumber = &self->_sequenceNumber;
  do
    v5 = __ldaxr(p_sequenceNumber);
  while (__stlxr(v5 + 1, p_sequenceNumber));
  -[EDPETQuotaReachedEvent setSequenceNumber:](v8, "setSequenceNumber:");
  -[EDPETQuotaReachedEvent setTimezoneOffset:](v8, "setTimezoneOffset:", -[EDPETInteractionEventLog _timezoneOffset](self, "_timezoneOffset"));
  -[EDPETInteractionEventLog _framedMessage:](self, "_framedMessage:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeData:", v6);

}

+ (void)enumerateFramesInData:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, void *, unint64_t, unint64_t, char *);
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char v21;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, void *, unint64_t, unint64_t, char *))a4;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v21 = 0;
  if (v9)
  {
    v10 = 0;
    do
    {
      v11 = v10 + 3;
      if (v10 + 3 > v9)
        break;
      v12 = bswap32(*(unsigned __int16 *)(v10 + v8 + 1)) >> 16;
      v13 = v11 + v12;
      if (v11 + v12 > v9)
        break;
      v14 = v8 + v10;
      v15 = *(unsigned __int8 *)(v8 + v10);
      objc_msgSend(v7, "subdataWithRange:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13 + 1;
      if (v13 + 1 > v9)
        goto LABEL_15;
      if ((v12 ^ (v12 >> 8) ^ *(unsigned __int8 *)(v8 + v13)) != 0x55)
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[EDPETInteractionEventLog enumerateFramesInData:block:].cold.1(v13 + 1, v18);

LABEL_15:
        break;
      }
      if (v8 + v10 - v14 != (_DWORD)v12 + 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDPETInteractionEventLog.m"), 384, CFSTR("WAT"));

      }
      v6[2](v6, v15, v16, v14, v8 + v10 - v14, &v21);
      if (v21)
        goto LABEL_15;

    }
    while (v10 < v9);
  }

}

- (unint64_t)_estimateStopCount:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  double v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EEE0]), "initWithLineThroughPoints:", v3);
    objc_msgSend(v5, "evaluateReverse:", 139776.0);
    v4 = vcvtad_u64_f64(v6);

  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)_compressFramedMessagesIntoBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  NSObject *v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  EDPETQuotaReachedEvent *v17;
  EDPETQuotaReachedEvent *v18;
  unsigned int *p_sequenceNumber;
  unsigned int v20;
  void *v21;
  EDPBInteractionEvent *v22;
  EDPBInteractionEvent *v23;
  compression_status v24;
  id v25;
  void *v26;
  NSObject *v27;
  compression_status v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, int, void *, uint64_t, uint64_t, _BYTE *);
  void *v33;
  id v34;
  id v35;
  EDPETInteractionEventLog *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  void *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[4];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[4];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  compression_status v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void *v78;
  compression_stream v79;

  v4 = a3;
  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seekToFileOffset:", 0);

  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readDataToEndOfFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0;
  v76 = &v75;
  v77 = 0x4810000000;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v79.dst_ptr = v8;
  *(_OWORD *)&v79.src_ptr = v8;
  v78 = &unk_1D31C0AC1;
  v79.state = (void *)0xAAAAAAAAAAAAAAAALL;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = -1431655766;
  v74 = compression_stream_init(&v79, COMPRESSION_STREAM_ENCODE, COMPRESSION_LZMA);
  if (!*((_DWORD *)v72 + 6))
  {
    v10 = malloc_type_malloc(0x24C00uLL, 0xAB31A7E9uLL);
    v11 = v76;
    v76[4] = (uint64_t)v10;
    v11[5] = 150528;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    v62[3] = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = -1;
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__22;
    v55 = __Block_byref_object_dispose__22;
    v56 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_class();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __61__EDPETInteractionEventLog__compressFramedMessagesIntoBatch___block_invoke;
    v33 = &unk_1E949FA08;
    v37 = v62;
    v38 = v57;
    v39 = &v67;
    v14 = v4;
    v34 = v14;
    v40 = &v47;
    v41 = &v75;
    v42 = &v71;
    v46 = v10;
    v43 = &v58;
    v15 = v12;
    v35 = v15;
    v36 = self;
    v44 = &v51;
    v45 = &v63;
    objc_msgSend(v13, "enumerateFramesInData:block:", v7, &v30);
    if (*((_DWORD *)v72 + 6))
    {
      objc_msgSend((id)objc_opt_class(), "log", v30, v31, v32, v33, v34);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.4();
    }
    else
    {
      if (*((_DWORD *)v68 + 6) == 1)
      {
        v17 = objc_alloc_init(EDPETQuotaReachedEvent);
        v18 = v17;
        p_sequenceNumber = &self->_sequenceNumber;
        do
          v20 = __ldaxr(p_sequenceNumber);
        while (__stlxr(v20 + 1, p_sequenceNumber));
        -[EDPETQuotaReachedEvent setSequenceNumber:](v17, "setSequenceNumber:", v30, v31, v32, v33, v34);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDPETQuotaReachedEvent setTimestamp:](v18, "setTimestamp:", -[EDPETInteractionEventLog _truncatedUNIXTimestampFromDate:](self, "_truncatedUNIXTimestampFromDate:", v21));

        -[EDPETQuotaReachedEvent setTimezoneOffset:](v18, "setTimezoneOffset:", -[EDPETInteractionEventLog _timezoneOffset](self, "_timezoneOffset"));
        -[EDPETQuotaReachedEvent setDroppedEventsCount:](v18, "setDroppedEventsCount:", v64[3]);
        if (v52[5])
        {
          v22 = [EDPBInteractionEvent alloc];
          v23 = -[EDPBInteractionEvent initWithData:](v22, "initWithData:", v52[5]);
          -[EDPETQuotaReachedEvent setTimestamp:](v18, "setTimestamp:", -[EDPBInteractionEvent timestamp](v23, "timestamp"));
          -[EDPETQuotaReachedEvent setTimezoneOffset:](v18, "setTimezoneOffset:", -[EDPETInteractionEventLog _timezoneOffset](self, "_timezoneOffset"));

        }
        objc_msgSend(v14, "setQuotaEvent:", v18);

      }
      v24 = compression_stream_process((compression_stream *)(v76 + 4), 1);
      *((_DWORD *)v72 + 6) = v24;
      if (v24 == COMPRESSION_STATUS_END)
      {
        v59[3] = v76[4] - (_QWORD)v10;
        if (*((_BYTE *)v48 + 24))
        {
          v25 = objc_alloc(MEMORY[0x1E0C99D50]);
          v26 = (void *)objc_msgSend(v25, "initWithBytesNoCopy:length:freeWhenDone:", v10, v59[3], 1);
          objc_msgSend(v14, "setRawData:", v26);

        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.2();

          objc_msgSend(v14, "setRawData:", 0);
          free(v10);
        }
        v28 = compression_stream_destroy((compression_stream *)(v76 + 4));
        *((_DWORD *)v72 + 6) = v28;
        if (v28)
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.1();

        }
        goto LABEL_20;
      }
      objc_msgSend((id)objc_opt_class(), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.3();
    }

    free(v10);
LABEL_20:

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(v62, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
    goto LABEL_21;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.5();

LABEL_21:
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

}

void __61__EDPETInteractionEventLog__compressFramedMessagesIntoBatch___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  id v12;
  int v13;
  EDPETQuotaReachedEvent *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v12 = a3;
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v13 == 1)
  {
    if (a2 == 1)
    {
      v22 = v12;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), a3);
      v12 = v22;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
  }
  else if (!v13)
  {
    v21 = v12;
    if (a2 == 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
    else if (a2 == 2)
    {
      v14 = -[EDPETQuotaReachedEvent initWithData:]([EDPETQuotaReachedEvent alloc], "initWithData:", v12);
      objc_msgSend(*(id *)(a1 + 32), "setQuotaEvent:", v14);

      goto LABEL_13;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48) = a4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 56) = a5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = compression_stream_process((compression_stream *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 32), 0);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) - *(_QWORD *)(a1 + 128);
      v12 = v21;
      if (v15 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
        goto LABEL_15;
      v16 = *(void **)(a1 + 40);
      v17 = (void *)MEMORY[0x1E0D1EF38];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pairWithFirst:second:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v20);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v15;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "_estimateStopCount:", *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
LABEL_13:
    *a6 = 1;
LABEL_14:
    v12 = v21;
  }
LABEL_15:

}

- (id)batchedEventsForSubmission
{
  EDPETBatchedWrapper *v3;
  NSObject *v4;
  EDPETBatchedWrapper *v5;
  EDPETSubmittedEvent *v6;
  void *v7;
  EDPETBatchedWrapper *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  EDPETInteractionEventLog *v14;
  EDPETBatchedWrapper *v15;

  v3 = objc_alloc_init(EDPETBatchedWrapper);
  -[EDPETInteractionEventLog workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__EDPETInteractionEventLog_batchedEventsForSubmission__block_invoke;
  v13 = &unk_1E949B6D0;
  v14 = self;
  v5 = v3;
  v15 = v5;
  dispatch_sync(v4, &v10);

  if (-[EDPETBatchedWrapper hasRawData](v5, "hasRawData", v10, v11, v12, v13, v14))
  {
    v6 = objc_alloc_init(EDPETSubmittedEvent);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPETSubmittedEvent setTimestamp:](v6, "setTimestamp:", -[EDPETInteractionEventLog _truncatedUNIXTimestampFromDate:](self, "_truncatedUNIXTimestampFromDate:", v7));

    -[EDPETSubmittedEvent setTimezoneOffset:](v6, "setTimezoneOffset:", -[EDPETInteractionEventLog _timezoneOffset](self, "_timezoneOffset"));
    -[EDPETBatchedWrapper setSubmittedEvent:](v5, "setSubmittedEvent:", v6);
    v8 = v5;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __54__EDPETInteractionEventLog_batchedEventsForSubmission__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "logFileHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "offsetInFile");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "logFileHandle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronizeFile");

    objc_msgSend(*(id *)(a1 + 32), "_compressFramedMessagesIntoBatch:", *(_QWORD *)(a1 + 40));
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "rawData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_rotateLogWithCompressedData:");

  }
}

- (BOOL)_isLogQuotaReached
{
  void *v2;
  BOOL v3;

  -[EDPETInteractionEventLog logFileHandle](self, "logFileHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "offsetInFile") >> 13 > 0x20C;

  return v3;
}

- (void)waitForPendingWrites
{
  NSObject *v3;
  _QWORD block[5];

  -[EDPETInteractionEventLog workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EDPETInteractionEventLog_waitForPendingWrites__block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __48__EDPETInteractionEventLog_waitForPendingWrites__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logFileHandle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronizeFile");

}

- (int)_eventNameFromString:(id)a3
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;

  v5 = a3;
  v6 = v5;
  v7 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  if ((v7 & 1) == 0)
  {
    v8 = 0;
    goto LABEL_51;
  }
  objc_msgSend(v5, "uppercaseString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INVALID")) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_FETCHED")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_SENT")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_LIST_DISPLAY_STARTED")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_LIST_DISPLAY_ENDED")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_MOVED")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_COPIED")) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("LINK_CLICKED")) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("APP_LAUNCH")) & 1) != 0)
  {
    v10 = 8;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("APP_BACKGROUND")) & 1) != 0)
  {
    v10 = 9;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("APP_RESUME")) & 1) != 0)
  {
    v10 = 10;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FLAG_CHANGED")) & 1) != 0)
  {
    v10 = 11;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("READ_CHANGED")) & 1) != 0)
  {
    v10 = 12;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_VIEW_START")) & 1) != 0)
  {
    v10 = 13;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MESSAGE_VIEW_END")) & 1) != 0)
  {
    v10 = 14;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("REPLY_DRAFT_STARTED")) & 1) != 0)
  {
    v10 = 15;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FORWARD_DRAFT_STARTED")) & 1) != 0)
  {
    v10 = 16;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("REPLY_SENT")) & 1) != 0)
  {
    v10 = 17;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FORWARD_SENT")) & 1) != 0)
  {
    v10 = 18;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MARKED_MUTE_THREAD")) & 1) != 0)
  {
    v10 = 19;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CATEGORY_MARKED")) & 1) != 0)
  {
    v10 = 20;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("CATEGORY_INFERRED")))
    {
LABEL_4:

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPETInteractionEventLog.m"), 573, CFSTR("Can't map eventName string to enum: %@"), v6);
      v10 = 0;
      goto LABEL_48;
    }
    v10 = 21;
  }

LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(&unk_1E94E5560, "containsObject:", v11);

  if (v12)
    v8 = 0;
  else
    v8 = v10;
LABEL_51:

  return v8;
}

- (unint64_t)_truncatedUNIXTimestampFromDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSince1970");
  return (unint64_t)(round(v3 / 60.0) * 60.0);
}

- (int)_timezoneOffset
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secondsFromGMT");

  return llround((double)v3 / 60.0 / 60.0);
}

- (id)_eventForName:(int)a3 date:(id)a4
{
  uint64_t v4;
  id v7;
  EDPBInteractionEvent *v8;
  EDPBInteractionEvent *v9;
  unsigned int *p_sequenceNumber;
  unsigned int v11;
  void *v12;
  EDPBInteractionEvent *v13;
  EDPBInteractionEventMessageSent *v14;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_alloc_init(EDPBInteractionEvent);
  v9 = v8;
  p_sequenceNumber = &self->_sequenceNumber;
  do
    v11 = __ldaxr(p_sequenceNumber);
  while (__stlxr(v11 + 1, p_sequenceNumber));
  -[EDPBInteractionEvent setSequenceNumber:](v8, "setSequenceNumber:");
  -[EDPBInteractionEvent setTimestamp:](v9, "setTimestamp:", -[EDPETInteractionEventLog _truncatedUNIXTimestampFromDate:](self, "_truncatedUNIXTimestampFromDate:", v7));
  -[EDPBInteractionEvent setEventName:](v9, "setEventName:", v4);
  switch((int)v4)
  {
    case 0:
    case 1:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPETInteractionEventLog.m"), 612, CFSTR("INVALID event, we should not have reached this point"));

      v13 = 0;
      goto LABEL_25;
    case 2:
      v14 = objc_alloc_init(EDPBInteractionEventMessageSent);
      -[EDPBInteractionEvent setMessageSent:](v9, "setMessageSent:", v14);
      goto LABEL_23;
    case 5:
      v14 = objc_alloc_init(EDPBInteractionEventMessageMoved);
      -[EDPBInteractionEvent setMessageMoved:](v9, "setMessageMoved:", v14);
      goto LABEL_23;
    case 6:
      v14 = objc_alloc_init(EDPBInteractionEventMessageCopied);
      -[EDPBInteractionEvent setMessageCopied:](v9, "setMessageCopied:", v14);
      goto LABEL_23;
    case 7:
      v14 = objc_alloc_init(EDPBInteractionEventLinkClicked);
      -[EDPBInteractionEvent setLinkClicked:](v9, "setLinkClicked:", v14);
      goto LABEL_23;
    case 8:
      v14 = objc_alloc_init(EDPBInteractionEventAppLaunch);
      -[EDPBInteractionEvent setAppLaunch:](v9, "setAppLaunch:", v14);
      goto LABEL_23;
    case 9:
      v14 = objc_alloc_init(EDPBInteractionEventAppBackground);
      -[EDPBInteractionEvent setAppBackground:](v9, "setAppBackground:", v14);
      goto LABEL_23;
    case 10:
      v14 = objc_alloc_init(EDPBInteractionEventAppResume);
      -[EDPBInteractionEvent setAppResume:](v9, "setAppResume:", v14);
      goto LABEL_23;
    case 11:
      v14 = objc_alloc_init(EDPBInteractionEventFlagChanged);
      -[EDPBInteractionEvent setFlagChanged:](v9, "setFlagChanged:", v14);
      goto LABEL_23;
    case 12:
      v14 = objc_alloc_init(EDPBInteractionEventReadChanged);
      -[EDPBInteractionEvent setReadChanged:](v9, "setReadChanged:", v14);
      goto LABEL_23;
    case 13:
      v14 = objc_alloc_init(EDPBInteractionEventMessageViewStart);
      -[EDPBInteractionEvent setMessageViewStart:](v9, "setMessageViewStart:", v14);
      goto LABEL_23;
    case 14:
      v14 = objc_alloc_init(EDPBInteractionEventMessageViewEnd);
      -[EDPBInteractionEvent setMessageViewEnd:](v9, "setMessageViewEnd:", v14);
      goto LABEL_23;
    case 15:
      v14 = objc_alloc_init(EDPBInteractionEventReplyDraftStarted);
      -[EDPBInteractionEvent setReplyDraftStarted:](v9, "setReplyDraftStarted:", v14);
      goto LABEL_23;
    case 16:
      v14 = objc_alloc_init(EDPBInteractionEventForwardDraftStarted);
      -[EDPBInteractionEvent setForwardDraftStarted:](v9, "setForwardDraftStarted:", v14);
      goto LABEL_23;
    case 17:
      v14 = objc_alloc_init(EDPBInteractionEventReplySent);
      -[EDPBInteractionEvent setReplySent:](v9, "setReplySent:", v14);
      goto LABEL_23;
    case 18:
      v14 = objc_alloc_init(EDPBInteractionEventForwardSent);
      -[EDPBInteractionEvent setForwardSent:](v9, "setForwardSent:", v14);
      goto LABEL_23;
    case 19:
      v14 = objc_alloc_init(EDPBInteractionEventMarkedMuteThread);
      -[EDPBInteractionEvent setMarkedMuteThread:](v9, "setMarkedMuteThread:", v14);
      goto LABEL_23;
    case 20:
      v14 = objc_alloc_init(EDPBInteractionEventCategoryMarked);
      -[EDPBInteractionEvent setCategoryMarked:](v9, "setCategoryMarked:", v14);
      goto LABEL_23;
    case 21:
      v14 = objc_alloc_init(EDPBInteractionEventCategoryInferred);
      -[EDPBInteractionEvent setCategoryInferred:](v9, "setCategoryInferred:", v14);
LABEL_23:

      break;
    default:
      break;
  }
  v13 = v9;
LABEL_25:

  return v13;
}

- (int64_t)_truncatedSHA256:(id)a3
{
  return -[SGMailIntelligenceStringHasher truncatedSHA256:](self->_stringHasher, "truncatedSHA256:", a3);
}

- (id)_currentLocaleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "length"))
    {
      v6 = &stru_1E94A4508;
      goto LABEL_5;
    }
    v3 = v5;
  }
  v6 = v3;
  v5 = v6;
LABEL_5:

  return v6;
}

- (int64_t)hashedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EDPETInteractionEventLog _truncatedSHA256:](self, "_truncatedSHA256:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)hashedContactIDForAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  EDPETInteractionEventLog *v14;
  id v15;

  v4 = a3;
  -[EDPETInteractionEventLog contactIDCache](self, "contactIDCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__EDPETInteractionEventLog_hashedContactIDForAddress___block_invoke;
  v13 = &unk_1E949FA30;
  v14 = self;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "objectForKey:generator:", v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue", v10, v11, v12, v13, v14);

  return v8;
}

id __54__EDPETInteractionEventLog_hashedContactIDForAddress___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v15[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_3;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "meContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "hashedString:", v13));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    v10 = &unk_1E94E4940;
  }

  return v10;
}

- ($40EAC33F1F794FC3221B301F61335479)hashedSubject:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  $40EAC33F1F794FC3221B301F61335479 *result;
  id v11;
  _QWORD v12[5];
  __int128 v13;
  unint64_t v14;

  v6 = a4;
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  v11 = v6;
  objc_msgSend(v6, "subjectWithoutPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSubjectTokenizer tokenizeString:](EDSubjectTokenizer, "tokenizeString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    retstr->var0 = (int64_t *)malloc_type_calloc(objc_msgSend(v8, "count"), 8uLL, 0x100004000313F17uLL);
    retstr->var1 = objc_msgSend(v8, "count");
    v9 = objc_msgSend(v8, "count");
    retstr->var2 = v9;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__EDPETInteractionEventLog_hashedSubject___block_invoke;
    v12[3] = &unk_1E949FA58;
    v14 = v9;
    v13 = *(_OWORD *)&retstr->var0;
    v12[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  }

  return result;
}

void __42__EDPETInteractionEventLog_hashedSubject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3) = objc_msgSend(*(id *)(a1 + 32), "hashedString:");

}

- (int64_t)hashedAccountID:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "emailAddressStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v5);

  return v6;
}

- (int64_t)hashedMailboxID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)hashedConversationID:(int64_t)a3
{
  int64_t v3;
  void *v5;
  int64_t v7;

  v3 = a3;
  v7 = a3;
  if ((unint64_t)(a3 + 1) >= 2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v7, 8);
    v3 = -[EDPETInteractionEventLog _truncatedSHA256:](self, "_truncatedSHA256:", v5);

  }
  return v3;
}

- (id)hashedMessageHeadersForMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  size_t v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  id v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  EDPBMessageHeaders *v62;
  _QWORD v63[6];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void *v84[3];
  _BYTE v85[128];
  _BYTE v86[128];
  _QWORD v87[5];

  v87[3] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v62 = objc_alloc_init(EDPBMessageHeaders);
  -[EDPETInteractionEventLog profileProvider](self, "profileProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allEmailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_50);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "senders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v8;
  objc_msgSend(v8, "simpleAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v10;
  -[EDPBMessageHeaders setSender:](v62, "setSender:", -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v10));
  objc_msgSend(v54, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBMessageHeaders setSenderDomain:](v62, "setSenderDomain:", -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v12));

  -[EDPETInteractionEventLog vipManager](self, "vipManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBMessageHeaders setSenderIsVip:](v62, "setSenderIsVip:", objc_msgSend(v13, "isVIPAddress:", v10));

  -[EDPBMessageHeaders setSenderContactId:](v62, "setSenderContactId:", -[EDPETInteractionEventLog hashedContactIDForAddress:](self, "hashedContactIDForAddress:", v10));
  memset(v84, 170, sizeof(v84));
  objc_msgSend(v56, "subject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETInteractionEventLog hashedSubject:](self, "hashedSubject:", v14);

  -[EDPBMessageHeaders setSubjectWords:count:](v62, "setSubjectWords:count:", v84[0], v84[1]);
  if (v84[0])
  {
    free(v84[0]);
    v84[0] = 0;
  }
  objc_msgSend(v56, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "prefix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBMessageHeaders setMessageIsForwarded:](v62, "setMessageIsForwarded:", objc_msgSend(v16, "isEqualToString:", CFSTR("Fwd: ")));

  objc_msgSend(v56, "subject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBMessageHeaders setMessageIsReply:](v62, "setMessageIsReply:", objc_msgSend(v17, "hasReplyPrefix"));

  objc_msgSend(v56, "dateReceived");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBMessageHeaders setDateReceived:](v62, "setDateReceived:", -[EDPETInteractionEventLog _truncatedUNIXTimestampFromDate:](self, "_truncatedUNIXTimestampFromDate:", v18));

  objc_msgSend(v56, "listIDHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v56, "listIDHash");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPBMessageHeaders setListId:](v62, "setListId:", -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v21));

  }
  -[EDPBMessageHeaders setUserIsSender:](v62, "setUserIsSender:", objc_msgSend(v60, "containsObject:", v10));
  v22 = (void *)MEMORY[0x1E0D1EF38];
  objc_msgSend(v56, "to");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pairWithFirst:second:", CFSTR("to"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v24;
  v25 = (void *)MEMORY[0x1E0D1EF38];
  objc_msgSend(v56, "cc");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pairWithFirst:second:", CFSTR("cc"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v27;
  v28 = (void *)MEMORY[0x1E0D1EF38];
  objc_msgSend(v56, "bcc");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pairWithFirst:second:", CFSTR("bcc"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v31;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  if (v32)
  {
    v58 = *(_QWORD *)v81;
    do
    {
      v59 = v32;
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v81 != v58)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v34, "first");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "second");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ef_mapSelector:", sel_lowercaseString);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = 0;
        v78 = 0;
        v79 = 0;
        v74 = 0;
        v75 = 0;
        v76 = 0;
        v71 = 0;
        v72 = 0;
        v73 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v65 != v39)
                objc_enumerationMutation(v37);
              objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "emailAddressValue");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "simpleAddress");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "lowercaseString");
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v43);
              PBRepeatedInt64Add();
              objc_msgSend(v41, "domain");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "lowercaseString");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[EDPETInteractionEventLog hashedString:](self, "hashedString:", v45);
              PBRepeatedInt64Add();

              -[EDPETInteractionEventLog vipManager](self, "vipManager");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "isVIPAddress:", v43);
              PBRepeatedBOOLAdd();

              -[EDPETInteractionEventLog hashedContactIDForAddress:](self, "hashedContactIDForAddress:", v43);
              PBRepeatedInt64Add();

            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
          }
          while (v38);
        }

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v37);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v60, "intersectsSet:", v47);
        if (objc_msgSend(v61, "isEqualToString:", CFSTR("to")))
        {
          -[EDPBMessageHeaders setToAddress:count:](v62, "setToAddress:count:", v77, v78);
          -[EDPBMessageHeaders setToDomains:count:](v62, "setToDomains:count:", v74, v75);
          -[EDPBMessageHeaders setToIsVips:count:](v62, "setToIsVips:count:", v71, v72);
          -[EDPBMessageHeaders setToContactIds:count:](v62, "setToContactIds:count:", v68, v69);
          -[EDPBMessageHeaders setUserIsTo:](v62, "setUserIsTo:", v48);
        }
        else if (objc_msgSend(v61, "isEqualToString:", CFSTR("cc")))
        {
          -[EDPBMessageHeaders setCcAddress:count:](v62, "setCcAddress:count:", v77, v78);
          -[EDPBMessageHeaders setCcDomains:count:](v62, "setCcDomains:count:", v74, v75);
          -[EDPBMessageHeaders setCcIsVips:count:](v62, "setCcIsVips:count:", v71, v72);
          -[EDPBMessageHeaders setCcContactIds:count:](v62, "setCcContactIds:count:", v68, v69);
          -[EDPBMessageHeaders setUserIsCc:](v62, "setUserIsCc:", v48);
        }
        else if (objc_msgSend(v61, "isEqualToString:", CFSTR("bcc")))
        {
          -[EDPBMessageHeaders setBccAddress:count:](v62, "setBccAddress:count:", v77, v78);
          -[EDPBMessageHeaders setBccDomains:count:](v62, "setBccDomains:count:", v74, v75);
          -[EDPBMessageHeaders setBccIsVips:count:](v62, "setBccIsVips:count:", v71, v72);
          -[EDPBMessageHeaders setBccContactIds:count:](v62, "setBccContactIds:count:", v68, v69);
          -[EDPBMessageHeaders setUserIsBcc:](v62, "setUserIsBcc:", v48);
        }
        PBRepeatedInt64Clear();
        PBRepeatedInt64Clear();
        PBRepeatedBOOLClear();
        PBRepeatedInt64Clear();

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    }
    while (v32);
  }

  objc_msgSend(v56, "references");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "count");

  v51 = malloc_type_calloc(v50, 8uLL, 0x100004000313F17uLL);
  bzero(v51, 8 * v50);
  objc_msgSend(v56, "references");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __59__EDPETInteractionEventLog_hashedMessageHeadersForMessage___block_invoke_2;
  v63[3] = &unk_1E949FA80;
  v63[4] = self;
  v63[5] = v51;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:", v63);

  -[EDPBMessageHeaders setReferences:count:](v62, "setReferences:count:", v51, v50);
  free(v51);

  return v62;
}

id __59__EDPETInteractionEventLog_hashedMessageHeadersForMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "lowercaseString");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __59__EDPETInteractionEventLog_hashedMessageHeadersForMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  objc_msgSend(v5, "ec_messageIDSubstring");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3) = objc_msgSend(v6, "hashedString:", v7);

}

- (id)_messageDataEventForMessage:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  EDPBMessageData *v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(EDPBMessageData);
  -[EDPBMessageData withHasher:setDataFromMessage:account:](v8, "withHasher:setDataFromMessage:account:", self, v6, v7);

  return v8;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  int v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[EDPETInteractionEventLog _eventNameFromString:](self, "_eventNameFromString:", v10);
  if (v14)
  {
    -[EDPETInteractionEventLog workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke;
    block[3] = &unk_1E949FAA8;
    block[4] = self;
    v20 = v14;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    dispatch_async(v15, block);

  }
}

void __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  size_t v4;
  _DWORD __b[162];
  int v6[2];
  int v7;
  pid_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_eventForName:date:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "withHasher:setMessage:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_writeMessageDataIfNecessary:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_writeEvent:", v2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v6 = 0xE00000001;
    v7 = 1;
    v8 = getpid();
    v4 = 648;
    if (!sysctl(v6, 4u, __b, &v4, 0, 0) && (__b[8] & 0x800) != 0)
      __debugbreak();
  }

}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[EDPETInteractionEventLog _eventNameFromString:](self, "_eventNameFromString:", v10);
  if (v13)
  {
    -[EDPETInteractionEventLog workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke;
    block[3] = &unk_1E949FAD0;
    block[4] = self;
    v19 = v13;
    v16 = v11;
    v18 = a5;
    v17 = v12;
    dispatch_async(v14, block);

  }
}

void __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  size_t v4;
  _DWORD __b[162];
  int v6[2];
  int v7;
  pid_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_eventForName:date:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "withHasher:setConversationID:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_writeEvent:", v2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v6 = 0xE00000001;
    v7 = 1;
    v8 = getpid();
    v4 = 648;
    if (!sysctl(v6, 4u, __b, &v4, 0, 0) && (__b[8] & 0x800) != 0)
      __debugbreak();
  }

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  int v12;

  v6 = a3;
  v7 = a4;
  v8 = -[EDPETInteractionEventLog _eventNameFromString:](self, "_eventNameFromString:", v6);
  if (v8)
  {
    -[EDPETInteractionEventLog workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke;
    block[3] = &unk_1E949FAF8;
    block[4] = self;
    v12 = v8;
    v11 = v7;
    dispatch_async(v9, block);

  }
}

void __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  size_t v7;
  _DWORD __b[162];
  int v9[2];
  int v10;
  pid_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_eventForName:date:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "withHasher:setDataFromMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_writeEvent:", v5);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 48) >= 0x16u)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 48));
        objc_claimAutoreleasedReturnValue();
      }
      __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v9 = 0xE00000001;
    v10 = 1;
    v11 = getpid();
    v7 = 648;
    if (!sysctl(v9, 4u, __b, &v7, 0, 0) && (__b[8] & 0x800) != 0)
      __debugbreak();
  }

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[EDPETInteractionEventLog _eventNameFromString:](self, "_eventNameFromString:", v8);
  if (v11)
  {
    -[EDPETInteractionEventLog workQueue](self, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke;
    v13[3] = &unk_1E949FB20;
    v13[4] = self;
    v16 = v11;
    v14 = v9;
    v15 = v10;
    dispatch_async(v12, v13);

  }
}

void __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  size_t v7;
  _DWORD __b[162];
  int v9[2];
  int v10;
  pid_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_eventForName:date:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "withHasher:setDataFromMessage:account:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_writeMessageDataIfNecessary:account:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_writeEvent:", v5);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 56) >= 0x16u)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
        objc_claimAutoreleasedReturnValue();
      }
      __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v9 = 0xE00000001;
    v10 = 1;
    v11 = getpid();
    v7 = 648;
    if (!sysctl(v9, 4u, __b, &v7, 0, 0) && (__b[8] & 0x800) != 0)
      __debugbreak();
  }

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  int v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[EDPETInteractionEventLog _eventNameFromString:](self, "_eventNameFromString:", v10);
  if (v14)
  {
    -[EDPETInteractionEventLog workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke;
    block[3] = &unk_1E949FAA8;
    block[4] = self;
    v20 = v14;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    dispatch_async(v15, block);

  }
}

void __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  size_t v4;
  _DWORD __b[162];
  int v6[2];
  int v7;
  pid_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_eventForName:date:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "withHasher:setMessage:mailbox:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_writeMessageDataIfNecessary:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_writeEvent:", v2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v6 = 0xE00000001;
    v7 = 1;
    v8 = getpid();
    v4 = 648;
    if (!sysctl(v6, 4u, __b, &v4, 0, 0) && (__b[8] & 0x800) != 0)
      __debugbreak();
  }

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[EDPETInteractionEventLog _eventNameFromString:](self, "_eventNameFromString:", v10);
  if (v13)
  {
    -[EDPETInteractionEventLog workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke;
    block[3] = &unk_1E949FAD0;
    block[4] = self;
    v19 = v13;
    v16 = v11;
    v17 = v12;
    v18 = a6;
    dispatch_async(v14, block);

  }
}

void __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "_eventForName:date:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "withHasher:setMessage:mailboxType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_writeMessageDataIfNecessary:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_writeEvent:", v2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke_cold_1();
    }

  }
}

- (NSURL)currentLogFile
{
  return self->_currentLogFile;
}

- (void)setCurrentLogFile:(id)a3
{
  objc_storeStrong((id *)&self->_currentLogFile, a3);
}

- (EMUserProfileProvider)profileProvider
{
  return self->_profileProvider;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (EFLazyCache)contactIDCache
{
  return self->_contactIDCache;
}

- (void)setMeContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_meContactIdentifier, a3);
}

- (NSData)rotatingSalt
{
  return self->_rotatingSalt;
}

- (void)setRotatingSalt:(id)a3
{
  objc_storeStrong((id *)&self->_rotatingSalt, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unsigned)sequenceNumber
{
  return atomic_load(&self->_sequenceNumber);
}

- (void)setSequenceNumber:(unsigned int)a3
{
  atomic_store(a3, &self->_sequenceNumber);
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSFileHandle)logFileHandle
{
  return self->_logFileHandle;
}

- (void)setLogFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_logFileHandle, a3);
}

- (BOOL)shouldLog
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  return v2 & 1;
}

- (void)setShouldLog:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_shouldLog);
}

- (EFMutableInt64Set)currentLogMessageIDs
{
  return self->_currentLogMessageIDs;
}

- (void)setCurrentLogMessageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_currentLogMessageIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLogMessageIDs, 0);
  objc_storeStrong((id *)&self->_logFileHandle, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_rotatingSalt, 0);
  objc_storeStrong((id *)&self->_meContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIDCache, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_profileProvider, 0);
  objc_storeStrong((id *)&self->_currentLogFile, 0);
  objc_storeStrong((id *)&self->_persistentBits, 0);
  objc_storeStrong((id *)&self->_stringHasher, 0);
}

- (void)persistentBits
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1D2F2C000, v0, v1, "No persistentBits found. Searching for legacy version.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_writeEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Reached quota, writing truncation marker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_writeEvent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)enumerateFramesInData:(uint64_t)a1 block:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "Checksum failure at offset %zu, bailing to read", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_compressFramedMessagesIntoBatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "_destroy failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_compressFramedMessagesIntoBatch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "No interaction events found, returning nil data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_compressFramedMessagesIntoBatch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "_process(.FINALIZE) failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_compressFramedMessagesIntoBatch:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "_process() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_compressFramedMessagesIntoBatch:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Error initializing compression", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "%@ doesn't implement setMessage:data:", v5);

  OUTLINED_FUNCTION_2_0();
}

void __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "%@ doesn't implement setConversationID:data:", v5);

  OUTLINED_FUNCTION_2_0();
}

void __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "%@ doesn't implement setDataFromMessage:", v5);

  OUTLINED_FUNCTION_2_0();
}

void __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "%@ doesn't implement setDataFromMessage:account:", v5);

  OUTLINED_FUNCTION_2_0();
}

void __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "%@ doesn't implement setMessage:mailbox:", v5);

  OUTLINED_FUNCTION_2_0();
}

void __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, v3, v4, "%@ doesn't implement setMessage:mailboxType:", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
