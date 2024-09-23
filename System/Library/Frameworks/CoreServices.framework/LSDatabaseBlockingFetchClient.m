@implementation LSDatabaseBlockingFetchClient

- (LSDatabaseBlockingFetchClient)initWithXPCConnection:(id)a3
{
  id v5;
  LSDatabaseBlockingFetchClient *v6;
  LSDatabaseBlockingFetchClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSDatabaseBlockingFetchClient;
  v6 = -[LSDatabaseBlockingFetchClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)getServerStoreBlockingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSXPCConnection *v7;
  os_unfair_lock_s *v8;
  NSXPCConnection *v9;
  id v10;
  _QWORD v11[4];
  NSXPCConnection *v12;
  id v13;

  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[LSDatabaseBlockingFetchClient getServerStoreBlockingWithCompletionHandler:]");
  if (getServerStoreBlockingWithCompletionHandler__onceToken != -1)
    dispatch_once(&getServerStoreBlockingWithCompletionHandler__onceToken, &__block_literal_global_33_1);
  +[LSDatabaseBlockingFetchServer sharedInstance](LSDatabaseBlockingFetchServer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isForManualRebuild");

  if (v6)
    __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_A_MANUAL_DATABASE_REBUILD_TO_COMPLETE__();
  else
    __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__();
  v7 = self->_connection;
  _LSServer_DatabaseExecutionContext();
  v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E1044670;
  v12 = v7;
  v13 = v4;
  v10 = v4;
  v9 = v7;
  -[LSDBExecutionContext syncRead:](v8, v11);

}

void __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke()
{
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_A_MANUAL_DATABASE_REBUILD_TO_COMPLETE__);
}

void __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  _LSServer_GetServerStoreForConnectionWithCompletionHandler(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
