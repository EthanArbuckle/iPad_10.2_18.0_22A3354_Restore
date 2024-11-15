@implementation FCCompletedPaymentTransaction

- (FCCompletedPaymentTransaction)initWithProductID:(id)a3 receipt:(id)a4 appleIDAccountDetails:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCCompletedPaymentTransaction *v12;
  FCCompletedPaymentTransaction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCCompletedPaymentTransaction;
  v12 = -[FCCompletedPaymentTransaction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_receipt, a4);
    objc_storeStrong((id *)&v13->_productID, a3);
    objc_storeStrong((id *)&v13->_appleIDAccountDetails, a5);
  }

  return v13;
}

- (NSString)receipt
{
  return self->_receipt;
}

- (NSString)productID
{
  return self->_productID;
}

- (FCPaymentTransactionAuthorizationResponse)appleIDAccountDetails
{
  return self->_appleIDAccountDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDAccountDetails, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
}

@end
