@implementation IXPromisedTransferToPath

- (IXPromisedTransferToPath)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedTransferToPath;
  return -[IXOwnedDataPromise initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPromisedTransferToPath;
  -[IXDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_doInit
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
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
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__IXPromisedTransferToPath__doInit__block_invoke;
  v10[3] = &unk_1E4DC41B0;
  v10[4] = &v11;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IXDataPromise seed](self, "seed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __35__IXPromisedTransferToPath__doInit__block_invoke_3;
    v9[3] = &unk_1E4DC4B68;
    v9[4] = self;
    v9[5] = &v11;
    objc_msgSend(v5, "_remote_createTransferToPathDataPromiseWithSeed:completion:", v6, v9);

    v7 = *((_BYTE *)v12 + 24) == 0;
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __35__IXPromisedTransferToPath__doInit__block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[IXPromisedTransferToPath _doInit]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __35__IXPromisedTransferToPath__doInit__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[IXPromisedTransferToPath _doInit]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up transfer to path promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateInitWithSeed:notifyDaemon:", a2, 0);
  }

}

- (IXPromisedTransferToPath)initWithName:(id)a3 client:(unint64_t)a4 transferPath:(id)a5 diskSpaceNeeded:(unint64_t)a6
{
  id v10;
  IXPromisedTransferToPath *v11;
  IXPromisedTransferToPath *v12;
  void *v13;
  IXPromisedTransferToPath *v14;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IXPromisedTransferToPath;
  v11 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v16, sel_initWithName_client_diskSpaceNeeded_, a3, a4, a6);
  v12 = v11;
  if (v11
    && (-[IXDataPromise seed](v11, "seed"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "setTransferPath:", v10),
        v13,
        !-[IXPromisedTransferToPath _doInit](v12, "_doInit")))
  {
    v14 = 0;
  }
  else
  {
    v14 = v12;
  }

  return v14;
}

- (IXPromisedTransferToPath)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  IXPromisedTransferToPath *v5;
  IXPromisedTransferToPath *v6;
  IXPromisedTransferToPath *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IXPromisedTransferToPath;
  v5 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v9, sel_initWithName_client_diskSpaceNeeded_, a3, a4, a5);
  v6 = v5;
  if (v5 && !-[IXPromisedTransferToPath _doInit](v5, "_doInit"))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (NSURL)transferPath
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setTransferPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSPromisedTransferToPath:setTransferPath:", v7, v4);

  -[IXDataPromise seed](self, "seed");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransferPath:", v4);

}

void __44__IXPromisedTransferToPath_setTransferPath___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[IXPromisedTransferToPath setTransferPath:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy signaled error while setting transfer path: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (BOOL)shouldCopy
{
  void *v2;
  char v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCopy");

  return v3;
}

- (void)setShouldCopy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSPromisedTransferToPath:setShouldCopy:", v7, v3);

  -[IXDataPromise seed](self, "seed");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldCopy:", v3);

}

void __42__IXPromisedTransferToPath_setShouldCopy___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[IXPromisedTransferToPath setShouldCopy:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy signaled error while setting shouldCopy: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (BOOL)tryDeltaCopy
{
  void *v2;
  char v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tryDeltaCopy");

  return v3;
}

- (void)setTryDeltaCopy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSPromisedTransferToPath:setTryDeltaCopy:", v7, v3);

  -[IXDataPromise seed](self, "seed");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTryDeltaCopy:", v3);

}

void __44__IXPromisedTransferToPath_setTryDeltaCopy___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[IXPromisedTransferToPath setTryDeltaCopy:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy signaled error while setting tryDeltaCopy: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)setComplete:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  NSObject *v15;
  IXPromisedTransferToPath *v16;
  char *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  char v22;
  uid_t v23;
  void *v24;
  int v25;
  char v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  IXPromisedTransferToPath *v36;
  char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  void *v41;
  objc_super v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  IXPromisedTransferToPath *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v3 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IXFileManager defaultManager](IXFileManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXOwnedDataPromise stagingBaseDir](self, "stagingBaseDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPromisedTransferToPath transferPath](self, "transferPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[IXPromisedTransferToPath setComplete:].cold.1(v19);

      _CreateError((uint64_t)"-[IXPromisedTransferToPath setComplete:]", 259, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("transferPath was not set, but must be set before complete=YES can be set"), v20, v38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v11, 15, 0);
      v21 = 1;
LABEL_27:

      if (v21)
        return;
      goto LABEL_28;
    }
    v41 = v6;
    objc_msgSend(v8, "lastPathComponent");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0;
    LOBYTE(v10) = -[IXOwnedDataPromise consumeSandboxExtensionWithError:](self, "consumeSandboxExtensionWithError:", &v46);
    v12 = v46;
    if ((v10 & 1) == 0)
    {
      -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v12, 15, 0);
      v21 = 1;
      v14 = v12;
LABEL_26:

      v6 = v41;
      goto LABEL_27;
    }
    v40 = v5;
    if (-[IXPromisedTransferToPath shouldCopy](self, "shouldCopy"))
    {
      v45 = v12;
      v13 = objc_msgSend(v41, "copyItemAtURL:toURL:error:", v9, v11, &v45);
      v14 = v45;

      if ((v13 & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "path");
          v16 = (IXPromisedTransferToPath *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "path");
          v17 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v48 = "-[IXPromisedTransferToPath setComplete:]";
          v49 = 2112;
          v50 = v16;
          v51 = 2112;
          v52 = v17;
          v53 = 2112;
          v54 = v14;
          v18 = "%s: Failed to copy %@ to %@ : %@";
LABEL_23:
          _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0x2Au);

          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
    else
    {
      v44 = v12;
      v22 = objc_msgSend(v41, "moveItemAtURL:toURL:error:", v9, v11, &v44);
      v14 = v44;

      if ((v22 & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "path");
          v16 = (IXPromisedTransferToPath *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "path");
          v17 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v48 = "-[IXPromisedTransferToPath setComplete:]";
          v49 = 2112;
          v50 = v16;
          v51 = 2112;
          v52 = v17;
          v53 = 2112;
          v54 = v14;
          v18 = "%s: Failed to move %@ to %@ : %@";
          goto LABEL_23;
        }
LABEL_24:

        -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v14, 15, 0);
        v21 = 1;
LABEL_25:
        v5 = v40;
        goto LABEL_26;
      }
      v23 = getuid();
      +[IXGlobalConfiguration sharedInstance](IXGlobalConfiguration, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "daemonUID");

      if (v23 != v25)
      {
        v43 = v14;
        v26 = objc_msgSend(v41, "copyACLFrom:toAllChildrenOfPath:error:", v7, v11, &v43);
        v27 = v43;

        if ((v26 & 1) == 0)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "path");
            v36 = (IXPromisedTransferToPath *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "path");
            v37 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v48 = "-[IXPromisedTransferToPath setComplete:]";
            v49 = 2112;
            v50 = v36;
            v51 = 2112;
            v52 = v37;
            v53 = 2112;
            v54 = v27;
            _os_log_impl(&dword_1A4BF6000, v35, OS_LOG_TYPE_DEFAULT, "%s: Failed to inherit ACLs from %@ to %@ : %@", buf, 0x2Au);

          }
          -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v27, 15, 0);
          v21 = 1;
          v14 = v27;
          goto LABEL_25;
        }
        v14 = v27;
      }
    }
    -[IXOwnedDataPromise setStagedPath:](self, "setStagedPath:", v11);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[IXPromisedTransferToPath shouldCopy](self, "shouldCopy");
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = "Move";
      if (v29)
        v31 = "Copy";
      v39 = v31;
      objc_msgSend(v9, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", v40);
      *(_DWORD *)buf = 136316418;
      v48 = "-[IXPromisedTransferToPath setComplete:]";
      v49 = 2112;
      v50 = self;
      v51 = 2080;
      v52 = v39;
      v53 = 2112;
      v54 = v32;
      v55 = 2112;
      v56 = v33;
      v57 = 2048;
      v58 = v34;
      _os_log_impl(&dword_1A4BF6000, v30, OS_LOG_TYPE_DEFAULT, "%s: %@ %s operation from %@ to %@ took %f seconds", buf, 0x3Eu);

    }
    -[IXOwnedDataPromise releaseSandboxExtension](self, "releaseSandboxExtension");

    v21 = 0;
    goto LABEL_25;
  }
LABEL_28:
  v42.receiver = self;
  v42.super_class = (Class)IXPromisedTransferToPath;
  -[IXDataPromise setComplete:](&v42, sel_setComplete_, v3);
}

- (IXPromisedTransferToPath)initWithSeed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedTransferToPath;
  return -[IXOwnedDataPromise initWithSeed:](&v4, sel_initWithSeed_, a3);
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (void)setComplete:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[IXPromisedTransferToPath setComplete:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: transferPath was not set, but must be set before complete=YES can be set : %@", (uint8_t *)&v1, 0x16u);
}

@end
