@implementation BDSOSTransactionProvider

- (id)createTransactionWithName:(const char *)a3
{
  BDSOSTransaction *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = [BDSOSTransaction alloc];
  v9 = (void *)objc_msgSend_initWithTransactionName_(v5, v6, (uint64_t)a3, v7, v8);
  objc_msgSend_delegate(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_delegate(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDelegate_(v9, v20, (uint64_t)v19, v21, v22);

    objc_msgSend_delegate(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transactionDidBeginWithName_(v27, v28, (uint64_t)a3, v29, v30);

  }
  return v9;
}

- (BDSOSTransactionDelegate)delegate
{
  return (BDSOSTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
