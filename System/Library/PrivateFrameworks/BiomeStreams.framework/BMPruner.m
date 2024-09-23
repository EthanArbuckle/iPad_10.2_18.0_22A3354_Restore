@implementation BMPruner

- (BMPruner)initWithStoreStream:(id)a3 remote:(id)a4
{
  id v7;
  id v8;
  BMPruner *v9;
  BMPruner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMPruner;
  v9 = -[BMPruner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeStream, a3);
    objc_storeStrong((id *)&v10->_remote, a4);
  }

  return v10;
}

- (void)deleteWithPolicy:(id)a3 eventsPassingTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BMStoreStream *storeStream;
  NSString *remote;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.biome.deletion-policy.%@"), v6);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  v9 = (void *)os_transaction_create();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  storeStream = self->_storeStream;
  remote = self->_remote;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__BMPruner_deleteWithPolicy_eventsPassingTest___block_invoke;
  v15[3] = &unk_1E2647908;
  v12 = v7;
  v16 = v12;
  v17 = &v18;
  -[BMStoreStream pruneEventsOfRemote:withReason:policyID:usingPredicateBlock:](storeStream, "pruneEventsOfRemote:withReason:policyID:usingPredicateBlock:", remote, 2, v6, v15);

  v13 = (void *)MEMORY[0x1E0D01CE8];
  -[BMStoreStream identifier](self->_storeStream, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendDeletionPolicyMetrics:stream:numDeleted:exception:", v6, v14, *((unsigned int *)v19 + 6), 0);

  _Block_object_dispose(&v18, 8);
}

uint64_t __47__BMPruner_deleteWithPolicy_eventsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)deleteEventsPassingTest:(id)a3
{
  -[BMStoreStream pruneWithReason:usingPredicateBlock:](self->_storeStream, "pruneWithReason:usingPredicateBlock:", 2, a3);
}

- (BOOL)deleteStoreEvent:(id)a3
{
  return -[BMStoreStream deleteStoreEvent:](self->_storeStream, "deleteStoreEvent:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_storeStream, 0);
}

@end
