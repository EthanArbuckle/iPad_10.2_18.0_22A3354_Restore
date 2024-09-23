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
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v4, v5))
  {
    -[DATransaction transactionId](self, "transactionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1C1CD1000, v4, v5, "DATransaction exiting, ID: %@", buf, 0xCu);

  }
  v7.receiver = self;
  v7.super_class = (Class)DATransaction;
  -[DATransaction dealloc](&v7, sel_dealloc);
}

- (DATransaction)init
{
  DATransaction *v2;
  uint64_t v3;
  NSString *transactionId;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DATransaction;
  v2 = -[DATransaction init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "da_newGUID");
    v3 = objc_claimAutoreleasedReturnValue();
    transactionId = v2->_transactionId;
    v2->_transactionId = (NSString *)v3;

    objc_storeStrong((id *)&v2->_label, v2->_transactionId);
    +[DATransactionMonitor sharedTransactionMonitor](DATransactionMonitor, "sharedTransactionMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "incrementTransactionCountForTransaction:", v2->_transactionId);

  }
  return v2;
}

- (DATransaction)initWithLabel:(id)a3
{
  id v5;
  DATransaction *v6;
  DATransaction *v7;

  v5 = a3;
  v6 = -[DATransaction init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_label, a3);

  return v7;
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
}

@end
