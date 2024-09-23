@implementation MROSTransaction

- (MROSTransaction)initWithName:(id)a3
{
  id v4;
  MROSTransaction *v5;
  id v6;
  uint64_t v7;
  OS_os_transaction *containedTransaction;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MROSTransaction;
  v5 = -[MROSTransaction init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "UTF8String");
    v7 = os_transaction_create();
    containedTransaction = v5->_containedTransaction;
    v5->_containedTransaction = (OS_os_transaction *)v7;

    objc_storeStrong((id *)&v5->_transactionName, v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionName, 0);
  objc_storeStrong((id *)&self->_containedTransaction, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %p %@>"), objc_opt_class(), self, self->_containedTransaction, self->_transactionName);
}

- (void)invalidateTransaction
{
  NSObject *v3;
  NSString *v4;
  NSString *transactionName;
  OS_os_transaction *containedTransaction;
  int v7;
  MROSTransaction *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[OS_Transaction] invalidating: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[NSString stringByAppendingString:](self->_transactionName, "stringByAppendingString:", CFSTR(" (invalidated)"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionName = self->_transactionName;
  self->_transactionName = v4;

  containedTransaction = self->_containedTransaction;
  self->_containedTransaction = 0;

}

- (NSString)transactionName
{
  return self->_transactionName;
}

@end
