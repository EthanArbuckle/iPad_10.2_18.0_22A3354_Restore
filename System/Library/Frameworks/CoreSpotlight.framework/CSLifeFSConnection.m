@implementation CSLifeFSConnection

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_14);
  return (id)sharedConnection_sCSUserFSConnection;
}

void __38__CSLifeFSConnection_sharedConnection__block_invoke()
{
  NSObject *v0;
  CSLifeFSConnection *v1;
  uint8_t v2[16];
  stat v3;

  memset(&v3, 0, sizeof(v3));
  if (stat("/System/Library/LaunchDaemons/com.apple.spotlight.IndexAgent.plist", &v3))
  {
    logForCSLogCategoryIndex();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_18C42F000, v0, OS_LOG_TYPE_INFO, "com.apple.spotlight.IndexAgent not installed", v2, 2u);
    }
  }
  else
  {
    v1 = -[CSXPCConnection initWithMachServiceName:]([CSLifeFSConnection alloc], "initWithMachServiceName:", CFSTR("com.apple.spotlight.userfs"));
    v0 = sharedConnection_sCSUserFSConnection;
    sharedConnection_sCSUserFSConnection = (uint64_t)v1;
  }

}

- (void)handleError:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSLifeFSConnection;
  -[CSXPCConnection handleError:](&v3, sel_handleError_, a3);
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSLifeFSConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CSXPCConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke;
  block[3] = &unk_1E2402940;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke_2;
  v4[3] = &unk_1E2401FB8;
  v5 = *(id *)(a1 + 48);
  v3.receiver = v2;
  v3.super_class = (Class)CSLifeFSConnection;
  objc_msgSendSuper2(&v3, sel_sendMessageAsync_completion_, v1, v4);

}

uint64_t __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
