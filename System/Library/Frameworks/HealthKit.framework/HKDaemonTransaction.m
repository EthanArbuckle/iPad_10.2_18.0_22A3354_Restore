@implementation HKDaemonTransaction

- (HKDaemonTransaction)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)_initWithName:(id)a3
{
  id v5;
  HKDaemonTransaction *v6;
  uint64_t v7;
  NSString *name;
  id v9;
  uint64_t v10;
  OS_os_transaction *transaction;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDaemonTransaction.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name.length > 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKDaemonTransaction;
  v6 = -[HKDaemonTransaction init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v7;

    objc_msgSend(CFSTR("com.apple.healthd."), "stringByAppendingString:", v5);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    v10 = os_transaction_create();
    transaction = v6->_transaction;
    v6->_transaction = (OS_os_transaction *)v10;

  }
  return v6;
}

- (void)dealloc
{
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 16);
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v6 = v4;
  _os_log_fault_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_FAULT, "%@ \"%@\" was not invalidated prior to deallocation", (uint8_t *)&v7, 0x16u);

}

+ (id)transactionWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:", v4);

  return v5;
}

+ (id)transactionWithOwner:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "_initWithName:", v7);

  return v8;
}

+ (id)transactionWithOwner:(id)a3 activityName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (objc_class *)objc_opt_class();

  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), v11, v6);

  v13 = (void *)objc_msgSend(v8, "_initWithName:", v12);
  return v13;
}

- (void)invalidate
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
