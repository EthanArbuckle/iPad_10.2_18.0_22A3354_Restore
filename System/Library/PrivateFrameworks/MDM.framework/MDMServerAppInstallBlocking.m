@implementation MDMServerAppInstallBlocking

- (MDMServerAppInstallBlocking)init
{
  MDMServerAppInstallBlocking *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *appBlockQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDMServerAppInstallBlocking;
  v2 = -[MDMServerAppInstallBlocking init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("app install block", 0);
    appBlockQueue = v2->_appBlockQueue;
    v2->_appBlockQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)isAppInstallBlocked
{
  MDMServerAppInstallBlocking *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MDMServerAppInstallBlocking appBlockQueue](self, "appBlockQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__MDMServerAppInstallBlocking_isAppInstallBlocked__block_invoke;
  v5[3] = &unk_24EB68168;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __50__MDMServerAppInstallBlocking_isAppInstallBlocked__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appBlockCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, server block", buf, 2u);
  }
  -[MDMServerAppInstallBlocking appBlockQueue](self, "appBlockQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__MDMServerAppInstallBlocking_blockAppInstallsWithCompletion___block_invoke;
  v8[3] = &unk_24EB69370;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __62__MDMServerAppInstallBlocking_blockAppInstallsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "appBlockCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "block app installs, server block, failing because of another blocker", buf, 2u);
    }
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = (void *)MEMORY[0x24BDD1540];
      v5 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "DMCErrorWithDomain:code:descriptionArray:errorType:", v5, 12010, v6, *MEMORY[0x24BE2A5A0], 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "block app installs, server block, block established", v8, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setAppBlockCompletionBlock:", *(_QWORD *)(a1 + 40));
  }
}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, server unblock", buf, 2u);
  }
  -[MDMServerAppInstallBlocking appBlockQueue](self, "appBlockQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__MDMServerAppInstallBlocking_unblockAppInstallsWithCompletion___block_invoke;
  v8[3] = &unk_24EB69370;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

uint64_t __64__MDMServerAppInstallBlocking_unblockAppInstallsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t result;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "appBlockCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "block app installs, server unblock, unblocking", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "appBlockCompletionBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

    objc_msgSend(*(id *)(a1 + 32), "setAppBlockCompletionBlock:", 0);
    objc_msgSend(*(id *)(a1 + 32), "didUnblockAppInstalls");
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "block app installs, server unblock, no block in place, ignoring", v6, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)didUnblockAppInstalls
{
  id v2;

  -[MDMServerAppInstallBlocking server](self, "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retryNotNowWithCompletion:", &__block_literal_global_6);

}

void __52__MDMServerAppInstallBlocking_didUnblockAppInstalls__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138543362;
      v9 = v2;
      v5 = "block app installs, server unblock, retryNotNow failed: %{public}@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "block app installs, server unblock, retryNotNow complete";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

- (OS_dispatch_queue)appBlockQueue
{
  return self->_appBlockQueue;
}

- (void)setAppBlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_appBlockQueue, a3);
}

- (id)appBlockCompletionBlock
{
  return self->_appBlockCompletionBlock;
}

- (void)setAppBlockCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MDMServerCore)server
{
  return (MDMServerCore *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong(&self->_appBlockCompletionBlock, 0);
  objc_storeStrong((id *)&self->_appBlockQueue, 0);
}

@end
