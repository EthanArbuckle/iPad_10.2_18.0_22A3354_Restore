@implementation BLTTransaction

- (BLTTransaction)initWithDescription:(id)a3
{
  id v4;
  BLTTransaction *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTTransaction;
  v5 = -[BLTTransaction init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BLTTransaction: %@"), v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    v7 = (void *)os_transaction_create();
    -[BLTTransaction setOsTransaction:](v5, "setOsTransaction:", v7);

  }
  return v5;
}

+ (id)transactionWithDescription:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescription:", v4);

  return v5;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_osTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
}

@end
