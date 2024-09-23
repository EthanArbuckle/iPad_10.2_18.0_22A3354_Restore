@implementation IXDataPromise

- (IXDataPromise)initWithSeed:(id)a3
{
  id v5;
  IXDataPromise *v6;
  IXDataPromise *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXDataPromise;
  v6 = -[IXDataPromise init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_seed, a3);
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerDataPromiseForUpdates:notifyDaemon:", v7, 0);

  }
  return v7;
}

- (void)_updateInitWithSeed:(id)a3 notifyDaemon:(BOOL)a4
{
  _BOOL8 v4;
  IXDataPromiseSeed *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  IXDataPromiseSeed *seed;
  IXDataPromiseSeed *v13;
  id v14;

  v4 = a4;
  v6 = (IXDataPromiseSeed *)a3;
  if (!-[IXDataPromiseSeed creatorIdentifier](v6, "creatorIdentifier")
    || (-[IXDataPromiseSeed uniqueIdentifier](v6, "uniqueIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    v10 = -[IXDataPromiseSeed creatorIdentifier](v6, "creatorIdentifier");
    -[IXDataPromiseSeed uniqueIdentifier](v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Expected client and uniqueID to be initialized but instead got %lu %@"), v10, v11);

  }
  seed = self->_seed;
  self->_seed = v6;
  v13 = v6;

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "registerDataPromiseForUpdates:notifyDaemon:", self, v4);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromiseSeed uniqueIdentifier](self->_seed, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForUpdatesForDataPromiseWithUUID:", v4);

  v5.receiver = self;
  v5.super_class = (Class)IXDataPromise;
  -[IXDataPromise dealloc](&v5, sel_dealloc);
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)creatorIdentifier
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "creatorIdentifier");

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (unint64_t)totalBytesNeededOnDisk
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalBytesNeededOnDisk");

  return v3;
}

- (NSError)error
{
  NSError *error;
  NSError *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  error = self->_error;
  if (error)
  {
    v3 = error;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__7;
    v16 = __Block_byref_object_dispose__7;
    v17 = 0;
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __22__IXDataPromise_error__block_invoke;
    v11[3] = &unk_1E4DC4430;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __22__IXDataPromise_error__block_invoke_6;
    v10[3] = &unk_1E4DC4700;
    v10[4] = self;
    v10[5] = &v12;
    objc_msgSend(v7, "_remote_IXSDataPromise:getErrorInfo:", v8, v10);

    v3 = (NSError *)(id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  return v3;
}

void __22__IXDataPromise_error__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXDataPromise error]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __22__IXDataPromise_error__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a2 && v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
LABEL_8:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    goto LABEL_9;
  }
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[IXDataPromise error]_block_invoke";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error property on %@ : %@", (uint8_t *)&v10, 0x20u);
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (NSError)localError
{
  return self->_error;
}

- (unint64_t)errorSourceIdentifier
{
  unint64_t errorSourceIdentifier;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  errorSourceIdentifier = self->_errorSourceIdentifier;
  if (!errorSourceIdentifier)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__IXDataPromise_errorSourceIdentifier__block_invoke;
    v10[3] = &unk_1E4DC44F8;
    v10[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __38__IXDataPromise_errorSourceIdentifier__block_invoke_8;
    v9[3] = &unk_1E4DC4700;
    v9[4] = self;
    v9[5] = &v11;
    objc_msgSend(v6, "_remote_IXSDataPromise:getErrorInfo:", v7, v9);

    errorSourceIdentifier = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  return errorSourceIdentifier;
}

void __38__IXDataPromise_errorSourceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXDataPromise errorSourceIdentifier]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __38__IXDataPromise_errorSourceIdentifier__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a2 && v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    goto LABEL_9;
  }
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[IXDataPromise errorSourceIdentifier]_block_invoke";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error source on %@ : %@", (uint8_t *)&v10, 0x20u);
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)isComplete
{
  BOOL v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (self->_complete)
  {
    v2 = 1;
  }
  else if (self->_error)
  {
    v2 = 0;
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__IXDataPromise_isComplete__block_invoke;
    v10[3] = &unk_1E4DC44F8;
    v10[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __27__IXDataPromise_isComplete__block_invoke_9;
    v9[3] = &unk_1E4DC4520;
    v9[4] = self;
    v9[5] = &v11;
    objc_msgSend(v6, "_remote_IXSDataPromise:getIsComplete:", v7, v9);

    v2 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v2;
}

void __27__IXDataPromise_isComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXDataPromise isComplete]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __27__IXDataPromise_isComplete__block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXDataPromise isComplete]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get isComplete on %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  }

}

- (void)setComplete:(BOOL)a3
{
  NSObject *v4;
  NSError *error;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  NSError *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_error)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      error = self->_error;
      *(_DWORD *)buf = 136315394;
      v9 = "-[IXDataPromise setComplete:]";
      v10 = 2112;
      v11 = error;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Called after error %@ occurred; ignoring.",
        buf,
        0x16u);
    }

  }
  else if (a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__IXDataPromise_setComplete___block_invoke;
    v7[3] = &unk_1E4DC4FE0;
    v7[4] = self;
    v6 = +[IXServerConnection retrySynchronousIPC:](IXServerConnection, "retrySynchronousIPC:", v7);
  }
}

id __29__IXDataPromise_setComplete___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__IXDataPromise_setComplete___block_invoke_2;
  v9[3] = &unk_1E4DC4430;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = &v10;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __29__IXDataPromise_setComplete___block_invoke_11;
  v8[3] = &unk_1E4DC4430;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = &v10;
  objc_msgSend(v4, "_remote_IXSDataPromise:setIsComplete:completion:", v5, 1, v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __29__IXDataPromise_setComplete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXDataPromise setComplete:]_block_invoke_2";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __29__IXDataPromise_setComplete___block_invoke_11(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXDataPromise setComplete:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set isComplete on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }

}

- (BOOL)localIsComplete
{
  return self->_complete;
}

- (double)percentComplete
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__IXDataPromise_percentComplete__block_invoke;
  v10[3] = &unk_1E4DC44F8;
  v10[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __32__IXDataPromise_percentComplete__block_invoke_13;
  v9[3] = &unk_1E4DC51E8;
  v9[4] = self;
  v9[5] = &v11;
  objc_msgSend(v5, "_remote_IXSDataPromise:getPercentComplete:", v6, v9);

  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __32__IXDataPromise_percentComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXDataPromise percentComplete]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __32__IXDataPromise_percentComplete__block_invoke_13(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXDataPromise percentComplete]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get percentComplete on %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }

}

- (void)setPercentComplete:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__IXDataPromise_setPercentComplete___block_invoke;
  v8[3] = &unk_1E4DC5210;
  *(double *)&v8[5] = a3;
  v8[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSDataPromise:setPercentComplete:", v7, a3);

}

void __36__IXDataPromise_setPercentComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136315906;
    v8 = "-[IXDataPromise setPercentComplete:]_block_invoke";
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set percentComplete to %f on %@ : %@", (uint8_t *)&v7, 0x2Au);
  }

}

- (IXDataPromise)initWithCoder:(id)a3
{
  id v4;
  IXDataPromise *v5;
  uint64_t v6;
  IXDataPromiseSeed *seed;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXDataPromise;
  v5 = -[IXDataPromise init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seed"));
    v6 = objc_claimAutoreleasedReturnValue();
    seed = v5->_seed;
    v5->_seed = (IXDataPromiseSeed *)v6;

    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerDataPromiseForUpdates:notifyDaemon:", v5, 1);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IXDataPromise seed](self, "seed");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("seed"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXDataPromise)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  id v8;
  IXDataPromise *v9;
  IXDataPromise *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IXDataPromise;
  v9 = -[IXDataPromise init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    -[IXDataPromise seedClass](v9, "seedClass");
    v11 = (void *)objc_opt_new();
    -[IXDataPromise setSeed:](v10, "setSeed:", v11);

    -[IXDataPromise seed](v10, "seed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setName:", v8);

    -[IXDataPromise seed](v10, "seed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCreatorIdentifier:", a4);

    -[IXDataPromise seed](v10, "seed");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTotalBytesNeededOnDisk:", a5);

  }
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise seed](self, "seed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IXStringForClientID(-[IXDataPromise creatorIdentifier](self, "creatorIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> name:\"%@\" uuid:%@ creator:\"%@\">"), v5, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)cancelForReason:(id)a3 completion:(id)a4
{
  -[IXDataPromise cancelForReason:client:completion:](self, "cancelForReason:client:completion:", a3, 14, a4);
}

- (void)cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  IXDataPromise *v24;
  void (**v25)(id, void *);

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (!v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[IXDataPromise cancelForReason:client:completion:].cold.1();

    v16 = CFSTR("-[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid.");
    v17 = 301;
    goto LABEL_10;
  }
  if (!a4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[IXDataPromise cancelForReason:client:completion:].cold.2();

    v16 = CFSTR("-[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid.");
    v17 = 307;
LABEL_10:
    _CreateError((uint64_t)"-[IXDataPromise cancelForReason:client:completion:]", v17, CFSTR("IXErrorDomain"), 4uLL, 0, 0, v16, v15, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v19);

    goto LABEL_11;
  }
  -[IXDataPromise setError:](self, "setError:", v8);
  -[IXDataPromise setErrorSourceIdentifier:](self, "setErrorSourceIdentifier:", a4);
  self->_complete = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __51__IXDataPromise_cancelForReason_client_completion___block_invoke;
  v23 = &unk_1E4DC50E8;
  v24 = self;
  v11 = v9;
  v25 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier", v20, v21, v22, v23, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_remote_IXSDataPromise:cancelForReason:client:completion:", v13, v8, a4, v11);

LABEL_11:
}

void __51__IXDataPromise_cancelForReason_client_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXDataPromise cancelForReason:client:completion:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)cancelForReason:(id)a3 error:(id *)a4
{
  return -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", a3, 14, a4);
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  BOOL v20;
  uint64_t v22[6];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v8 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  if (!v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IXDataPromise cancelForReason:client:error:].cold.1();

    _CreateError((uint64_t)"-[IXDataPromise cancelForReason:client:error:]", 333, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid."),
      v14,
      v22[0]);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!a4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[IXDataPromise cancelForReason:client:error:].cold.2();

    _CreateError((uint64_t)"-[IXDataPromise cancelForReason:client:error:]", 338, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid."), v17, v22[0]);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v18 = (void *)v25[5];
    v25[5] = v15;

    goto LABEL_11;
  }
  -[IXDataPromise setError:](self, "setError:", v8);
  -[IXDataPromise setErrorSourceIdentifier:](self, "setErrorSourceIdentifier:", a4);
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__IXDataPromise_cancelForReason_client_error___block_invoke;
  v23[3] = &unk_1E4DC4430;
  v23[4] = self;
  v23[5] = &v24;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__46__IXDataPromise_cancelForReason_client_error___block_invoke_24;
  v22[3] = (uint64_t)&unk_1E4DC4048;
  v22[4] = (uint64_t)&v24;
  v22[5] = (uint64_t)&v30;
  objc_msgSend(v11, "_remote_IXSDataPromise:cancelForReason:client:completion:", v12, v8, a4, v22);

LABEL_11:
  v19 = *((unsigned __int8 *)v31 + 24);
  if (a5 && !*((_BYTE *)v31 + 24))
  {
    *a5 = objc_retainAutorelease((id)v25[5]);
    v19 = *((unsigned __int8 *)v31 + 24);
  }
  v20 = v19 != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v20;
}

void __46__IXDataPromise_cancelForReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXDataPromise cancelForReason:client:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __46__IXDataPromise_cancelForReason_client_error___block_invoke_24(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)resetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__IXDataPromise_resetWithCompletion___block_invoke;
  v13[3] = &unk_1E4DC40C0;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __37__IXDataPromise_resetWithCompletion___block_invoke_25;
  v11[3] = &unk_1E4DC50E8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "_remote_IXSDataPromise:resetWithCompletion:", v9, v11);

}

void __37__IXDataPromise_resetWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXDataPromise resetWithCompletion:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __37__IXDataPromise_resetWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__IXDataPromise_resetWithCompletion___block_invoke_2;
    v5[3] = &unk_1E4DC42A0;
    v4 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "cancelForReason:client:completion:", v6, 15, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __37__IXDataPromise_resetWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXDataPromise resetWithCompletion:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)resetWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __32__IXDataPromise_resetWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __32__IXDataPromise_resetWithError___block_invoke_26;
  v12[3] = &unk_1E4DC4570;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  objc_msgSend(v7, "_remote_IXSDataPromise:resetWithCompletion:", v8, v12);

  v9 = *((unsigned __int8 *)v21 + 24);
  if (a3 && !*((_BYTE *)v21 + 24))
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v9 = *((unsigned __int8 *)v21 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __32__IXDataPromise_resetWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXDataPromise resetWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __32__IXDataPromise_resetWithError___block_invoke_26(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "cancelForReason:client:completion:", v4, 15, &__block_literal_global_7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__IXDataPromise_preflightWithCompletion___block_invoke;
  v9[3] = &unk_1E4DC40C0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_remote_IXSDataPromise:preflightWithCompletion:", v8, v6);

}

void __41__IXDataPromise_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXDataPromise preflightWithCompletion:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)preflightWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__IXDataPromise_preflightWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __36__IXDataPromise_preflightWithError___block_invoke_27;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v14;
  objc_msgSend(v7, "_remote_IXSDataPromise:preflightWithCompletion:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __36__IXDataPromise_preflightWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXDataPromise preflightWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __36__IXDataPromise_preflightWithError___block_invoke_27(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXDataPromise preflightWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Preflight failed with error: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (void)_clientDelegate_didComplete
{
  if (!self->_error)
    self->_complete = 1;
}

- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4
{
  self->_complete = 0;
  -[IXDataPromise setError:](self, "setError:", a3);
  -[IXDataPromise setErrorSourceIdentifier:](self, "setErrorSourceIdentifier:", a4);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  self->_errorSourceIdentifier = a3;
}

- (IXDataPromiseSeed)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
  objc_storeStrong((id *)&self->_seed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)outstandingPromisesForCreator:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_126);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__IXDataPromise_IXTesting__outstandingPromisesForCreator___block_invoke_127;
  v8[3] = &unk_1E4DC5258;
  v8[4] = &v9;
  objc_msgSend(v5, "_remote_fetchRegisteredDataPromiseInfoForCreator:completion:", a3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__IXDataPromise_IXTesting__outstandingPromisesForCreator___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "+[IXDataPromise(IXTesting) outstandingPromisesForCreator:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to get registered data promise info: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__IXDataPromise_IXTesting__outstandingPromisesForCreator___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "+[IXDataPromise(IXTesting) outstandingPromisesForCreator:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get reigstered data promise info: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

+ (BOOL)promiseExists:(BOOL *)a3 withUUID:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  int v12;
  BOOL v13;
  _QWORD v15[7];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke;
  v16[3] = &unk_1E4DC41B0;
  v16[4] = &v17;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke_129;
  v15[3] = &unk_1E4DC5280;
  v15[4] = &v17;
  v15[5] = &v23;
  v15[6] = &v27;
  objc_msgSend(v10, "_remote_checkIfDataPromiseExistsForUUID:completion:", v7, v15);

  v11 = v28;
  v12 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v18[5]);
    v11 = v28;
    v12 = *((unsigned __int8 *)v28 + 24);
  }
  if (v12)
  {
    *a3 = *((_BYTE *)v24 + 24);
    v13 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXDataPromise(IXTesting) promiseExists:withUUID:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to get promise info: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke_129(_QWORD *a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (void)cancelForReason:client:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_12();
}

- (void)cancelForReason:client:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)cancelForReason:client:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_12();
}

- (void)cancelForReason:client:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

@end
