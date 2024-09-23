@implementation NPKPeerPaymentTransactionDetails

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NPKPeerPaymentTransactionDetails;
  -[NPKPeerPaymentTransactionDetails description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentTransactionDetails serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringWithNPKPeerPaymentStatus(-[NPKPeerPaymentTransactionDetails paymentStatus](self, "paymentStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentTransactionDetails availableActions](self, "availableActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentTransactionDetails transaction](self, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentTransactionDetails availableActionsFetchDate](self, "availableActionsFetchDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (service identifier %@ payment status %@ available actions %@ transaction %@ actionFetchDate:%@)"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (unint64_t)paymentStatus
{
  return self->_paymentStatus;
}

- (void)setPaymentStatus:(unint64_t)a3
{
  self->_paymentStatus = a3;
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
  objc_storeStrong((id *)&self->_availableActions, a3);
}

- (NSDate)availableActionsFetchDate
{
  return self->_availableActionsFetchDate;
}

- (void)setAvailableActionsFetchDate:(id)a3
{
  objc_storeStrong((id *)&self->_availableActionsFetchDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActionsFetchDate, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
