@implementation _EXRunningExtension

- (int)startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t signpost;
  uint8_t v26[8];
  id v27;
  uint8_t buf[16];

  v4 = *(_QWORD *)&a4;
  _EXSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  if (v8)
  {
    v9 = v7;
    v10 = v9;
    if (v8 != -1 && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "extensionkit-lifecycle", "launch", buf, 2u);
    }

  }
  self->_signpost = v8;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("BSServiceDomains"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, strlen(v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, &v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v27;
    _EXDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[_EXRunningExtension startWithArguments:count:].cold.1();

  }
  v19 = -[_EXRunningExtension _startWithArguments:count:](self, "_startWithArguments:count:", a3, v4);
  if (!v19)
    -[_EXRunningExtension resume](self, "resume");
  _EXSignpostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (self->_signpost && os_signpost_enabled(v20))
  {
    v22 = v21;
    v23 = v22;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v23, OS_SIGNPOST_INTERVAL_END, signpost, "extensionkit-lifecycle", "exit", v26, 2u);
    }

  }
  return v19;
}

- (_EXExtension)extension
{
  return self->_extension;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_runningExtension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void)didFinishLaunching
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, v0, v1, "Did finish launching extension: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)willFinishLaunching
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, v0, v1, "Will finish launching extension: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)checkIn
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "Pinging launchd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)entryPointFunction
{
  if (entryPointFunction_onceToken != -1)
    dispatch_once(&entryPointFunction_onceToken, &__block_literal_global_6);
  return (void *)entryPointFunction_mainFunction;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "extractNSXPCConnectionWithConfigurator:", &__block_literal_global_34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_EXRunningExtension shouldAcceptXPCConnection:](self, "shouldAcceptXPCConnection:", v6))
    objc_msgSend(v7, "invalidate");

}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t signpost;
  void *v11;
  char v12;
  uint8_t v14[16];

  v4 = a3;
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_EXRunningExtension shouldAcceptXPCConnection:].cold.1();

  _EXSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_signpost && os_signpost_enabled(v6))
  {
    v8 = v7;
    v9 = v8;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v9, OS_SIGNPOST_EVENT, signpost, "extensionkit-lifecycle", "-shouldAcceptXPCConnection:", v14, 2u);
    }

  }
  -[_EXRunningExtension extension](self, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldAcceptConnection:", v4);

  return v12;
}

- (int)_startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  _EXExtensionIdentity *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, const char **);
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t signpost;
  int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  _EXExtension *extension;
  void *v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  objc_class *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  objc_class *v38;
  void *v39;
  _EXExtension *v40;
  _EXExtension *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  objc_class *v47;
  void *v48;
  _EXExtension *v49;
  uint64_t v50;
  objc_class *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  void *v57;
  BOOL v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v68;
  void *v69;
  NSObject *v70;
  _EXRunningExtension *v71;
  SEL v72;
  _EXExtensionIdentity *v73;
  uint8_t buf[16];
  __int128 v75;
  uint64_t v76;

  v4 = *(_QWORD *)&a4;
  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v75 = 0u;
  }
  v9 = v75;
  *(_OWORD *)self->_hostAuditToken.val = *(_OWORD *)buf;
  *(_OWORD *)&self->_hostAuditToken.val[4] = v9;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _EXDefaultLog();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      -[_EXRunningExtension _startWithArguments:count:].cold.1();
    goto LABEL_80;
  }
  v11 = -[_EXExtensionIdentity initWithApplicationExtensionRecord:]([_EXExtensionIdentity alloc], "initWithApplicationExtensionRecord:", v10);
  objc_storeStrong((id *)&self->_extensionIdentity, v11);
  v12 = objc_msgSend((id)objc_opt_class(), "entryPointFunction");
  if (!v12)
  {
    _EXDefaultLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[_EXRunningExtension _startWithArguments:count:].cold.7(self, v30);
    goto LABEL_28;
  }
  v13 = (uint64_t (*)(uint64_t, const char **))v12;
  _EXSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (self->_signpost && os_signpost_enabled(v14))
  {
    v73 = v11;
    v16 = v8;
    v17 = v15;
    v18 = v17;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v18, OS_SIGNPOST_EVENT, signpost, "extensionkit-lifecycle", "PRE: swift entry point", buf, 2u);
    }

    v8 = v16;
    v11 = v73;
  }

  v20 = v13(v4, a3);
  _EXSignpostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (self->_signpost && os_signpost_enabled(v21))
  {
    v23 = v22;
    v24 = v23;
    v25 = self->_signpost;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v24, OS_SIGNPOST_EVENT, v25, "extensionkit-lifecycle", "POST: swift entry point", buf, 2u);
    }

  }
  extension = self->_extension;
  if (!extension)
  {
    -[_EXRunningExtension extensionIdentity](self, "extensionIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "supportsNSExtensionPlistKeys");

    if ((v28 & 1) == 0)
    {
      _EXDefaultLog();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[_EXRunningExtension _startWithArguments:count:].cold.9();
      goto LABEL_80;
    }
    extension = self->_extension;
    if (!extension)
    {
      _EXDefaultLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[_EXRunningExtension extension](self, "extension");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "bundleIdentifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v69;

      }
LABEL_28:

      goto LABEL_29;
    }
  }
  -[_EXExtension setInternalRep:](extension, "setInternalRep:", v11);
  -[_EXExtension setHasSwiftEntryPoint:](self->_extension, "setHasSwiftEntryPoint:", 1);
  _EXDefaultLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[_EXRunningExtension _startWithArguments:count:].cold.8(self, v29);

  if (v20 == 1)
  {
LABEL_29:
    _EXDefaultLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[_EXRunningExtension _startWithArguments:count:].cold.6();

    v32 = -[_EXExtensionIdentity extensionClass](self->_extensionIdentity, "extensionClass");
    if ((-[objc_class isSubclassOfClass:](v32, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      _EXSignpostLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (self->_signpost && os_signpost_enabled(v33))
      {
        v35 = v34;
        v36 = v35;
        v37 = self->_signpost;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v39;
          _os_signpost_emit_with_name_impl(&dword_190C25000, v36, OS_SIGNPOST_EVENT, v37, "extensionkit-lifecycle", "PRE: -[%{public}@ init]", buf, 0xCu);

        }
      }

      v40 = (_EXExtension *)objc_alloc_init(v32);
      v41 = self->_extension;
      self->_extension = v40;

      _EXSignpostLog();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (self->_signpost && os_signpost_enabled(v42))
      {
        v44 = v43;
        v45 = v44;
        v46 = self->_signpost;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v48;
          _os_signpost_emit_with_name_impl(&dword_190C25000, v45, OS_SIGNPOST_EVENT, v46, "extensionkit-lifecycle", "POST: -[%{public}@ init]", buf, 0xCu);

        }
      }

      -[_EXExtension setInternalRep:](self->_extension, "setInternalRep:", v11);
      v49 = self->_extension;
      if (v49)
      {
        v50 = -[_EXExtension delegateClass](v49, "delegateClass");
        if (v50)
        {
          v51 = (objc_class *)v50;
          _EXSignpostLog();
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if (self->_signpost && os_signpost_enabled(v52))
          {
            v54 = v53;
            v55 = v54;
            v56 = self->_signpost;
            if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
            {
              NSStringFromClass(v51);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v57;
              _os_signpost_emit_with_name_impl(&dword_190C25000, v55, OS_SIGNPOST_EVENT, v56, "extensionkit-lifecycle", "PRE: -[%{public}@ init]", buf, 0xCu);

            }
          }

          v58 = -[_EXExtension loadDelegate](self->_extension, "loadDelegate");
          _EXSignpostLog();
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = v59;
          if (self->_signpost && os_signpost_enabled(v59))
          {
            v61 = v60;
            v62 = v61;
            v63 = self->_signpost;
            if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
            {
              NSStringFromClass(v51);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v64;
              _os_signpost_emit_with_name_impl(&dword_190C25000, v62, OS_SIGNPOST_EVENT, v63, "extensionkit-lifecycle", "POST: -[%{public}@ init]", buf, 0xCu);

            }
          }

          if (v58)
            goto LABEL_66;
        }
        else
        {
          _EXDefaultLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            -[_EXRunningExtension _startWithArguments:count:].cold.4();

        }
        _EXDefaultLog();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          -[_EXRunningExtension _startWithArguments:count:].cold.3();

LABEL_66:
        v20 = 0;
        goto LABEL_67;
      }
      _EXDefaultLog();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[_EXRunningExtension _startWithArguments:count:].cold.2();
    }
    else
    {
      _EXDefaultLog();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[_EXRunningExtension _startWithArguments:count:].cold.5(v32, v70);
    }
LABEL_80:

    v71 = (_EXRunningExtension *)abort_with_reason();
    -[_EXRunningExtension resume](v71, v72);
  }
LABEL_67:

  return v20;
}

- (void)resume
{
  void *v3;
  uint64_t v4;
  _QWORD block[5];
  _QWORD v6[4];
  id v7;
  id location;

  -[_EXRunningExtension checkIn](self, "checkIn");
  -[_EXRunningExtension willFinishLaunching](self, "willFinishLaunching");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0D03468];
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29___EXRunningExtension_resume__block_invoke;
  v6[3] = &unk_1E2CFC410;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "listenerWithConfigurator:", v6);
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "activate");
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __29___EXRunningExtension_resume__block_invoke_2;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0D03490], "activateXPCService");
  __break(1u);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return -[_EXRunningExtension shouldAcceptXPCConnection:](self, "shouldAcceptXPCConnection:", a4);
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_getProperty(self, a2, 16, 1);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_hostAuditToken, 32, 1, 0);
  return result;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)_startWithArguments:count:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_190C25000, v0, v1, "%s - %s:%d: Invalid bundle record for current process: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_startWithArguments:count:.cold.2()
{
  uint8_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8();
  v7 = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10(&dword_190C25000, v1, v2, "%s - %s:%d: Unexpected nil EXExtension instance", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

- (void)_startWithArguments:count:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "No extension delegate specified, that's ok.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_startWithArguments:count:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "No value for 'EXAppExtensionDelegateClass' found, extension delegate is not specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_startWithArguments:(objc_class *)a1 count:(NSObject *)a2 .cold.5(objc_class *a1, NSObject *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136316162;
  v8 = "[extensionClass isSubclassOfClass:_EXExtension.class]";
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  v9 = 211;
  v10 = 2114;
  v11 = v3;
  v12 = 2114;
  v13 = v6;
  _os_log_error_impl(&dword_190C25000, a2, OS_LOG_TYPE_ERROR, "%s - %s:%d: Extension class '%{public}@' must be a subclass of '%{public}@'", (uint8_t *)&v7, 0x30u);

}

- (void)_startWithArguments:count:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "Falling back to delegate class lookup.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_startWithArguments:(void *)a1 count:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, a2, v5, "SwiftUI: Unable to find entry point function for extension with bundle ID '%{public}@'.", v6);

  OUTLINED_FUNCTION_9();
}

- (void)_startWithArguments:(void *)a1 count:(NSObject *)a2 .cold.8(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, a2, v5, "SwiftUI: Initialized extension with bundle ID '%{public}@'.", v6);

  OUTLINED_FUNCTION_9();
}

- (void)_startWithArguments:count:.cold.9()
{
  uint8_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8();
  v7 = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10(&dword_190C25000, v1, v2, "%s - %s:%d: Unexpected nil EXExtension instance", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

- (void)startWithArguments:count:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, v0, v1, "Services: %@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)shouldAcceptXPCConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, v0, v1, "Incoming service level XPC connection: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

@end
