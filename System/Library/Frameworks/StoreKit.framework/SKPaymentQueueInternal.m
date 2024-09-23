@implementation SKPaymentQueueInternal

- (SKPaymentQueueInternal)init
{
  SKPaymentQueueInternal *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  NSMutableArray *v6;
  NSMutableArray *transactions;
  NSMutableArray *v8;
  NSMutableArray *localTransactions;
  NSMutableArray *v10;
  NSMutableArray *weakObservers;
  NSMutableDictionary *v12;
  NSMutableDictionary *downloads;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SKPaymentQueueInternal;
  v2 = -[SKPaymentQueueInternal init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transactions = v2->_transactions;
    v2->_transactions = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    localTransactions = v2->_localTransactions;
    v2->_localTransactions = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = v10;

    objc_storeStrong((id *)&v2->_observerQueue, MEMORY[0x1E0C80D38]);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    downloads = v2->_downloads;
    v2->_downloads = v12;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SKXPCConnection setDisconnectBlock:](self->_requestConnection, "setDisconnectBlock:", 0);
  -[SKXPCConnection setMessageBlock:](self->_responseConnection, "setMessageBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKPaymentQueueInternal;
  -[SKPaymentQueueInternal dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseConnection, 0);
  objc_storeStrong((id *)&self->_requestConnection, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_localTransactions, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
