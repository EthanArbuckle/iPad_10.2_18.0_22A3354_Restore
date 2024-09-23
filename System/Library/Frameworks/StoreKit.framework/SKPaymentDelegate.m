@implementation SKPaymentDelegate

- (SKPaymentDelegate)initWithQueue:(id)a3 transactionUUID:(id)a4
{
  id v6;
  id v7;
  SKPaymentDelegate *v8;
  SKPaymentDelegate *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[SKPaymentDelegate init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_paymentQueue, v6);
    objc_storeStrong((id *)&v9->_transactionUUID, a4);
  }

  return v9;
}

- (void)shouldContinueTransactionWithNewStorefront:(id)a3 replyBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  SKPaymentQueue **p_paymentQueue;
  id WeakRetained;
  NSString *v10;
  NSString *transactionUUID;
  void *v12;
  id v13;
  __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  p_paymentQueue = &self->_paymentQueue;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentQueue);
  if (WeakRetained && (v10 = self->_transactionUUID, WeakRetained, v10))
  {
    transactionUUID = self->_transactionUUID;
    v14 = CFSTR("uuid");
    v15[0] = transactionUUID;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)p_paymentQueue);
    objc_msgSend(v13, "shouldContinueTransaction:withNewStorefront:replyBlock:", v12, v6, v7);

  }
  else
  {
    v7[2](v7, 1);
  }

}

- (void)handleEngagementRequest:(id)a3 replyBlock:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;

  v5 = (void (**)(id, _QWORD, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SKPaymentDelegate handleEngagementRequest:replyBlock:].cold.1((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paymentQueue);
  objc_storeStrong((id *)&self->_transactionUUID, 0);
}

- (void)handleEngagementRequest:(uint64_t)a1 replyBlock:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Engagement request not handled.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
