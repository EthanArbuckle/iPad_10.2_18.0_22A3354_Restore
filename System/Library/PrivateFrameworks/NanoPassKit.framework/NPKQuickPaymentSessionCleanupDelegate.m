@implementation NPKQuickPaymentSessionCleanupDelegate

- (void)paymentSession:(id)a3 didCompleteTransactionForReason:(unint64_t)a4 withTransactionContext:(id)a5 shouldCleanupSession:(BOOL)a6
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "transaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transitHistory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "paymentPass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = 67109890;
      v16[1] = a4;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Cleanup delegate got session complete for reason %d with transaction %@ and transit history %@ for unique ID %@", (uint8_t *)v16, 0x26u);

    }
  }
  if (a4 == 3)
    -[NPKQuickPaymentSessionCleanupDelegate _saveTransactionFromContext:](self, "_saveTransactionFromContext:", v8);

}

- (void)_saveTransactionFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v3 = objc_alloc_init(MEMORY[0x24BE6ED30]);
  objc_msgSend(v12, "transaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v12, "transaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v5, v7, v8, 0);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v12, "transitHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "transitHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expressState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v5, v6, v7, v10, v11);

    goto LABEL_5;
  }
LABEL_6:

}

@end
