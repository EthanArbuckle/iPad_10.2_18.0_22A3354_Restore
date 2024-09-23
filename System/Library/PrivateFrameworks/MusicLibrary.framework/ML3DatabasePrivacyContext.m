@implementation ML3DatabasePrivacyContext

- (void)logDatabasePrivacyAccess
{
  void *v3;
  id v4;
  void *v5;

  if (self->_clientApplication)
  {
    objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "loggingEnabled"))
    {
      v4 = objc_alloc(MEMORY[0x1E0D80C80]);
      v5 = (void *)objc_msgSend(v4, "initWithAccessor:forService:", self->_clientApplication, *MEMORY[0x1E0DB1158]);
      objc_msgSend(v3, "log:", v5);

    }
  }
  -[ML3GreenTeaLogger logAccess](self->_greenTeaLogger, "logAccess");
}

- (ML3DatabasePrivacyContext)initWithClientIdentity:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  ML3DatabasePrivacyContext *v7;

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
  v7 = -[ML3DatabasePrivacyContext _initWithPAApplication:](self, "_initWithPAApplication:", v6);

  return v7;
}

- (id)_initWithPAApplication:(id)a3
{
  id v4;
  ML3DatabasePrivacyContext *v5;
  PAApplication *v6;
  void *clientApplication;
  void *v8;
  void *v9;
  uint64_t v10;
  PAApplication *v11;
  ML3GreenTeaLogger *v12;
  void *v13;
  uint64_t v14;
  ML3GreenTeaLogger *greenTeaLogger;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ML3DatabasePrivacyContext;
  v5 = -[ML3DatabasePrivacyContext init](&v17, sel_init);
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
    v12 = [ML3GreenTeaLogger alloc];
    -[PAApplication bundleID](v5->_clientApplication, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ML3GreenTeaLogger initWithAccessorName:](v12, "initWithAccessorName:", v13);
    greenTeaLogger = v5->_greenTeaLogger;
    v5->_greenTeaLogger = (ML3GreenTeaLogger *)v14;

  }
  return v5;
}

- (ML3DatabasePrivacyContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ML3DatabasePrivacyContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ML3DatabasePrivacyContextClientApplicationsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ML3DatabasePrivacyContext _initWithPAApplication:](self, "_initWithPAApplication:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_clientApplication, CFSTR("ML3DatabasePrivacyContextClientApplicationsKey"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenTeaLogger, 0);
  objc_storeStrong((id *)&self->_clientApplication, 0);
}

- (ML3DatabasePrivacyContext)init
{
  return (ML3DatabasePrivacyContext *)-[ML3DatabasePrivacyContext _initWithPAApplication:](self, "_initWithPAApplication:", 0);
}

- (ML3DatabasePrivacyContext)initWithAuditToken:(id *)a3
{
  id v5;
  __int128 v6;
  void *v7;
  ML3DatabasePrivacyContext *v8;
  _OWORD v10[2];

  v5 = objc_alloc(MEMORY[0x1E0D80C58]);
  v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  v7 = (void *)objc_msgSend(v5, "initWithAuditToken:", v10);
  v8 = -[ML3DatabasePrivacyContext _initWithPAApplication:](self, "_initWithPAApplication:", v7);

  return v8;
}

- (NSString)bundleID
{
  return (NSString *)-[PAApplication bundleID](self->_clientApplication, "bundleID");
}

+ (void)logDatabasePrivacyAccessWithAuditToken:(id *)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 v11;

  v4 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v4;
  MSVBundleIDForAuditToken();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3GreenTeaLogger logOnceForAccessor:](ML3GreenTeaLogger, "logOnceForAccessor:", v5, v10, v11);
  objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "loggingEnabled"))
  {
    v7 = *MEMORY[0x1E0DB1158];
    v8 = *(_OWORD *)&a3->var0[4];
    v10 = *(_OWORD *)a3->var0;
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0D80C80], "accessWithAuditToken:forService:", &v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "log:", v9);

  }
}

+ (id)sharedContext
{
  if (sharedContext_onceToken != -1)
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_1216);
  return (id)sharedContext___sharedContext;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __42__ML3DatabasePrivacyContext_sharedContext__block_invoke()
{
  ML3DatabasePrivacyContext *v0;
  void *v1;

  v0 = objc_alloc_init(ML3DatabasePrivacyContext);
  v1 = (void *)sharedContext___sharedContext;
  sharedContext___sharedContext = (uint64_t)v0;

}

@end
