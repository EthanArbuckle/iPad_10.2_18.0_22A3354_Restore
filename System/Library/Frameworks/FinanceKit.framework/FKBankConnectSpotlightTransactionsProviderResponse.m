@implementation FKBankConnectSpotlightTransactionsProviderResponse

- (FKBankConnectSpotlightTransactionsProviderResponse)initWithTransaction:(id)a3 primaryAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  FKBankConnectSpotlightTransactionsProviderResponse *v8;
  uint64_t v9;
  FKPaymentTransaction *transaction;
  uint64_t v11;
  NSString *primaryAccountIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKBankConnectSpotlightTransactionsProviderResponse;
  v8 = -[FKBankConnectSpotlightTransactionsProviderResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    transaction = v8->_transaction;
    v8->_transaction = (FKPaymentTransaction *)v9;

    v11 = objc_msgSend(v7, "copy");
    primaryAccountIdentifier = v8->_primaryAccountIdentifier;
    v8->_primaryAccountIdentifier = (NSString *)v11;

  }
  return v8;
}

- (FKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
