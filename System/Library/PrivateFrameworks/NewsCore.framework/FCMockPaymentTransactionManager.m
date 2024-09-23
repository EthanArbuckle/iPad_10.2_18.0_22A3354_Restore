@implementation FCMockPaymentTransactionManager

+ (id)mockPaymentTransactionWithSuccessForProductID:(id)a3
{
  id v3;
  FCMockPaymentTransactionManager *v4;

  v3 = a3;
  v4 = objc_alloc_init(FCMockPaymentTransactionManager);
  -[FCMockPaymentTransactionManager setProductID:](v4, "setProductID:", v3);

  -[FCMockPaymentTransactionManager setTransactionExpectation:](v4, "setTransactionExpectation:", 0);
  return v4;
}

+ (id)mockPaymentTransactionWithFailForProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5
{
  id v7;
  id v8;
  FCMockPaymentTransactionManager *v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(FCMockPaymentTransactionManager);
  -[FCMockPaymentTransactionManager setProductID:](v9, "setProductID:", v8);

  -[FCMockPaymentTransactionManager setTransactionState:](v9, "setTransactionState:", a4);
  -[FCMockPaymentTransactionManager setTransactionError:](v9, "setTransactionError:", v7);

  -[FCMockPaymentTransactionManager setTransactionExpectation:](v9, "setTransactionExpectation:", 1);
  return v9;
}

- (BOOL)canMakePayments
{
  return 1;
}

- (void)startPurchaseWithTagID:(id)a3 productID:(id)a4 purchaseID:(id)a5 bundleID:(id)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8 price:(id)a9 webAccessOptIn:(BOOL)a10 payment:(id)a11
{
  void *v12;
  int64_t v13;
  void *v14;
  FCCompletedPaymentTransaction *v15;
  void *v16;
  FCCompletedPaymentTransaction *v17;

  if (-[FCMockPaymentTransactionManager transactionExpectation](self, "transactionExpectation", a3, a4, a5, a6, a7, a8))
  {
    if (-[FCMockPaymentTransactionManager transactionExpectation](self, "transactionExpectation") != 1)
      return;
    -[FCMockPaymentTransactionManager delegate](self, "delegate");
    v17 = (FCCompletedPaymentTransaction *)objc_claimAutoreleasedReturnValue();
    -[FCMockPaymentTransactionManager productID](self, "productID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCMockPaymentTransactionManager transactionState](self, "transactionState");
    -[FCMockPaymentTransactionManager transactionError](self, "transactionError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCompletedPaymentTransaction transactionFailedWithProductID:transactionState:transactionError:](v17, "transactionFailedWithProductID:transactionState:transactionError:", v12, v13, v14);

  }
  else
  {
    v15 = [FCCompletedPaymentTransaction alloc];
    -[FCMockPaymentTransactionManager productID](self, "productID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCCompletedPaymentTransaction initWithProductID:receipt:appleIDAccountDetails:](v15, "initWithProductID:receipt:appleIDAccountDetails:", v16, 0, 0);

    -[FCMockPaymentTransactionManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionPurchased:", v17);
  }

}

- (FCPaymentTransactionManagerDelegate)delegate
{
  return (FCPaymentTransactionManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)transactionState
{
  return self->_transactionState;
}

- (void)setTransactionState:(int64_t)a3
{
  self->_transactionState = a3;
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void)setTransactionError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)transactionExpectation
{
  return self->_transactionExpectation;
}

- (void)setTransactionExpectation:(unint64_t)a3
{
  self->_transactionExpectation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
