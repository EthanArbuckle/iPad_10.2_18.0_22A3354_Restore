@implementation FCFeedPrewarmer

- (FCFeedPrewarmer)initWithContentContext:(id)a3
{
  id v5;
  FCFeedPrewarmer *v6;
  FCFeedPrewarmer *v7;
  FCThreadSafeMutableDictionary *v8;
  FCThreadSafeMutableDictionary *prewarmOperations;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCFeedPrewarmer;
  v6 = -[FCFeedPrewarmer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentContext, a3);
    v8 = objc_alloc_init(FCThreadSafeMutableDictionary);
    prewarmOperations = v7->_prewarmOperations;
    v7->_prewarmOperations = v8;

  }
  return v7;
}

- (void)startPrewarmingRequest:(id)a3
{
  id v4;
  FCFeedPrewarmOperation *v5;
  void *v6;
  FCFeedPrewarmOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [FCFeedPrewarmOperation alloc];
  -[FCFeedPrewarmer contentContext](self, "contentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCFeedPrewarmOperation initWithPrewarmRequest:contentContext:](v5, "initWithPrewarmRequest:contentContext:", v4, v6);

  -[FCOperation setQualityOfService:](v7, "setQualityOfService:", 25);
  -[FCOperation setRelativePriority:](v7, "setRelativePriority:", 1);
  -[FCFeedPrewarmer prewarmOperations](self, "prewarmOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

  v10 = (void *)FCFeedPrewarmLog;
  if (os_log_type_enabled((os_log_t)FCFeedPrewarmLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v4, "requestKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCOperation operationID](v7, "operationID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "will prewarm feeds for key=%{public}@, operationID=%{public}@", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_prewarmQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v7);

}

- (FCThreadSafeMutableDictionary)prewarmOperations
{
  return self->_prewarmOperations;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)finishPrewarmingRequestForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[6];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FCFeedPrewarmer prewarmOperations](self, "prewarmOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    v11 = (void *)FCFeedPrewarmLog;
    if (os_log_type_enabled((os_log_t)FCFeedPrewarmLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v10, "operationID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "will finish prewarm operation for key=%{public}@, operationID=%{public}@", buf, 0x16u);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke_4;
    v14[3] = &unk_1E4647738;
    v15 = v7;
    objc_msgSend(v10, "commitResultsOnceWithCompletionHandler:", v14);

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke;
    v16[3] = &unk_1E463B790;
    v16[4] = v6;
    v16[5] = v7;
    __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke((uint64_t)v16);
  }

}

void __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  FCFeedPrewarmResult *v5;
  FCFeedPrewarmResult *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = FCFeedPrewarmLog;
  if (os_log_type_enabled((os_log_t)FCFeedPrewarmLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "found no prewarm operation for key=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = [FCFeedPrewarmResult alloc];
    v6 = -[FCFeedPrewarmResult initWithSuccessfulRequests:failedRequests:](v5, "initWithSuccessfulRequests:failedRequests:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    (*(void (**)(uint64_t, FCFeedPrewarmResult *))(v4 + 16))(v4, v6);

  }
}

uint64_t __60__FCFeedPrewarmer_finishPrewarmingRequestForKey_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmOperations, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end
