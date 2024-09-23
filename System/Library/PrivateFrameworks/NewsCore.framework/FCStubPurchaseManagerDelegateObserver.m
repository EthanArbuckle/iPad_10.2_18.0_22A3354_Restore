@implementation FCStubPurchaseManagerDelegateObserver

- (void)purchaseFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5 ongoingPurchaseEntry:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v14;

  v14 = a3;
  v10 = a5;
  v11 = a6;
  -[FCStubPurchaseManagerDelegateObserver failedBlock](self, "failedBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FCStubPurchaseManagerDelegateObserver failedBlock](self, "failedBlock");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, int64_t, id, id))v13)[2](v13, v14, a4, v10, v11);

  }
}

- (void)purchaseFailedForInvalidPurchaseReceiptWithProductID:(id)a3 ongoingPurchaseEntry:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[FCStubPurchaseManagerDelegateObserver failedWithInvalidReceiptBlock](self, "failedWithInvalidReceiptBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCStubPurchaseManagerDelegateObserver failedWithInvalidReceiptBlock](self, "failedWithInvalidReceiptBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)purchaseSuccessWithProductID:(id)a3 transaction:(id)a4 chargeCurrencyCode:(id)a5 ongoingPurchaseEntry:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[FCStubPurchaseManagerDelegateObserver successBlock](self, "successBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FCStubPurchaseManagerDelegateObserver successBlock](self, "successBlock");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receipt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, id, id))v14)[2](v14, v16, v15, v11, v12);

  }
}

- (id)successBlock
{
  return self->_successBlock;
}

- (void)setSuccessBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)failedBlock
{
  return self->_failedBlock;
}

- (void)setFailedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)failedWithInvalidReceiptBlock
{
  return self->_failedWithInvalidReceiptBlock;
}

- (void)setFailedWithInvalidReceiptBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failedWithInvalidReceiptBlock, 0);
  objc_storeStrong(&self->_failedBlock, 0);
  objc_storeStrong(&self->_successBlock, 0);
}

@end
