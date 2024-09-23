@implementation AMSMetricsIdentifier

- (id)generateEventFields
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[AMSMetricsIdentifier generateIdentifier](self, "generateIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = CFSTR("clientGeneratedId");
    v6[1] = CFSTR("clientId");
    v7[0] = MEMORY[0x1E0C9AAB0];
    v7[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (id)generateIdentifier
{
  AMSMetricsIdentifierStore *store;
  void *v3;
  void *v4;

  store = self->_store;
  +[AMSMetricsIdentifier clientIdKey](AMSMetricsIdentifier, "clientIdKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsIdentifierStore identifierForKey:](store, "identifierForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)clientIdKey
{
  if (_MergedGlobals_129 != -1)
    dispatch_once(&_MergedGlobals_129, &__block_literal_global_90);
  return (id)qword_1ECEAD6D8;
}

void __35__AMSMetricsIdentifier_clientIdKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSMetricsIdentifierKey keyWithName:crossDeviceSync:](AMSMetricsIdentifierKey, "keyWithName:crossDeviceSync:", 0x1E254F760, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD6D8;
  qword_1ECEAD6D8 = v0;

}

- (AMSMetricsIdentifier)init
{
  AMSMetricsIdentifier *v2;
  uint64_t v3;
  AMSMetricsIdentifierStore *store;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMetricsIdentifier;
  v2 = -[AMSMetricsIdentifier init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    store = v2->_store;
    v2->_store = (AMSMetricsIdentifierStore *)v3;

    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsIdentifierStore setClientInfo:](v2->_store, "setClientInfo:", v5);

  }
  return v2;
}

- (void)setDuration:(double)a3
{
  -[AMSMetricsIdentifierStore setResetInterval:](self->_store, "setResetInterval:", a3);
}

- (void)setClientInfo:(id)a3
{
  -[AMSMetricsIdentifierStore setClientInfo:](self->_store, "setClientInfo:", a3);
}

- (void)setAccount:(id)a3
{
  -[AMSMetricsIdentifierStore setAccount:](self->_store, "setAccount:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (ACAccount)account
{
  return -[AMSMetricsIdentifierStore account](self->_store, "account");
}

- (AMSProcessInfo)clientInfo
{
  return -[AMSMetricsIdentifierStore clientInfo](self->_store, "clientInfo");
}

- (NSString)domain
{
  return -[AMSMetricsIdentifierStore domain](self->_store, "domain");
}

- (void)setDomain:(id)a3
{
  -[AMSMetricsIdentifierStore setDomain:](self->_store, "setDomain:", a3);
}

- (double)duration
{
  double result;

  -[AMSMetricsIdentifierStore resetInterval](self->_store, "resetInterval");
  return result;
}

+ (void)cleanupIdentifiers
{
  +[AMSMetricsIdentifierStore cleanupIdentifiers](AMSMetricsIdentifierStore, "cleanupIdentifiers");
}

+ (void)removeIdentifiersForAccount:(id)a3
{
  +[AMSMetricsIdentifierStore removeIdentifiersForAccount:](AMSMetricsIdentifierStore, "removeIdentifiersForAccount:", a3);
}

@end
