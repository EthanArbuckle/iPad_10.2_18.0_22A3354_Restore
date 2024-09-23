@implementation TKTokenConfigurationTransaction

- (TKTokenConfigurationTransaction)initWithConfigurationConnection:(id)a3
{
  id v5;
  TKTokenConfigurationTransaction *v6;
  TKTokenConfigurationTransaction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenConfigurationTransaction;
  v6 = -[TKTokenConfigurationTransaction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationConnection, a3);

  return v7;
}

- (void)commit
{
  TKTokenConfigurationConnection *configurationConnection;
  void *v4;
  TKTokenConfigurationConnection *v5;
  void *v7;

  configurationConnection = self->_configurationConnection;
  if (!configurationConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenConfiguration.m"), 97, CFSTR("Double-commit of transaction"));

    configurationConnection = self->_configurationConnection;
  }
  -[TKTokenConfigurationConnection configurationProtocol](configurationConnection, "configurationProtocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTransactionWithReply:", &__block_literal_global_76);

  v5 = self->_configurationConnection;
  self->_configurationConnection = 0;

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_configurationConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenConfiguration.m"), 103, CFSTR("Destroying uncommited transaction"));

  }
  v5.receiver = self;
  v5.super_class = (Class)TKTokenConfigurationTransaction;
  -[TKTokenConfigurationTransaction dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationConnection, 0);
}

@end
