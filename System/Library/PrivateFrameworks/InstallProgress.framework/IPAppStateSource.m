@implementation IPAppStateSource

- (IPAppStateSource)initWithApplicationIdentity:(id)a3
{
  return -[IPAppStateSource initWithApplicationIdentity:forStateSourceRegistry:](self, "initWithApplicationIdentity:forStateSourceRegistry:", a3, 0);
}

- (IPAppStateSource)initWithApplicationIdentity:(id)a3 forStateSourceRegistry:(id)a4
{
  id v7;
  IPAppStateSource *v8;
  IPAppStateSource *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPAppStateSource;
  v8 = -[IPInstallableStateSource initWithRegistry:](&v11, sel_initWithRegistry_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_appIdentity, a3);

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p { identity: %@ }>"), objc_opt_class(), self, self->_appIdentity);
}

- (id)collationKey
{
  return self->_appIdentity;
}

- (unint64_t)installableType
{
  return 1;
}

- (id)currentStateWithError:(id *)a3
{
  uint64_t v5;
  LSApplicationIdentity *appIdentity;
  uint64_t v7;
  id v8;
  IPAppState *v9;
  id v11;

  -[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:](self->_appIdentity, "findApplicationRecordFetchingPlaceholder:error:", 3, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  appIdentity = self->_appIdentity;
  v11 = 0;
  -[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:](appIdentity, "findApplicationRecordFetchingPlaceholder:error:", 0, &v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = 0;
  if (v5 | v7)
    v9 = -[IPAppState initWithAppStateSource:applicationIdentity:isInstalling:]([IPAppState alloc], "initWithAppStateSource:applicationIdentity:isInstalling:", self, self->_appIdentity, v5 != 0);
  if (a3 && !v9)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (id)progressSourceWithError:(id *)a3
{
  return -[IPInstallableProgressSource initWithStateSource:]([IPInstallableProgressSource alloc], "initWithStateSource:", self);
}

- (id)launchServicesIdentity
{
  return self->_appIdentity;
}

- (id)currentProgressForSource:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[IPInstallableStateSource associatedRegistry](self, "associatedRegistry", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentProgressForIdentity:error:", self->_appIdentity, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)noteInstallStarted
{
  IPAppState *v3;

  v3 = -[IPAppState initWithAppStateSource:applicationIdentity:isInstalling:]([IPAppState alloc], "initWithAppStateSource:applicationIdentity:isInstalling:", self, self->_appIdentity, 1);
  -[IPAppStateSource notifyOfUpdate:](self, "notifyOfUpdate:", v3);

}

- (void)notifyOfUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IPInstallableStateSource observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observationOfSource:didChangeToState:", self, v4);

}

- (void)noteRemoved
{
  id v3;

  -[IPInstallableStateSource observer](self, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observationOfSource:didEndForReason:", self, 2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentity, 0);
}

@end
