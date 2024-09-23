@implementation MPMediaLibraryPrivacyContext

- (void)logPrivacyAccess
{
  void *v3;
  id v4;

  -[MPGreenTeaLoggerWrapper logAccess](self->_gtLogger, "logAccess");
  objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "loggingEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D80C80], "accessWithAccessor:forService:", self->_clientApplication, *MEMORY[0x1E0DB1158]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "log:", v3);

  }
}

+ (id)sharedContextForCurrentProcess
{
  if (sharedContextForCurrentProcess_onceToken != -1)
    dispatch_once(&sharedContextForCurrentProcess_onceToken, &__block_literal_global_13);
  return (id)sharedContextForCurrentProcess___contextForCurrentProcess;
}

+ (id)contextForDefaultClient
{
  id v2;
  MPMediaLibraryPrivacyContext *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&__defaultLock);
  v2 = (id)__defaultApplication;
  os_unfair_lock_unlock((os_unfair_lock_t)&__defaultLock);
  v3 = -[MPMediaLibraryPrivacyContext initWithPAApplication:]([MPMediaLibraryPrivacyContext alloc], "initWithPAApplication:", v2);

  return v3;
}

- (MPMediaLibraryPrivacyContext)initWithPAApplication:(id)a3
{
  id v4;
  MPMediaLibraryPrivacyContext *v5;
  PAApplication *v6;
  void *clientApplication;
  void *v8;
  void *v9;
  uint64_t v10;
  PAApplication *v11;
  MPGreenTeaLoggerWrapper *v12;
  void *v13;
  uint64_t v14;
  MPGreenTeaLoggerWrapper *gtLogger;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPMediaLibraryPrivacyContext;
  v5 = -[MPMediaLibraryPrivacyContext init](&v17, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (PAApplication *)v4;
      clientApplication = v5->_clientApplication;
      v5->_clientApplication = v6;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0D80C58];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      clientApplication = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(clientApplication, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "applicationWithBundleID:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_clientApplication;
      v5->_clientApplication = (PAApplication *)v10;

    }
    v12 = [MPGreenTeaLoggerWrapper alloc];
    -[PAApplication bundleID](v5->_clientApplication, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MPGreenTeaLoggerWrapper initWithAccessorName:](v12, "initWithAccessorName:", v13);
    gtLogger = v5->_gtLogger;
    v5->_gtLogger = (MPGreenTeaLoggerWrapper *)v14;

  }
  return v5;
}

+ (void)initialize
{
  if (initialize_onceToken_32512 != -1)
    dispatch_once(&initialize_onceToken_32512, &__block_literal_global_32513);
}

void __62__MPMediaLibraryPrivacyContext_sharedContextForCurrentProcess__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MPMediaLibraryPrivacyContext *v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0D80C58];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "applicationWithBundleID:", v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = -[MPMediaLibraryPrivacyContext initWithPAApplication:]([MPMediaLibraryPrivacyContext alloc], "initWithPAApplication:", v5);
  v4 = (void *)sharedContextForCurrentProcess___contextForCurrentProcess;
  sharedContextForCurrentProcess___contextForCurrentProcess = (uint64_t)v3;

}

void __42__MPMediaLibraryPrivacyContext_initialize__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0D80C58];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "applicationWithBundleID:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__defaultApplication;
  __defaultApplication = v2;

}

- (MPMediaLibraryPrivacyContext)init
{
  return -[MPMediaLibraryPrivacyContext initWithPAApplication:](self, "initWithPAApplication:", 0);
}

- (MPMediaLibraryPrivacyContext)initWithClientIdentity:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  MPMediaLibraryPrivacyContext *v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D80C58];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithTCCIdentity:", v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = -[MPMediaLibraryPrivacyContext initWithPAApplication:](self, "initWithPAApplication:", v6);

  return v7;
}

- (MPMediaLibraryPrivacyContext)initWithAuditToken:(id *)a3
{
  id v5;
  __int128 v6;
  void *v7;
  MPMediaLibraryPrivacyContext *v8;
  _OWORD v10[2];

  v5 = objc_alloc(MEMORY[0x1E0D80C58]);
  v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  v7 = (void *)objc_msgSend(v5, "initWithAuditToken:", v10);
  v8 = -[MPMediaLibraryPrivacyContext initWithPAApplication:](self, "initWithPAApplication:", v7);

  return v8;
}

- (void)beginAccessInterval
{
  void *v3;
  PAAccessInterval *v4;
  PAAccessInterval *privacyAccessInterval;
  id v6;

  objc_msgSend(MEMORY[0x1E0D80C80], "accessWithAccessor:forService:", self->_clientApplication, *MEMORY[0x1E0DB1158]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginIntervalForAccess:", v6);
  v4 = (PAAccessInterval *)objc_claimAutoreleasedReturnValue();
  privacyAccessInterval = self->_privacyAccessInterval;
  self->_privacyAccessInterval = v4;

  -[MPGreenTeaLoggerWrapper beginLogAccessInterval](self->_gtLogger, "beginLogAccessInterval");
}

- (void)endAccessInterval
{
  -[PAAccessInterval end](self->_privacyAccessInterval, "end");
  -[MPGreenTeaLoggerWrapper endLogAccessInterval](self->_gtLogger, "endLogAccessInterval");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gtLogger, 0);
  objc_storeStrong((id *)&self->_privacyAccessInterval, 0);
  objc_storeStrong((id *)&self->_clientApplication, 0);
}

+ (void)setDefaultClientWithAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[2];

  os_unfair_lock_lock((os_unfair_lock_t)&__defaultLock);
  v4 = objc_alloc(MEMORY[0x1E0D80C58]);
  v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  v6 = objc_msgSend(v4, "initWithAuditToken:", v8);
  v7 = (void *)__defaultApplication;
  __defaultApplication = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&__defaultLock);
}

@end
