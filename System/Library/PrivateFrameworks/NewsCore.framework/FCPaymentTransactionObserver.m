@implementation FCPaymentTransactionObserver

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    *(_QWORD *)&v9 = 138543618;
    v18 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          v16 = objc_opt_class();
          v17 = objc_msgSend(v13, "transactionState");
          *(_DWORD *)buf = v18;
          v24 = v16;
          v25 = 2048;
          v26 = v17;
          _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ transactionState: %lu", buf, 0x16u);

        }
        switch(objc_msgSend(v13, "transactionState", v18))
        {
          case 1:
          case 3:
            objc_msgSend(v6, "finishTransaction:", v13);
            -[FCPaymentTransactionObserver finishTransaction:](self, "finishTransaction:", v13);
            break;
          case 2:
            objc_msgSend(v6, "finishTransaction:", v13);
            goto LABEL_11;
          case 4:
LABEL_11:
            -[FCPaymentTransactionObserver failedTransaction:](self, "failedTransaction:", v13);
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v10);
  }

}

- (void)finishTransaction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_opt_class();
    objc_msgSend(v4, "payment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2048;
    v14 = v9;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ finish transaction with product identifier: %lu", (uint8_t *)&v11, 0x16u);

  }
  -[FCPaymentTransactionObserver delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentTransactionObserver:didFinishPurchaseTransaction:", self, v4);

}

- (void)failedTransaction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCPaymentTransactionObserver delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentTransactionObserver:didFailPurchaseTransactionWithTransaction:", self, v4);

}

- (FCPaymentTransactionObserverDelegate)delegate
{
  return (FCPaymentTransactionObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
