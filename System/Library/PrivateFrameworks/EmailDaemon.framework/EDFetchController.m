@implementation EDFetchController

- (EDFetchController)initWithAccountsProvider:(id)a3
{
  id v5;
  EDFetchController *v6;
  EDFetchController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDFetchController;
  v6 = -[EDFetchController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountsProvider, a3);

  return v7;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__EDFetchController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_30 != -1)
    dispatch_once(&log_onceToken_30, block);
  return (OS_os_log *)(id)log_log_30;
}

void __24__EDFetchController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_30;
  log_log_30 = (uint64_t)v1;

}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end
