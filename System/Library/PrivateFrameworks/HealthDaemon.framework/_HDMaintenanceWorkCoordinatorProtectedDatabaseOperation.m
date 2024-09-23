@implementation _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation

- (_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation)initWithName:(id)a3 database:(id)a4 operationBlock:(id)a5
{
  return -[_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation initWithName:database:operationBlock:canceledBlock:](self, "initWithName:database:operationBlock:canceledBlock:", a3, a4, a5, 0);
}

- (_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation)initWithName:(id)a3 database:(id)a4 operationBlock:(id)a5 canceledBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *v14;
  _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *v15;
  uint64_t v16;
  id operationBlock;
  void *v18;
  id canceledBlock;
  uint64_t v20;
  id v21;
  HDAssertion *accessibilityAssertion;
  NSObject *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation;
  v14 = -[HDMaintenanceOperation initWithName:](&v26, sel_initWithName_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_database, a4);
    v16 = objc_msgSend(v12, "copy");
    operationBlock = v15->_operationBlock;
    v15->_operationBlock = (id)v16;

    v18 = _Block_copy(v13);
    canceledBlock = v15->_canceledBlock;
    v15->_canceledBlock = v18;

    v25 = 0;
    objc_msgSend(v11, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v10, &v25, 600.0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v25;
    accessibilityAssertion = v15->_accessibilityAssertion;
    v15->_accessibilityAssertion = (HDAssertion *)v20;

    if (!v15->_accessibilityAssertion)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error taking accessibility assertion: %{public}@", buf, 0x16u);
      }

    }
  }

  return v15;
}

- (void)dealloc
{
  HDAssertion *accessibilityAssertion;
  HDDaemonTransaction *transaction;
  objc_super v5;

  -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  accessibilityAssertion = self->_accessibilityAssertion;
  self->_accessibilityAssertion = 0;

  -[HKDaemonTransaction invalidate](self->_transaction, "invalidate");
  transaction = self->_transaction;
  self->_transaction = 0;

  v5.receiver = self;
  v5.super_class = (Class)_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation;
  -[_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation dealloc](&v5, sel_dealloc);
}

- (void)cancel
{
  void (**canceledBlock)(id, _QWORD *);
  _QWORD v4[5];

  canceledBlock = (void (**)(id, _QWORD *))self->_canceledBlock;
  if (canceledBlock)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_cancel__block_invoke;
    v4[3] = &unk_1E6CE80E8;
    v4[4] = self;
    canceledBlock[2](canceledBlock, v4);
  }
  else
  {
    -[HDMaintenanceOperation finish]((uint64_t)self);
  }
}

- (void)main
{
  HDDaemonTransaction *v3;
  HDDaemonTransaction *transaction;
  uint64_t v5;
  void *v6;
  void *v7;
  HDDatabase *database;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD aBlock[5];
  uint8_t buf[4];
  _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[HKDaemonTransaction transactionWithOwner:](HDDaemonTransaction, "transactionWithOwner:", self);
  v3 = (HDDaemonTransaction *)objc_claimAutoreleasedReturnValue();
  transaction = self->_transaction;
  self->_transaction = v3;

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke;
  aBlock[3] = &unk_1E6CE80E8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  +[HDDatabaseTransactionContext contextForAccessibilityAssertion:](HDDatabaseTransactionContext, "contextForAccessibilityAssertion:", self->_accessibilityAssertion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v15 = 0;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke_2;
  v13[3] = &unk_1E6CFC8B8;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  LOBYTE(v5) = -[HDDatabase performWithTransactionContext:error:block:](database, "performWithTransactionContext:error:block:", v7, &v15, v13);
  v10 = v15;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v10;
      _os_log_fault_impl(&dword_1B7802000, v11, OS_LOG_TYPE_FAULT, "%{public}@ Error performing initial transaction context: %{public}@", buf, 0x16u);
    }

    (*((void (**)(id, HDDatabase *, _QWORD, id, uint64_t))self->_operationBlock + 2))(self->_operationBlock, self->_database, 0, v9, v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_storeStrong(&self->_operationBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
