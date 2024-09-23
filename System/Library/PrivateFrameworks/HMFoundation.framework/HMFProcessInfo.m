@implementation HMFProcessInfo

- (BOOL)isEqual:(id)a3
{
  HMFProcessInfo *v4;
  HMFProcessInfo *v5;
  HMFProcessInfo *v6;
  int v7;
  BOOL v8;

  v4 = (HMFProcessInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = -[HMFProcessInfo identifier](self, "identifier");
      v8 = v7 == -[HMFProcessInfo identifier](v6, "identifier");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  HMFAttributeDescription *v8;
  HMFAttributeDescription *v9;
  void *v10;
  HMFAttributeDescription *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMFProcessInfo identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v6 = [HMFAttributeDescription alloc];
  -[HMFProcessInfo name](self, "name", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Name"), v7);
  v14[1] = v8;
  v9 = [HMFAttributeDescription alloc];
  -[HMFProcessInfo applicationIdentifier](self, "applicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMFAttributeDescription initWithName:value:](v9, "initWithName:value:", CFSTR("Application Identifier"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int)identifier
{
  return self->_identifier;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

+ (id)processInfoForXPCConnection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _OWORD v8[2];

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v8, 0, sizeof(v8));
  v6 = (void *)objc_msgSend(v5, "initWithAuditToken:", v8);

  return v6;
}

void __29__HMFProcessInfo_processInfo__block_invoke()
{
  HMFProcessInfo *v0;
  void *v1;

  v0 = objc_alloc_init(HMFProcessInfo);
  v1 = (void *)qword_1ED012F98;
  qword_1ED012F98 = (uint64_t)v0;

}

- (HMFProcessInfo)init
{
  void *v3;
  HMFProcessInfo *v4;
  NSObject *v5;
  void *v6;
  HMFProcessInfo *v7;
  HMFProcessInfo *v8;
  __int128 v10;
  __int128 v11;
  mach_msg_type_number_t task_info_outCnt[4];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  task_info_outCnt[0] = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&v10, task_info_outCnt))
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      task_info_outCnt[0] = 138543362;
      *(_QWORD *)&task_info_outCnt[1] = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine current audit token", (uint8_t *)task_info_outCnt, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = -[HMFProcessInfo initWithIdentifier:](v4, "initWithIdentifier:", getpid());
  }
  else
  {
    *(_OWORD *)task_info_outCnt = v10;
    v13 = v11;
    v7 = -[HMFProcessInfo initWithAuditToken:](self, "initWithAuditToken:", task_info_outCnt);
  }
  v8 = v7;

  return v8;
}

- (HMFProcessInfo)initWithAuditToken:(id *)a3
{
  __int128 v4;
  HMFProcessInfo *v5;
  $115C4C562B26FF47E01F9F4EA65B5887 *v6;
  __int128 v7;
  uint64_t v8;
  NSString *applicationIdentifier;
  __int128 v10;
  __SecTask *v11;
  __SecTask *v12;
  CFStringRef v13;
  NSString *signingIdentifier;
  audit_token_t v16;

  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v4;
  v5 = -[HMFProcessInfo initWithIdentifier:](self, "initWithIdentifier:", audit_token_to_pid(&v16));
  if (v5)
  {
    v6 = ($115C4C562B26FF47E01F9F4EA65B5887 *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v5->_auditToken = v6;
    v7 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v6->var0 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v6->var0[4] = v7;
    -[HMFProcessInfo valueForEntitlement:](v5, "valueForEntitlement:", CFSTR("application-identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v8;

    v10 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v16.val[4] = v10;
    v11 = SecTaskCreateWithAuditToken(0, &v16);
    if (v11)
    {
      v12 = v11;
      v13 = SecTaskCopySigningIdentifier(v11, 0);
      signingIdentifier = v5->_signingIdentifier;
      v5->_signingIdentifier = &v13->isa;

      CFRelease(v12);
    }
  }
  return v5;
}

- (HMFProcessInfo)initWithIdentifier:(int)a3
{
  void *v3;
  int v4;
  int v5;
  HMFProcessInfo *v6;
  HMFProcessInfo *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSURL *executableURL;
  void *v12;
  uint64_t v13;
  NSURL *mainBundleURL;
  uint64_t v15;
  NSString *name;
  objc_super v18;
  _BYTE buffer[4096];
  uint64_t v20;

  v3 = (void *)MEMORY[0x1E0C80A78](self, a2, *(_QWORD *)&a3);
  v5 = v4;
  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = v3;
  v18.super_class = (Class)HMFProcessInfo;
  v6 = -[HMFProcessInfo init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_identifier = v5;
    if (proc_pidpath(v5, buffer, 0x1000u) >= 1
      && (v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", buffer)) != 0)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v8, 0);

    }
    else
    {
      v10 = 0;
    }
    executableURL = v7->_executableURL;
    v7->_executableURL = (NSURL *)v10;

    -[HMFProcessInfo executableURL](v7, "executableURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = _CFBundleCopyBundleURLForExecutableURL();
    else
      v13 = 0;

    mainBundleURL = v7->_mainBundleURL;
    v7->_mainBundleURL = (NSURL *)v13;

    if (proc_name(v7->_identifier, buffer, 0x100u) < 1)
      v15 = 0;
    else
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", buffer);
    name = v7->_name;
    v7->_name = (NSString *)v15;

  }
  return v7;
}

- (NSURL)executableURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

+ (HMFProcessInfo)processInfo
{
  if (_MergedGlobals_3_11 != -1)
    dispatch_once(&_MergedGlobals_3_11, &__block_literal_global_30);
  return (HMFProcessInfo *)(id)qword_1ED012F98;
}

- (id)valueForEntitlement:(id)a3
{
  __CFString *v4;
  int identifier;
  pid_t v6;
  const __CFAllocator *v7;
  __SecTask *v8;
  $115C4C562B26FF47E01F9F4EA65B5887 *auditToken;
  __int128 v10;
  __SecTask *v11;
  void *v12;
  audit_token_t v14;

  v4 = (__CFString *)a3;
  if (!self->_auditToken)
    goto LABEL_7;
  identifier = self->_identifier;
  v6 = getpid();
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (identifier == v6)
  {
    v8 = SecTaskCreateFromSelf(v7);
  }
  else
  {
    auditToken = self->_auditToken;
    v10 = *(_OWORD *)&auditToken->var0[4];
    *(_OWORD *)v14.val = *(_OWORD *)auditToken->var0;
    *(_OWORD *)&v14.val[4] = v10;
    v8 = SecTaskCreateWithAuditToken(v7, &v14);
  }
  v11 = v8;
  if (v8)
  {
    v12 = (void *)SecTaskCopyValueForEntitlement(v8, v4, 0);
    CFRelease(v11);
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (NSURL)mainBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)dealloc
{
  $115C4C562B26FF47E01F9F4EA65B5887 *auditToken;
  objc_super v4;

  auditToken = self->_auditToken;
  if (auditToken)
  {
    free(auditToken);
    self->_auditToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HMFProcessInfo;
  -[HMFProcessInfo dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_mainBundleURL, 0);
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Process %d"), -[HMFProcessInfo identifier](self, "identifier"));
}

- (NSBundle)mainBundle
{
  void *v2;
  void *v3;

  -[HMFProcessInfo mainBundleURL](self, "mainBundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSBundle *)v3;
}

- (BOOL)getAuditToken:(id *)a3
{
  $115C4C562B26FF47E01F9F4EA65B5887 *auditToken;
  __int128 v4;

  auditToken = self->_auditToken;
  if (a3 && auditToken)
  {
    v4 = *(_OWORD *)&auditToken->var0[4];
    *(_OWORD *)a3->var0 = *(_OWORD *)auditToken->var0;
    *(_OWORD *)&a3->var0[4] = v4;
  }
  return auditToken != 0;
}

+ (id)logCategory
{
  if (qword_1ED012FA0 != -1)
    dispatch_once(&qword_1ED012FA0, &__block_literal_global_17);
  return (id)qword_1ED012FA8;
}

void __29__HMFProcessInfo_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("ProcessInfo"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012FA8;
  qword_1ED012FA8 = v0;

}

- (id)logIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[HMFProcessInfo identifier](self, "identifier"));
}

- (HMFBoolean)isCodeSigned
{
  void *v2;

  if (self->_auditToken)
  {
    csops_audittoken();
    +[HMFBoolean BOOLeanWithBool:](HMFBoolean, "BOOLeanWithBool:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (HMFBoolean *)v2;
}

- (HMFBoolean)isPlatformBinary
{
  void *v2;

  if (self->_auditToken)
  {
    csops_audittoken();
    +[HMFBoolean BOOLeanWithBool:](HMFBoolean, "BOOLeanWithBool:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (HMFBoolean *)v2;
}

- (NSString)signingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

@end
