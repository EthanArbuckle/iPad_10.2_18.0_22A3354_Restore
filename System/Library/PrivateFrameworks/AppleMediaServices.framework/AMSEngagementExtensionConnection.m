@implementation AMSEngagementExtensionConnection

- (AMSEngagementExtensionConnection)initWithPrincipalObject:(id)a3
{
  id v5;
  AMSEngagementExtensionConnection *v6;
  AMSEngagementExtensionConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementExtensionConnection;
  v6 = -[AMSEngagementExtensionConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_principalObject, a3);

  return v7;
}

- (id)principalObject
{
  return self->_principalObject;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "processIdentifier");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = objc_opt_class();
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepting XPC connection from %d", (uint8_t *)&v10, 0x12u);
  }

  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0AE008);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v8);
  objc_msgSend(v4, "resume");

  return 1;
}

- (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  Class v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (Class)objc_msgSend(v7, "principalClass");

  if (v8)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  v16 = v15;

  if (!v16)
  {
LABEL_15:

    goto LABEL_16;
  }
  v8 = NSClassFromString((NSString *)v16);

  if (v8)
  {
LABEL_2:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling primary class", (uint8_t *)&v20, 0xCu);
    }

    -[objc_class performRequestWithObject:completion:](v8, "performRequestWithObject:completion:", v5, v6);
    goto LABEL_21;
  }
LABEL_16:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v20 = 138543362;
    v21 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to locate class", (uint8_t *)&v20, 0xCu);
  }

  AMSError(0, CFSTR("Extension Failure"), CFSTR("Unable to locate principle class"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v19);

LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_principalObject, 0);
}

@end
