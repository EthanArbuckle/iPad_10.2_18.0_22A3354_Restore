@implementation DATransaction

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[DATransactionMonitor sharedTransactionMonitor](DATransactionMonitor, "sharedTransactionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrementTransactionCountForTransaction:", self->_transactionId);

  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    -[DATransaction transactionId](self, "transactionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B51E4000, v4, v5, "DATransaction exiting, ID: %@", buf, 0xCu);

  }
  v7.receiver = self;
  v7.super_class = (Class)DATransaction;
  -[DATransaction dealloc](&v7, sel_dealloc);
}

- (DATransaction)init
{
  return -[DATransaction initWithLabel:](self, "initWithLabel:", 0);
}

- (DATransaction)initWithLabel:(id)a3
{
  NSString *v4;
  DATransaction *v5;
  uint64_t v6;
  NSString *transactionId;
  NSString *v8;
  NSString *v9;
  NSString *label;
  uint64_t v11;
  OS_os_transaction *transaction;
  void *v13;
  objc_super v15;

  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)DATransaction;
  v5 = -[DATransaction init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "da_newGUID");
    v6 = objc_claimAutoreleasedReturnValue();
    transactionId = v5->_transactionId;
    v5->_transactionId = (NSString *)v6;

    v8 = v4;
    if (!v4)
      v8 = v5->_transactionId;
    v9 = v8;
    label = v5->_label;
    v5->_label = v9;

    -[NSString UTF8String](v5->_label, "UTF8String");
    v11 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v11;

    +[DATransactionMonitor sharedTransactionMonitor](DATransactionMonitor, "sharedTransactionMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "incrementTransactionCountForTransaction:", v5->_transactionId);

  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
