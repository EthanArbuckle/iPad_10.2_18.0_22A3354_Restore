@implementation CXNetworkExtensionMessageController

- (CXNetworkExtensionMessageController)init
{
  CXNetworkExtensionMessageControllerXPCClient *v3;
  CXNetworkExtensionMessageController *v4;

  v3 = objc_alloc_init(CXNetworkExtensionMessageControllerXPCClient);
  v4 = -[CXNetworkExtensionMessageController initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (CXNetworkExtensionMessageController)initWithDataSource:(id)a3
{
  id v5;
  CXNetworkExtensionMessageController *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXNetworkExtensionMessageController;
  v6 = -[CXNetworkExtensionMessageController init](&v8, sel_init);
  if (v6)
  {
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXNetworkExtensionMessageController initWithDataSource:]", CFSTR("dataSource"));
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXNetworkExtensionMessageController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__CXNetworkExtensionMessageController_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E4B896D8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "sendNetworkExtensionMessage:forBundleIdentifier:completion:", v10, v9, v13);

}

uint64_t __98__CXNetworkExtensionMessageController_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXNetworkExtensionMessageController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__CXNetworkExtensionMessageController_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E4B896D8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "sendNetworkExtensionPushToTalkMessage:forBundleIdentifier:completion:", v10, v9, v13);

}

uint64_t __108__CXNetworkExtensionMessageController_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (CXNetworkExtensionMessageControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
