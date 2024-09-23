@implementation DKNotableUserDataWallet

- (DKNotableUserDataWallet)initWithContext:(id)a3 localCards:(id)a4
{
  id v7;
  id v8;
  DKNotableUserDataWallet *v9;
  DKNotableUserDataWallet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKNotableUserDataWallet;
  v9 = -[DKNotableUserDataWallet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentProvisioningContext, a3);
    objc_storeStrong((id *)&v10->_localPaymentCards, a4);
  }

  return v10;
}

- (NSArray)walletCards
{
  void *v2;
  void *v3;

  -[DKNotableUserDataWallet paymentProvisioningContext](self, "paymentProvisioningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupAssistantCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)passSnapshotForCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKNotableUserDataWallet paymentProvisioningContext](self, "paymentProvisioningContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passSnapshotForCredential:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)localPaymentCards
{
  return self->_localPaymentCards;
}

- (void)setLocalPaymentCards:(id)a3
{
  objc_storeStrong((id *)&self->_localPaymentCards, a3);
}

- (PKPaymentSetupAssistantProvisioningContext)paymentProvisioningContext
{
  return self->_paymentProvisioningContext;
}

- (void)setPaymentProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_paymentProvisioningContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentProvisioningContext, 0);
  objc_storeStrong((id *)&self->_localPaymentCards, 0);
}

@end
