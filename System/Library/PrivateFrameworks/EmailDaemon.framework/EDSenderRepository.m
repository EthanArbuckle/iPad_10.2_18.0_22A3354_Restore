@implementation EDSenderRepository

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__EDSenderRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_83 != -1)
    dispatch_once(&log_onceToken_83, block);
  return (id)log_log_83;
}

void __25__EDSenderRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_83;
  log_log_83 = (uint64_t)v1;

}

- (EDSenderRepository)initWithSenderPersistence:(id)a3
{
  id v5;
  EDSenderRepository *v6;
  EDSenderRepository *v7;
  uint64_t v8;
  EFScheduler *persistenceScheduler;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDSenderRepository;
  v6 = -[EDSenderRepository init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderPersistence, a3);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("EDSenderRepository.persistenceScheduler"), 25);
    v8 = objc_claimAutoreleasedReturnValue();
    persistenceScheduler = v7->_persistenceScheduler;
    v7->_persistenceScheduler = (EFScheduler *)v8;

  }
  return v7;
}

- (void)simpleAddressesForRelevantSendersForSearchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDSenderRepository persistenceScheduler](self, "persistenceScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__EDSenderRepository_simpleAddressesForRelevantSendersForSearchWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performVoucherPreservingBlock:", v7);

}

void __86__EDSenderRepository_simpleAddressesForRelevantSendersForSearchWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "senderPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevantSendersForSearch");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (EFScheduler)persistenceScheduler
{
  return self->_persistenceScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceScheduler, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
}

@end
