@implementation HKVerifiableHealthRecordsParsingService

- (HKVerifiableHealthRecordsParsingService)init
{
  void *v3;
  HKVerifiableHealthRecordsParsingService *v4;

  +[HKHealthRecordsDaemonConnection sharedConnection](HKHealthRecordsDaemonConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKVerifiableHealthRecordsParsingService initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (HKVerifiableHealthRecordsParsingService)initWithConnection:(id)a3
{
  id v4;
  HKVerifiableHealthRecordsParsingService *v5;
  HKHealthRecordsDaemonProxyProvider *v6;
  HKProxyProvider *proxyProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKVerifiableHealthRecordsParsingService;
  v5 = -[HKVerifiableHealthRecordsParsingService init](&v9, sel_init);
  if (v5)
  {
    v6 = -[HKHealthRecordsDaemonProxyProvider initWithConnection:serviceIdentifier:exportedObject:]([HKHealthRecordsDaemonProxyProvider alloc], "initWithConnection:serviceIdentifier:exportedObject:", v4, CFSTR("VerifiableHealthRecordsParsingService"), v5);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

  }
  return v5;
}

- (void)parseDataSource:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke;
  v15[3] = &unk_24D54A5B0;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKVerifiableHealthRecordsParsingService _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_parseDataSource:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (HKProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
