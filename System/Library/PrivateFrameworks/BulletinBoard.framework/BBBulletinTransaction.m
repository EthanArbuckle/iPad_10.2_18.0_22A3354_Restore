@implementation BBBulletinTransaction

+ (id)transactionWithBulletinID:(id)a3
{
  id v3;
  BBBulletinTransaction *v4;

  v3 = a3;
  v4 = -[BBBulletinTransaction initWithBulletinID:]([BBBulletinTransaction alloc], "initWithBulletinID:", v3);

  return v4;
}

- (BBBulletinTransaction)initWithBulletinID:(id)a3
{
  id v4;
  BBBulletinTransaction *v5;
  uint64_t v6;
  NSString *bulletinID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBBulletinTransaction;
  v5 = -[BBBulletinTransaction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bulletinID = v5->_bulletinID;
    v5->_bulletinID = (NSString *)v6;

    v5->_transactionID = 1;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)BBBulletinTransaction;
  -[BBBulletinTransaction description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: bulletinID: %@; transactionID: %llu"),
    v4,
    self->_bulletinID,
    self->_transactionID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)incrementTransactionID
{
  unint64_t transactionID;
  unint64_t result;
  void *v6;

  transactionID = self->_transactionID;
  if (transactionID == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBObserverProxy.m"), 676, CFSTR("You sent NSUIntegerMax transactions to a single observer for bulletinID %@. You lose."), self->_bulletinID);

    transactionID = self->_transactionID;
  }
  result = transactionID + 1;
  self->_transactionID = transactionID + 1;
  return result;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinID, 0);
}

@end
