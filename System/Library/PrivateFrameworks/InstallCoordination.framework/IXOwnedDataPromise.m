@implementation IXOwnedDataPromise

- (void)_internalInit
{
  self->_sandboxExtensionHandle = -1;
}

- (IXOwnedDataPromise)initWithSeed:(id)a3
{
  IXOwnedDataPromise *v3;
  IXOwnedDataPromise *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IXOwnedDataPromise;
  v3 = -[IXDataPromise initWithSeed:](&v6, sel_initWithSeed_, a3);
  v4 = v3;
  if (v3)
    -[IXOwnedDataPromise _internalInit](v3, "_internalInit");
  return v4;
}

- (IXOwnedDataPromise)initWithCoder:(id)a3
{
  IXOwnedDataPromise *v3;
  IXOwnedDataPromise *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IXOwnedDataPromise;
  v3 = -[IXDataPromise initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[IXOwnedDataPromise _internalInit](v3, "_internalInit");
  return v4;
}

- (IXOwnedDataPromise)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  IXOwnedDataPromise *v5;
  IXOwnedDataPromise *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IXOwnedDataPromise;
  v5 = -[IXDataPromise initWithName:client:diskSpaceNeeded:](&v8, sel_initWithName_client_diskSpaceNeeded_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[IXOwnedDataPromise _internalInit](v5, "_internalInit");
  return v6;
}

- (NSURL)stagedPath
{
  NSURL *stagedPath;
  id v4;
  _QWORD v6[5];

  stagedPath = self->_stagedPath;
  if (!stagedPath)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__IXOwnedDataPromise_stagedPath__block_invoke;
    v6[3] = &unk_1E4DC4FE0;
    v6[4] = self;
    v4 = +[IXServerConnection retrySynchronousIPC:](IXServerConnection, "retrySynchronousIPC:", v6);
    stagedPath = self->_stagedPath;
  }
  return stagedPath;
}

id __32__IXOwnedDataPromise_stagedPath__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__IXOwnedDataPromise_stagedPath__block_invoke_5;
  v9[3] = &unk_1E4DC41B0;
  v9[4] = &v10;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __32__IXOwnedDataPromise_stagedPath__block_invoke_6;
  v8[3] = &unk_1E4DC4FB8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = &v10;
  objc_msgSend(v4, "_remote_IXSOwnedDataPromise:getStagedPath:", v5, v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __32__IXOwnedDataPromise_stagedPath__block_invoke_5(uint64_t a1, void *a2)
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
      v7 = "-[IXOwnedDataPromise stagedPath]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get staged path: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __32__IXOwnedDataPromise_stagedPath__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[IXOwnedDataPromise stagedPath]_block_invoke";
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get staged path: %@", (uint8_t *)&v11, 0x16u);
    }

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(a1 + 32) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

- (void)setStagedPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_stagedPath, a3);
  v5 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSOwnedDataPromise:setStagedPath:", v7, v5);

}

void __36__IXOwnedDataPromise_setStagedPath___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[IXOwnedDataPromise setStagedPath:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to set staged item path: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (NSURL)stagingBaseDir
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stagingBaseDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)consumeSandboxExtensionWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  id v21;
  int64_t v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[IXDataPromise seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sandboxExtensionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IXOwnedDataPromise consumeSandboxExtensionWithError:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 128, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Attempting to consume a sandbox extension but don't have a sandbox extension token issued"), v18, v38);
LABEL_11:
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_12;
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  if (self->_sandboxExtensionHandle >= 1)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[IXOwnedDataPromise consumeSandboxExtensionWithError:].cold.3();

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXOwnedDataPromise consumeSandboxExtensionWithError:].cold.2();

    _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 134, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Attempting to consume a sandbox extension while already holding one for %@"), v9, (uint64_t)v6);
    goto LABEL_11;
  }
  v21 = objc_retainAutorelease(v6);
  objc_msgSend(v21, "fileSystemRepresentation");
  v22 = sandbox_extension_consume();
  if ((v22 & 0x8000000000000000) == 0)
  {
    v19 = 0;
    self->_sandboxExtensionHandle = v22;
    v20 = 1;
    goto LABEL_19;
  }
  v23 = *__error();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    -[IXDataPromise seed](self, "seed");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stagingBaseDir");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)*MEMORY[0x1E0CB2FE0];
    v35 = objc_msgSend(objc_retainAutorelease(v21), "fileSystemRepresentation");
    strerror(v23);
    _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 143, v25, v23, 0, 0, CFSTR("sandbox_extension_consume for %s failed: %s."), v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v42 = "-[IXOwnedDataPromise consumeSandboxExtensionWithError:]";
    v43 = 2112;
    v44 = v34;
    v45 = 2112;
    v46 = v37;
    _os_log_error_impl(&dword_1A4BF6000, v24, OS_LOG_TYPE_ERROR, "%s: Could not get access to installcoordinationd's staging directory at \"%@\". : %@", buf, 0x20u);

  }
  else
  {
    v25 = (void *)*MEMORY[0x1E0CB2FE0];
  }

  v26 = objc_msgSend(objc_retainAutorelease(v21), "fileSystemRepresentation");
  strerror(v23);
  _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 143, v25, v23, 0, 0, CFSTR("sandbox_extension_consume for %s failed: %s."), v27, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise seed](self, "seed");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stagingBaseDir");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 143, CFSTR("IXErrorDomain"), 4uLL, v28, 0, CFSTR("Could not get access to installcoordinationd's staging directory at \"%@\"."), v32, (uint64_t)v31);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!a3)
    goto LABEL_18;
LABEL_12:
  v19 = objc_retainAutorelease(v19);
  v20 = 0;
  *a3 = v19;
LABEL_19:

  return v20;
}

- (BOOL)setTargetLastPathComponent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke;
  v22[3] = &unk_1E4DC4430;
  v9 = v6;
  v23 = v9;
  v24 = &v25;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  v17 = 3221225472;
  v18 = __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_17;
  v19 = &unk_1E4DC4430;
  v12 = v9;
  v20 = v12;
  v21 = &v25;
  objc_msgSend(v10, "_remote_IXSOwnedDataPromise:setTargetLastPathComponent:withCompletion:", v11, v12, &v16);

  v13 = (void *)v26[5];
  if (!a4)
  {
    if (v13)
      goto LABEL_6;
LABEL_5:
    -[IXOwnedDataPromise setTargetLastPathComponent:](self, "setTargetLastPathComponent:", v12, v16, v17, v18, v19);
    goto LABEL_6;
  }
  if (!v13)
    goto LABEL_5;
  *a4 = objc_retainAutorelease(v13);
LABEL_6:
  v14 = v26[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v14;
}

void __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_17(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)targetLastPathComponentWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  -[IXOwnedDataPromise targetLastPathComponent](self, "targetLastPathComponent");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v22[5];
  if (!v5)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    v20 = 0;
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke;
    v14[3] = &unk_1E4DC41B0;
    v14[4] = &v15;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_18;
    v13[3] = &unk_1E4DC5008;
    v13[4] = &v15;
    v13[5] = &v21;
    objc_msgSend(v8, "_remote_IXSOwnedDataPromise:getTargetLastPathComponent:", v9, v13);

    v10 = v22[5];
    if (a3)
    {
      if (!v10)
      {
        *a3 = objc_retainAutorelease((id)v16[5]);
LABEL_7:
        _Block_object_dispose(&v15, 8);

        v5 = (void *)v22[5];
        goto LABEL_8;
      }
    }
    else if (!v10)
    {
      goto LABEL_7;
    }
    -[IXOwnedDataPromise setTargetLastPathComponent:](self, "setTargetLastPathComponent:");
    goto LABEL_7;
  }
LABEL_8:
  v11 = v5;
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_18_cold_1();

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

- (void)releaseSandboxExtension
{
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = 136315906;
  v6 = "-[IXOwnedDataPromise releaseSandboxExtension]";
  v7 = 2048;
  v8 = a2;
  v9 = 2080;
  v10 = strerror(a1);
  v11 = 1024;
  v12 = a1;
  _os_log_error_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_ERROR, "%s: Failed to release sandbox extension %lld: %s (%d)", (uint8_t *)&v5, 0x26u);
}

- (void)dealloc
{
  objc_super v3;

  -[IXOwnedDataPromise releaseSandboxExtension](self, "releaseSandboxExtension");
  v3.receiver = self;
  v3.super_class = (Class)IXOwnedDataPromise;
  -[IXDataPromise dealloc](&v3, sel_dealloc);
}

- (void)_clientDelegate_didComplete
{
  objc_super v3;

  -[IXOwnedDataPromise releaseSandboxExtension](self, "releaseSandboxExtension");
  v3.receiver = self;
  v3.super_class = (Class)IXOwnedDataPromise;
  -[IXDataPromise _clientDelegate_didComplete](&v3, sel__clientDelegate_didComplete);
}

- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[IXOwnedDataPromise releaseSandboxExtension](self, "releaseSandboxExtension");
  v7.receiver = self;
  v7.super_class = (Class)IXOwnedDataPromise;
  -[IXDataPromise _clientDelegate_didCancelWithError:client:](&v7, sel__clientDelegate_didCancelWithError_client_, v6, a4);

}

- (NSString)targetLastPathComponent
{
  return self->_targetLastPathComponent;
}

- (void)setTargetLastPathComponent:(id)a3
{
  objc_storeStrong((id *)&self->_targetLastPathComponent, a3);
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLastPathComponent, 0);
  objc_storeStrong((id *)&self->_stagedPath, 0);
}

- (void)consumeSandboxExtensionWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, a1, a3, "%s: Attempting to consume a sandbox extension but don't have a sandbox extension token issued : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)consumeSandboxExtensionWithError:.cold.2()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_1();
  v4 = v0;
  v5 = 0;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v1, v2, "%s: Attempting to consume a sandbox extension while already holding one for %@ : %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_10();
}

- (void)consumeSandboxExtensionWithError:.cold.3()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1A4BF6000, v0, OS_LOG_TYPE_FAULT, "%s: Attempting to consume a sandbox extension while already holding one for %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_12();
}

void __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_cold_1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set target last path component to %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, a2, a3, "%s: Failed to get target last path component : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to get target last path component : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

@end
