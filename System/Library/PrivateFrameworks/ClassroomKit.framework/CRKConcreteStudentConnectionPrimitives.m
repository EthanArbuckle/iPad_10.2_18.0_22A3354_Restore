@implementation CRKConcreteStudentConnectionPrimitives

- (void)connectWithCompletion:(id)a3 invalidationHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__CRKConcreteStudentConnectionPrimitives_connectWithCompletion_invalidationHandler___block_invoke;
  v9[3] = &unk_24D9C9E60;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  +[CRKConnectedStudentDaemonProxyFactory makeConnectedStudentDaemonProxyWithCompletion:](CRKConnectedStudentDaemonProxyFactory, "makeConnectedStudentDaemonProxyWithCompletion:", v9);

}

void __84__CRKConcreteStudentConnectionPrimitives_connectWithCompletion_invalidationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[CRKConcreteStudentConnection connectionWithStudentDaemonProxy:invalidationHandler:](CRKConcreteStudentConnection, "connectionWithStudentDaemonProxy:invalidationHandler:", a2, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
