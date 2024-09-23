@implementation CLSNSOperationsManager

- (CLSNSOperationsManager)init
{
  CLSNSOperationsManager *v2;
  uint64_t v3;
  NSMutableArray *operations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSNSOperationsManager;
  v2 = -[CLSNSOperationsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    operations = v2->_operations;
    v2->_operations = (NSMutableArray *)v3;

    v2->_lock = 0;
  }
  return v2;
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

- (void)addOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSMutableArray *operations;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_addObject_(self->_operations, v7, (uint64_t)v4);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    operations = self->_operations;
    v12 = v8;
    v15 = 138412546;
    v16 = v4;
    v17 = 2048;
    v18 = objc_msgSend_count(operations, v13, v14);
    _os_log_impl(&dword_1D4054000, v12, OS_LOG_TYPE_DEFAULT, "CLSNSOperationsManager: Added operation: %@ [Pending count: %lu].", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend_unlock(self, v9, v10);

}

- (void)removeOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSMutableArray *operations;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (objc_msgSend_containsObject_(self->_operations, v7, (uint64_t)v4))
  {
    objc_msgSend_removeObject_(self->_operations, v8, (uint64_t)v4);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      operations = self->_operations;
      v13 = v9;
      *(_DWORD *)v21 = 138412546;
      *(_QWORD *)&v21[4] = v4;
      *(_WORD *)&v21[12] = 2048;
      *(_QWORD *)&v21[14] = objc_msgSend_count(operations, v14, v15);
      v16 = "CLSNSOperationsManager: Removed operation: %@ [Pending count: %lu].";
LABEL_10:
      _os_log_impl(&dword_1D4054000, v13, OS_LOG_TYPE_DEFAULT, v16, v21, 0x16u);

    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v17 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_operations;
      v13 = v17;
      *(_DWORD *)v21 = 138412546;
      *(_QWORD *)&v21[4] = v4;
      *(_WORD *)&v21[12] = 2048;
      *(_QWORD *)&v21[14] = objc_msgSend_count(v18, v19, v20);
      v16 = "CLSNSOperationsManager: Cannot remove unknown operation: %@ [Pending count: %lu].";
      goto LABEL_10;
    }
  }
  objc_msgSend_unlock(self, v10, v11, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);

}

- (unint64_t)count
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, v2);
  v6 = objc_msgSend_count(self->_operations, v4, v5);
  objc_msgSend_unlock(self, v7, v8);
  return v6;
}

- (void)performOperation:(id)a3 onOperationQueue:(id)a4 withTimeOut:(double)a5
{
  id v8;
  const char *v9;
  const char *v10;
  dispatch_time_t v11;
  qos_class_t v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  double v17;

  v8 = a3;
  objc_msgSend_addOperation_(a4, v9, (uint64_t)v8);
  objc_msgSend_addOperation_(self, v10, (uint64_t)v8);
  v11 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v12 = qos_class_self();
  dispatch_get_global_queue(v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4072EE8;
  block[3] = &unk_1E974A5E8;
  v17 = a5;
  block[4] = self;
  v16 = v8;
  v14 = v8;
  dispatch_after(v11, v13, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
