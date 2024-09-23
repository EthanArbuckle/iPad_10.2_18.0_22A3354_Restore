@implementation IXPromisedInMemoryData

- (IXPromisedInMemoryData)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryData;
  return -[IXOwnedDataPromise initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPromisedInMemoryData;
  -[IXDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedInMemoryData)initWithName:(id)a3 client:(unint64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  IXPromisedInMemoryData *v10;
  void *v11;
  uint64_t v12;
  IXPromisedInMemoryData *v13;
  void *v14;
  _QWORD v16[4];
  IXPromisedInMemoryData *v17;
  uint64_t *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  objc_super v24;

  v8 = a3;
  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)IXPromisedInMemoryData;
  v10 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v24, sel_initWithName_client_diskSpaceNeeded_, v8, a4, objc_msgSend(v9, "length"));
  if (!v10)
    goto LABEL_5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke;
  v19[3] = &unk_1E4DC41B0;
  v19[4] = &v20;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v13 = (IXPromisedInMemoryData *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _Block_object_dispose(&v20, 8);
    goto LABEL_7;
  }
  -[IXDataPromise seed](v10, "seed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke_5;
  v16[3] = &unk_1E4DC4F90;
  v18 = &v20;
  v17 = v10;
  -[IXPromisedInMemoryData _remote_createInMemoryDataPromiseWithSeed:data:completion:](v13, "_remote_createInMemoryDataPromiseWithSeed:data:completion:", v14, v9, v16);

  LODWORD(v14) = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  if ((_DWORD)v14)
    v13 = 0;
  else
LABEL_5:
    v13 = v10;
LABEL_7:

  return v13;
}

void __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[IXPromisedInMemoryData initWithName:client:data:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[IXPromisedInMemoryData initWithName:client:data:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up in memory data promise: %@", (uint8_t *)&v7, 0x16u);
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
    -[IXPromisedInMemoryData resetWithCompletion:].cold.1(v5);

  _CreateError((uint64_t)"-[IXPromisedInMemoryData resetWithCompletion:]", 81, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Resetting an in-memory data promise doesn't make sense."), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

- (IXPromisedInMemoryData)initWithSeed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryData;
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
  v2 = "-[IXPromisedInMemoryData resetWithCompletion:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Resetting an in-memory data promise doesn't make sense. : %@", (uint8_t *)&v1, 0x16u);
}

@end
