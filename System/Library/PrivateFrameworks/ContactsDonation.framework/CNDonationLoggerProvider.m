@implementation CNDonationLoggerProvider

+ (CNDonationLoggerProvider)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CNDonationLoggerProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_1 != -1)
    dispatch_once(&defaultProvider_cn_once_token_1, block);
  return (CNDonationLoggerProvider *)(id)defaultProvider_cn_once_object_1;
}

void __43__CNDonationLoggerProvider_defaultProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultProvider_cn_once_object_1;
  defaultProvider_cn_once_object_1 = (uint64_t)v1;

}

- (CNDonationLoggerProvider)init
{
  CNDonationLoggerProvider *v2;
  _CNDonationAgentLogger *v3;
  CNDonationAgentLogger *agentLoggerImpl;
  _CNDonationExtensionLogger *v5;
  CNDonationExtensionLogger *extensionLoggerImpl;
  _CNDonationToolLogger *v7;
  CNDonationToolLogger *toolLoggerImpl;
  _CNDonationAccountLogger *v9;
  CNDonationAccountLogger *accountLoggerImpl;
  _CNDonationPreferencesLogger *v11;
  CNDonationPreferencesLogger *preferencesLoggerImpl;
  _CNDonationAnalyticsLogger *v13;
  CNDonationAnalyticsLogger *analyticsLoggerImpl;
  _CNDonationManagedDuplicatesLogger *v15;
  CNDonationManagedDuplicatesLogger *duplicatesLoggerImpl;
  CNDonationLoggerProvider *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CNDonationLoggerProvider;
  v2 = -[CNDonationLoggerProvider init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_CNDonationAgentLogger);
    agentLoggerImpl = v2->_agentLoggerImpl;
    v2->_agentLoggerImpl = (CNDonationAgentLogger *)v3;

    v5 = objc_alloc_init(_CNDonationExtensionLogger);
    extensionLoggerImpl = v2->_extensionLoggerImpl;
    v2->_extensionLoggerImpl = (CNDonationExtensionLogger *)v5;

    v7 = objc_alloc_init(_CNDonationToolLogger);
    toolLoggerImpl = v2->_toolLoggerImpl;
    v2->_toolLoggerImpl = (CNDonationToolLogger *)v7;

    v9 = objc_alloc_init(_CNDonationAccountLogger);
    accountLoggerImpl = v2->_accountLoggerImpl;
    v2->_accountLoggerImpl = (CNDonationAccountLogger *)v9;

    v11 = objc_alloc_init(_CNDonationPreferencesLogger);
    preferencesLoggerImpl = v2->_preferencesLoggerImpl;
    v2->_preferencesLoggerImpl = (CNDonationPreferencesLogger *)v11;

    v13 = objc_alloc_init(_CNDonationAnalyticsLogger);
    analyticsLoggerImpl = v2->_analyticsLoggerImpl;
    v2->_analyticsLoggerImpl = (CNDonationAnalyticsLogger *)v13;

    v15 = objc_alloc_init(_CNDonationManagedDuplicatesLogger);
    duplicatesLoggerImpl = v2->_duplicatesLoggerImpl;
    v2->_duplicatesLoggerImpl = (CNDonationManagedDuplicatesLogger *)v15;

    v17 = v2;
  }

  return v2;
}

- (CNDonationAgentLogger)agentLoggerImpl
{
  return self->_agentLoggerImpl;
}

- (CNDonationExtensionLogger)extensionLoggerImpl
{
  return self->_extensionLoggerImpl;
}

- (CNDonationToolLogger)toolLoggerImpl
{
  return self->_toolLoggerImpl;
}

- (CNDonationAccountLogger)accountLoggerImpl
{
  return self->_accountLoggerImpl;
}

- (CNDonationPreferencesLogger)preferencesLoggerImpl
{
  return self->_preferencesLoggerImpl;
}

- (CNDonationAnalyticsLogger)analyticsLoggerImpl
{
  return self->_analyticsLoggerImpl;
}

- (CNDonationManagedDuplicatesLogger)duplicatesLoggerImpl
{
  return self->_duplicatesLoggerImpl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicatesLoggerImpl, 0);
  objc_storeStrong((id *)&self->_analyticsLoggerImpl, 0);
  objc_storeStrong((id *)&self->_preferencesLoggerImpl, 0);
  objc_storeStrong((id *)&self->_accountLoggerImpl, 0);
  objc_storeStrong((id *)&self->_toolLoggerImpl, 0);
  objc_storeStrong((id *)&self->_extensionLoggerImpl, 0);
  objc_storeStrong((id *)&self->_agentLoggerImpl, 0);
}

@end
