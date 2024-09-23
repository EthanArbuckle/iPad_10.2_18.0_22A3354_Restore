@implementation IDSTransactionQueue

- (IDSTransactionQueue)init
{
  IDSTransactionQueue *v2;
  IDSTransactionQueue *v3;
  NSMutableArray *transactions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSTransactionQueue;
  v2 = -[IDSTransactionQueue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    transactions = v2->_transactions;
    v2->_transactions = 0;

    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)prependItem:(id)a3
{
  id v4;
  IDSTransactionQueueTransaction *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  v5 = [IDSTransactionQueueTransaction alloc];
  v10 = (id)objc_msgSend_initWithItem_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend__prependTransaction_(self, v8, (uint64_t)v10, v9);
}

- (void)appendItem:(id)a3
{
  id v4;
  IDSTransactionQueueTransaction *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  v5 = [IDSTransactionQueueTransaction alloc];
  v10 = (id)objc_msgSend_initWithItem_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend__appendTransaction_(self, v8, (uint64_t)v10, v9);
}

- (id)appendPendingItem:(id)a3
{
  id v4;
  IDSTransactionQueueTransaction *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = [IDSTransactionQueueTransaction alloc];
  v8 = (void *)objc_msgSend_initWithItem_readyToExecute_(v5, v6, (uint64_t)v4, v7, 0);

  objc_msgSend__appendTransaction_(self, v9, (uint64_t)v8, v10);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19B9A74A0;
  v14[3] = &unk_1E3C1FA08;
  v14[4] = self;
  v15 = v8;
  v11 = v8;
  v12 = _Block_copy(v14);

  return v12;
}

- (void)_prependTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_transactions(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_setTransactions_(self, v14, (uint64_t)v13, v15);

  }
  objc_msgSend_transactions(self, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_insertObject_atIndex_(v16, v17, (uint64_t)v5, v18, 0);

  os_unfair_lock_unlock(p_lock);
}

- (void)_appendTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_transactions(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_setTransactions_(self, v14, (uint64_t)v13, v15);

  }
  objc_msgSend_transactions(self, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v16, v17, (uint64_t)v5, v18);

  os_unfair_lock_unlock(p_lock);
}

- (void)_readyTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v4;
  const char *v5;
  double v6;

  p_lock = &self->_lock;
  v4 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_setReadyToExecute_(v4, v5, 1, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_transactions(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v9, v10, (uint64_t)v5, v11);

  objc_msgSend_transactions(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v15, v16, v17, v18);

  if (!v19)
    objc_msgSend_setTransactions_(self, v20, 0, v21);
  os_unfair_lock_unlock(p_lock);
}

- (void)executeReadyItemsWithBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  int v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  void (**v49)(id, void *);

  v49 = (void (**)(id, void *))a3;
  os_unfair_lock_lock(&self->_lock);
  while (1)
  {
    objc_msgSend_transactions(self, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_count(v7, v8, v9, v10))
      break;
    objc_msgSend_transactions(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_readyToExecute(v18, v19, v20, v21);

    if (!v22)
      goto LABEL_6;
    objc_msgSend_transactions(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_transactions(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFirstObject(v34, v35, v36, v37);

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend_item(v30, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2](v49, v41);

    os_unfair_lock_lock(&self->_lock);
  }

LABEL_6:
  objc_msgSend_transactions(self, v23, v24, v25);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_count(v42, v43, v44, v45);

  if (!v46)
    objc_msgSend_setTransactions_(self, v47, 0, v48);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end
