@implementation FPDRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_userProcessName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

+ (id)requestForPID:(int)a3 fromPOSIX:(BOOL)a4 kernelFileInfo:(id)a5
{
  __int128 v5;
  _OWORD v7[2];

  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  v7[0] = v5;
  v7[1] = v5;
  objc_msgSend(a1, "requestForPID:auditToken:fromPOSIX:kernelFileInfo:", *(_QWORD *)&a3, v7, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)requestForPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5 kernelFileInfo:(id)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  _OWORD v15[2];

  v6 = a5;
  v8 = *(_QWORD *)&a3;
  if (a6)
  {
    v9 = a6;
    v10 = objc_msgSend(v9, "offset");
    v11 = objc_msgSend(v9, "size");

  }
  else
  {
    v10 = -1;
    v11 = -1;
  }
  v12 = objc_alloc((Class)objc_opt_class());
  v13 = *(_OWORD *)&a4->var0[4];
  v15[0] = *(_OWORD *)a4->var0;
  v15[1] = v13;
  return (id)objc_msgSend(v12, "initWithPID:auditToken:fromPOSIX:withExtent:", v8, v15, v6, v10, v11);
}

- (FPDRequest)initWithPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5 withExtent:(id)a6
{
  void *v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;
  BOOL v12;
  __int128 *v13;
  __int128 *v14;
  uint64_t v15;
  uint64_t v16;
  FPDRequest *v17;
  FPDRequest *v18;
  uint64_t v19;
  NSDate *date;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  NSString *processName;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  NSString *executablePath;
  uint64_t v29;
  NSString *userProcessName;
  __int128 v31;
  objc_super v33;
  _BYTE v34[4096];
  _OWORD buffer[2];
  uint64_t v36;

  v6 = (void *)MEMORY[0x1E0C80A78](self, a2, *(_QWORD *)&a3, a4, a5, a6.var0, a6.var1);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v36 = *MEMORY[0x1E0C80C00];
  v33.receiver = v6;
  v33.super_class = (Class)FPDRequest;
  v17 = -[FPDRequest init](&v33, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_fromPOSIX = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = objc_claimAutoreleasedReturnValue();
    date = v18->_date;
    v18->_date = (NSDate *)v19;

    v18->_qos = qos_class_self();
    *(_DWORD *)&v18->_selectedForMaterialization = 0;
    v18->_requestedExtent.location = v10;
    v18->_requestedExtent.length = v8;
    v18->_providedExtent.location = -1;
    v18->_providedExtent.length = -1;
    if (!(_DWORD)v16)
      v16 = getpid();
    v18->_pid = v16;
    if ((int)v16 > -1001)
    {
      if ((v16 & 0x80000000) == 0)
      {
        memset(buffer, 0, sizeof(buffer));
        if ((proc_name(v16, buffer, 0x20u) & 0x80000000) == 0 && LOBYTE(buffer[0]))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
          v23 = objc_claimAutoreleasedReturnValue();
          processName = v18->_processName;
          v18->_processName = (NSString *)v23;

        }
        bzero(v34, 0x1000uLL);
        if (proc_pidpath(v18->_pid, v34, 0x1000u) < 0 || !v34[0])
          goto LABEL_16;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        executablePath = v18->_executablePath;
        v18->_executablePath = (NSString *)v25;

LABEL_16:
        +[FPDRequest fixupProcessName:](FPDRequest, "fixupProcessName:", v18->_processName);
        v29 = objc_claimAutoreleasedReturnValue();
        userProcessName = v18->_userProcessName;
        v18->_userProcessName = (NSString *)v29;

        v31 = *v14;
        *(_OWORD *)&v18->_audit_token.val[4] = v14[1];
        *(_OWORD *)v18->_audit_token.val = v31;
        return v18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TestProcess%d"), v16);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v18->_processName;
      v18->_processName = (NSString *)v26;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/path/to/TestProcess%d.app"), v18->_pid);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnresponsiveTestProcess%d"), v16);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v18->_processName;
      v18->_processName = (NSString *)v21;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/path/to/UnresponsiveTestProcess%d.app"), v18->_pid);
    }
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  return v18;
}

+ (id)fixupProcessName:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(CFSTR("com.apple.appkit.xpc.openAndSav"), "isEqualToString:", v3) & 1) != 0)
    v4 = CFSTR("Open and Save Panels");
  else
    v4 = (__CFString *)v3;

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid=%d name=%@ path=%@ isPOSIX=%d"), self->_pid, self->_processName, self->_executablePath, self->_fromPOSIX);
}

+ (id)requestForPID:(int)a3
{
  return (id)objc_msgSend(a1, "requestForPID:fromPOSIX:kernelFileInfo:", *(_QWORD *)&a3, 0, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)requestedExtent
{
  int64_t length;
  int64_t location;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  length = self->_requestedExtent.length;
  location = self->_requestedExtent.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (int)pid
{
  return self->_pid;
}

- (id)nsfpRequestForSession:(id)a3 isSpeculative:(BOOL)a4
{
  void *v5;
  int pid;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_opt_new(), "initWithIsSpeculativeDownload:", a4);
  pid = self->_pid;
  if (!pid || pid == getpid())
  {
    if (self->_executablePath)
    {
      objc_msgSend(MEMORY[0x1E0CAAD30], "_fpdIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v7;
      goto LABEL_10;
    }
LABEL_8:
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &UUID_NULL);
    goto LABEL_9;
  }
  if (!self->_executablePath)
    goto LABEL_8;
  +[FPDRequest UUIDForSystemExecutablePath:](FPDRequest, "UUIDForSystemExecutablePath:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_10:
    objc_msgSend(v5, "setRequestingApplicationIdentifier:", v8);
    goto LABEL_11;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &UUID_NULL);
  objc_msgSend(v5, "setRequestingApplicationIdentifier:", v9);

LABEL_11:
  return v5;
}

+ (id)requestForPID:(int)a3 fromPOSIX:(BOOL)a4
{
  return (id)objc_msgSend(a1, "requestForPID:fromPOSIX:kernelFileInfo:", *(_QWORD *)&a3, a4, 0);
}

+ (id)requestForXPCConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _OWORD v8[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "processIdentifier");
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v8, 0, sizeof(v8));
  objc_msgSend(a1, "requestForPID:auditToken:fromPOSIX:kernelFileInfo:", v5, v8, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)requestForSelf
{
  return (id)objc_msgSend(a1, "requestForPID:fromPOSIX:kernelFileInfo:", 0, 0, 0);
}

+ (id)requestForPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5
{
  __int128 v5;
  _OWORD v7[2];

  v5 = *(_OWORD *)&a4->var0[4];
  v7[0] = *(_OWORD *)a4->var0;
  v7[1] = v5;
  objc_msgSend(a1, "requestForPID:auditToken:fromPOSIX:kernelFileInfo:", *(_QWORD *)&a3, v7, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isPermittedToAttributeRequestingExecutable:(id)a3
{
  BOOL v4;
  void *v5;

  if ((objc_msgSend(a3, "hasFileProviderAttributionMDMAccess") & 1) != 0)
    return 1;
  objc_msgSend((id)objc_opt_class(), "UUIDForSystemExecutablePath:", self->_executablePath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;

  return v4;
}

- (id)nsfpRequestForSession:(id)a3
{
  return -[FPDRequest nsfpRequestForSession:isSpeculative:](self, "nsfpRequestForSession:isSpeculative:", a3, 0);
}

+ (id)UUIDForSystemExecutablePath:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (hardcodedUUIDs_onceToken != -1)
    dispatch_once(&hardcodedUUIDs_onceToken, &__block_literal_global_20);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)hardcodedUUIDs_ret;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v3, "hasPrefix:", v9, (_QWORD)v12) & 1) != 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/var/containers/Bundle/Application/"))
    && objc_msgSend(v3, "hasSuffix:", CFSTR("/Files.app/Files")))
  {
    objc_msgSend(MEMORY[0x1E0CAAD30], "_filesIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid=%d name=%@ isPOSIX=%d"), self->_pid, self->_processName, self->_fromPOSIX);
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)userProcessName
{
  return self->_userProcessName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (BOOL)isFromPOSIX
{
  return self->_fromPOSIX;
}

- (BOOL)selectedForMaterialization
{
  return self->_selectedForMaterialization;
}

- (void)setSelectedForMaterialization:(BOOL)a3
{
  self->_selectedForMaterialization = a3;
}

- (BOOL)shouldFailCoordinationIfDownloadRequired
{
  return self->_shouldFailCoordinationIfDownloadRequired;
}

- (void)setShouldFailCoordinationIfDownloadRequired:(BOOL)a3
{
  self->_shouldFailCoordinationIfDownloadRequired = a3;
}

- (void)setRequestedExtent:(id)a3
{
  self->_requestedExtent = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)providedExtent
{
  int64_t length;
  int64_t location;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  length = self->_providedExtent.length;
  location = self->_providedExtent.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setProvidedExtent:(id)a3
{
  self->_providedExtent = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- (BOOL)allowsResurrection
{
  return self->_allowsResurrection;
}

- (void)setAllowsResurrection:(BOOL)a3
{
  self->_allowsResurrection = a3;
}

- (BOOL)isProviderInitiated
{
  return self->_providerInitiated;
}

- (void)setProviderInitiated:(BOOL)a3
{
  self->_providerInitiated = a3;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSDate)date
{
  return self->_date;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAudit_token:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_audit_token.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_audit_token.val = v3;
}

@end
