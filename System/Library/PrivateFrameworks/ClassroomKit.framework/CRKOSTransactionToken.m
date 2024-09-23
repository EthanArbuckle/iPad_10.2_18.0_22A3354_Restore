@implementation CRKOSTransactionToken

- (void)dealloc
{
  objc_super v3;

  -[CRKOSTransactionToken cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKOSTransactionToken;
  -[CRKOSTransactionToken dealloc](&v3, sel_dealloc);
}

- (CRKOSTransactionToken)initWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CRKOSTransactionToken *v8;
  uint64_t v9;
  id completionHandler;
  uint64_t v11;
  OS_os_transaction *underlyingTransaction;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKOSTransactionToken;
  v8 = -[CRKOSTransactionToken init](&v14, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x219A226E8](v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v9;

    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v11 = os_transaction_create();
    underlyingTransaction = v8->_underlyingTransaction;
    v8->_underlyingTransaction = (OS_os_transaction *)v11;

  }
  return v8;
}

- (void)cancel
{
  void *v3;
  void (**v4)(void);

  -[CRKOSTransactionToken setUnderlyingTransaction:](self, "setUnderlyingTransaction:", 0);
  -[CRKOSTransactionToken completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKOSTransactionToken completionHandler](self, "completionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    -[CRKOSTransactionToken setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4[2]();

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_os_transaction)underlyingTransaction
{
  return self->_underlyingTransaction;
}

- (void)setUnderlyingTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTransaction, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
