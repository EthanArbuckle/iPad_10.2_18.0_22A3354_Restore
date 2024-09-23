@implementation IXPromisedOutOfBandTransfer

- (IXPromisedOutOfBandTransfer)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  id v8;
  IXPromisedOutOfBandTransfer *v9;
  void *v10;
  uint64_t v11;
  IXPromisedOutOfBandTransfer *v12;
  void *v13;
  _QWORD v15[4];
  IXPromisedOutOfBandTransfer *v16;
  uint64_t *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  objc_super v23;

  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IXPromisedOutOfBandTransfer;
  v9 = -[IXDataPromise initWithName:client:diskSpaceNeeded:](&v23, sel_initWithName_client_diskSpaceNeeded_, v8, a4, a5);
  if (!v9)
    goto LABEL_5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke;
  v18[3] = &unk_1E4DC41B0;
  v18[4] = &v19;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (IXPromisedOutOfBandTransfer *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _Block_object_dispose(&v19, 8);
    goto LABEL_7;
  }
  -[IXDataPromise seed](v9, "seed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke_1;
  v15[3] = &unk_1E4DC5170;
  v17 = &v19;
  v16 = v9;
  -[IXPromisedOutOfBandTransfer _remote_createOutOfBandTransferPromiseWithSeed:completion:](v12, "_remote_createOutOfBandTransferPromiseWithSeed:completion:", v13, v15);

  LODWORD(v13) = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  if ((_DWORD)v13)
    v12 = 0;
  else
LABEL_5:
    v12 = v9;
LABEL_7:

  return v12;
}

void __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[IXPromisedOutOfBandTransfer initWithName:client:diskSpaceNeeded:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke_1(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[IXPromisedOutOfBandTransfer initWithName:client:diskSpaceNeeded:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up out of band transfer promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateInitWithSeed:notifyDaemon:", a2, 0);
  }

}

- (IXPromisedOutOfBandTransfer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedOutOfBandTransfer;
  return -[IXOpaqueDataPromise initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPromisedOutOfBandTransfer;
  -[IXOpaqueDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedOutOfBandTransfer)initWithSeed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedOutOfBandTransfer;
  return -[IXDataPromise initWithSeed:](&v4, sel_initWithSeed_, a3);
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

@end
