@implementation FCCKPrivateDeleteAllZoneSubscriptionsOperation

- (void)performOperation
{
  void *v3;
  _QWORD v4[6];

  objc_msgSend(MEMORY[0x1E0C94E60], "fetchAllSubscriptionsOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke;
  v4[3] = &unk_1E4642FC0;
  v4[4] = self;
  v4[5] = 1;
  objc_msgSend(v3, "setFetchSubscriptionCompletionBlock:", v4);
  -[FCCKPrivateDatabaseOperation runChildCKOperation:destination:](self, "runChildCKOperation:destination:", v3, 1);

}

void __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v5 = a3;
  objc_msgSend(a2, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C94F28]);
    objc_msgSend(v9, "setSubscriptionIDsToDelete:", v8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_4;
    v10[3] = &unk_1E463D6B8;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "setModifySubscriptionsCompletionBlock:", v10);
    objc_msgSend(*(id *)(a1 + 32), "runChildCKOperation:destination:", v9, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v5);
  }

}

BOOL __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscriptionType") == 2;
}

uint64_t __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscriptionID");
}

uint64_t __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a4);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[FCCKPrivateDeleteAllZoneSubscriptionsOperation deleteAllZoneSubscriptionsCompletionBlock](self, "deleteAllZoneSubscriptionsCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateDeleteAllZoneSubscriptionsOperation deleteAllZoneSubscriptionsCompletionBlock](self, "deleteAllZoneSubscriptionsCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)deleteAllZoneSubscriptionsCompletionBlock
{
  return self->_deleteAllZoneSubscriptionsCompletionBlock;
}

- (void)setDeleteAllZoneSubscriptionsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deleteAllZoneSubscriptionsCompletionBlock, 0);
}

@end
