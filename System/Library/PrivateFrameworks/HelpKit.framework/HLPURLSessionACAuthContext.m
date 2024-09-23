@implementation HLPURLSessionACAuthContext

+ (id)defaultContext
{
  if (defaultContext_onceToken != -1)
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_13);
  return (id)defaultContext_context;
}

void __44__HLPURLSessionACAuthContext_defaultContext__block_invoke()
{
  HLPURLSessionACAuthContext *v0;
  void *v1;

  v0 = -[HLPURLSessionACAuthContext initWithAppIdentifier:enviromentIdentifier:interactivity:]([HLPURLSessionACAuthContext alloc], "initWithAppIdentifier:enviromentIdentifier:interactivity:", CFSTR("170617"), CFSTR("APPLECONNECT.APPLE.COM"), CFSTR("0"));
  v1 = (void *)defaultContext_context;
  defaultContext_context = (uint64_t)v0;

}

- (HLPURLSessionACAuthContext)initWithAppIdentifier:(id)a3 enviromentIdentifier:(id)a4 interactivity:(id)a5
{
  id v9;
  id v10;
  id v11;
  HLPURLSessionACAuthContext *v12;
  HLPURLSessionACAuthContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HLPURLSessionACAuthContext;
  v12 = -[HLPURLSessionACAuthContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appIdentifier, a3);
    objc_storeStrong((id *)&v13->_enviromentIdentifier, a4);
    objc_storeStrong((id *)&v13->_interactivityMode, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HLPURLSessionACAuthContext appIdentifier](self, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppIdentifier:", v5);

  -[HLPURLSessionACAuthContext enviromentIdentifier](self, "enviromentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnviromentIdentifier:", v6);

  -[HLPURLSessionACAuthContext interactivityMode](self, "interactivityMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractivityMode:", v7);

  -[HLPURLSessionACAuthContext clientIdentifier](self, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentifier:", v8);

  return v4;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)enviromentIdentifier
{
  return self->_enviromentIdentifier;
}

- (void)setEnviromentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)interactivityMode
{
  return self->_interactivityMode;
}

- (void)setInteractivityMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactivityMode, 0);
  objc_storeStrong((id *)&self->_enviromentIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end
