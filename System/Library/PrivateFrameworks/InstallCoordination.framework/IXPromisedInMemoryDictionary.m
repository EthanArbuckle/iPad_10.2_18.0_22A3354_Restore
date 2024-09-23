@implementation IXPromisedInMemoryDictionary

- (IXPromisedInMemoryDictionary)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryDictionary;
  return -[IXOwnedDataPromise initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPromisedInMemoryDictionary;
  -[IXDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedInMemoryDictionary)initWithName:(id)a3 client:(unint64_t)a4 dictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  IXPromisedInMemoryDictionary *v14;
  void *v15;
  IXPromisedInMemoryDictionary *v16;
  NSObject *v17;
  _QWORD v19[4];
  IXPromisedInMemoryDictionary *v20;
  _BYTE *v21;
  _QWORD v22[5];
  objc_super v23;
  id v24;
  _BYTE buf[24];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)IXPromisedInMemoryDictionary;
    self = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v23, sel_initWithName_client_diskSpaceNeeded_, v8, a4, objc_msgSend(v10, "length"));
    if (!self)
      goto LABEL_9;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v26 = 0;
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke;
    v22[3] = &unk_1E4DC41B0;
    v22[4] = buf;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v14 = (IXPromisedInMemoryDictionary *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      _Block_object_dispose(buf, 8);
      goto LABEL_11;
    }
    -[IXDataPromise seed](self, "seed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke_6;
    v19[3] = &unk_1E4DC54C0;
    v21 = buf;
    v16 = self;
    v20 = v16;
    -[IXPromisedInMemoryDictionary _remote_createInMemoryDictionaryPromiseWithSeed:dictionary:completion:](v14, "_remote_createInMemoryDictionaryPromiseWithSeed:dictionary:completion:", v15, v9, v19);

    LODWORD(v15) = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if ((_DWORD)v15)
    {
      v14 = 0;
      self = v16;
    }
    else
    {
LABEL_9:
      self = self;
      v14 = self;
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[IXPromisedInMemoryDictionary initWithName:client:dictionary:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, "%s: Failed to serialize dictionary: %@", buf, 0x16u);
    }

    v14 = 0;
  }
LABEL_11:

  return v14;
}

void __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[IXPromisedInMemoryDictionary initWithName:client:dictionary:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[IXPromisedInMemoryDictionary initWithName:client:dictionary:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up in memory dictionary promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateInitWithSeed:notifyDaemon:", a2, 0);
  }

}

- (void)resetWithCompletion:(id)a3
{
  char *v3;
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = kIXLoggingSubsystem;
  v4 = (void (**)(id, void *))a3;
  IXGetLoggingHandle((uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXPromisedInMemoryDictionary resetWithCompletion:].cold.1(v5);

  _CreateError((uint64_t)"-[IXPromisedInMemoryDictionary resetWithCompletion:]", 90, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Resetting an in-memory dictionary promise doesn't make sense."), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

- (IXPromisedInMemoryDictionary)initWithSeed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryDictionary;
  return -[IXOwnedDataPromise initWithSeed:](&v4, sel_initWithSeed_, a3);
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (void)resetWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[IXPromisedInMemoryDictionary resetWithCompletion:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Resetting an in-memory dictionary promise doesn't make sense. : %@", (uint8_t *)&v1, 0x16u);
}

@end
