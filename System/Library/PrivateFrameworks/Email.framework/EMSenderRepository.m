@implementation EMSenderRepository

+ (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FC70);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__EMSenderRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_38 != -1)
    dispatch_once(&log_onceToken_38, block);
  return (id)log_log_38;
}

void __25__EMSenderRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_38;
  log_log_38 = (uint64_t)v1;

}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EMSenderRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSenderRepository performQuery:withObserver:]", "EMSenderRepository.m", 26, "0");
}

- (void)refreshQueryWithObserver:(id)a3
{
  id v5;

  v5 = a3;
  -[EMSenderRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSenderRepository refreshQueryWithObserver:]", "EMSenderRepository.m", 30, "0");
}

- (void)simpleAddressesForRelevantSendersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[EMRepository connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke;
  v12[3] = &unk_1E70F4ED8;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_3;
  v10[3] = &unk_1E70F4A70;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "simpleAddressesForRelevantSendersForSearchWithCompletionHandler:", v10);

}

void __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_2;
  v6[3] = &unk_1E70F2F18;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_4;
  v10[3] = &unk_1E70F4A48;
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
