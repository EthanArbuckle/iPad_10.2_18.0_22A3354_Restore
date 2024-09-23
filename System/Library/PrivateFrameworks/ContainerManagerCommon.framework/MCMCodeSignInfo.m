@implementation MCMCodeSignInfo

- (MCMCodeSignInfo)initWithURL:(id)a3 error:(unint64_t *)a4
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMCodeSignInfo;

  if (a4)
    *a4 = 72;
  return 0;
}

- (MCMCodeSignInfo)initWithAuditToken:(id *)a3
{
  __int128 v4;
  int pid;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  unsigned int platform;
  MCMCodeSignInfo *v17;
  MCMCodeSignInfo *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  MCMCodeSignInfo *v22;
  objc_super v24;
  uint64_t __s;
  _BYTE buf[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];

  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v4;
  pid = container_audit_token_get_pid();
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v6;
  v7 = container_audit_token_copy_codesign_identifier();
  __s = v7;
  if (!v7)
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "[pid:%d] could not get codesign identifier", buf, 8u);
    }

    v12 = 0;
    v14 = 0;
    v9 = 0;
    goto LABEL_16;
  }
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
  memset_s(&__s, 8uLL, 0, 8uLL);
  v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v10;
  v11 = container_audit_token_copy_entitlement();
  if (!v11)
  {
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = pid;
      _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "[%@ (pid:%d)] could not get entitlements (assuming none)", buf, 0x12u);
    }

    v12 = 0;
    goto LABEL_15;
  }
  v12 = (void *)v11;
  v13 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v13)
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = pid;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "[%@ (pid:%d)] could not translate entitlements (assuming none)", buf, 0x12u);
    }

LABEL_15:
    v14 = 0;
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  v14 = (void *)v13;
  v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v15;
  platform = container_audit_token_get_platform();
  v24.receiver = 0;
  v24.super_class = (Class)MCMCodeSignInfo;
  v17 = -[MCMCodeSignInfo init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, v9);
    objc_storeStrong((id *)&v18->_entitlements, v14);
    v18->_platform = platform;
  }
LABEL_17:
  v22 = v18;

  return v22;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end
