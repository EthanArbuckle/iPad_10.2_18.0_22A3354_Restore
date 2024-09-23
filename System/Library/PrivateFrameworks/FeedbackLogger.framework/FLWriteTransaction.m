@implementation FLWriteTransaction

- (FLWriteTransaction)init
{
  FLWriteTransaction *v2;
  FLWriteTransaction *v3;
  uint64_t v4;
  OS_os_log *log;
  uint64_t v6;
  OS_os_transaction *transaction;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  RBSAssertion *rbsAssertion;
  RBSAssertion *v14;
  id v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)FLWriteTransaction;
  v2 = -[FLWriteTransaction init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    flLogForObject(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    v6 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v6;

    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D87C98]);
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithExplanation:target:attributes:", CFSTR("FLLogger"), v8, v11);
    rbsAssertion = v3->_rbsAssertion;
    v3->_rbsAssertion = (RBSAssertion *)v12;

    v14 = v3->_rbsAssertion;
    v20 = 0;
    -[RBSAssertion acquireWithError:](v14, "acquireWithError:", &v20);
    v15 = v20;
    if (v15)
    {
      v16 = v3->_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = v16;
        objc_msgSend(v15, "localizedDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_error_impl(&dword_1B512E000, v18, OS_LOG_TYPE_ERROR, "Error acquiring write assertion: %@.", buf, 0xCu);

      }
    }

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSAssertion invalidate](self->_rbsAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FLWriteTransaction;
  -[FLWriteTransaction dealloc](&v3, sel_dealloc);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (RBSAssertion)rbsAssertion
{
  return self->_rbsAssertion;
}

- (void)setRbsAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_rbsAssertion, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
