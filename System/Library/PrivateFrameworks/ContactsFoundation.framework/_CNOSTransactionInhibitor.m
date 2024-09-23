@implementation _CNOSTransactionInhibitor

- (void)stop
{
  OS_os_transaction *transaction;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CNOSTransactionInhibitor;
  -[CNInhibitor stop](&v4, sel_stop);
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)start
{
  id v3;
  OS_os_transaction *v4;
  OS_os_transaction *transaction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CNOSTransactionInhibitor;
  -[CNInhibitor start](&v6, sel_start);
  -[_CNOSTransactionInhibitor label](self, "label");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  v4 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v4;

}

- (NSString)label
{
  return self->_label;
}

- (_CNOSTransactionInhibitor)initWithLabel:(id)a3
{
  id v4;
  _CNOSTransactionInhibitor *v5;
  uint64_t v6;
  NSString *label;
  OS_os_transaction *transaction;
  _CNOSTransactionInhibitor *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNOSTransactionInhibitor;
  v5 = -[_CNOSTransactionInhibitor init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

    transaction = v5->_transaction;
    v5->_transaction = 0;

    v9 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

@end
