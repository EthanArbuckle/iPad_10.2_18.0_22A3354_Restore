@implementation GDHomeManager

- (GDHomeManager)init
{
  GDHomeManager *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *homeUpdateSem;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  HMHomeManager *manager;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _PASLock *guardedData;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v21.receiver = self;
  v21.super_class = (Class)GDHomeManager;
  v2 = -[GDHomeManager init](&v21, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    homeUpdateSem = v2->_homeUpdateSem;
    v2->_homeUpdateSem = (OS_dispatch_semaphore *)v3;

    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v8 = (void *)qword_1EF6D0C40;
    v26 = qword_1EF6D0C40;
    if (!qword_1EF6D0C40)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = sub_1C1067ED4;
      v22[3] = &unk_1E7A49900;
      v22[4] = &v23;
      sub_1C1067ED4((uint64_t)v22, v5, v6, v7);
      v8 = (void *)v24[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v23, 8);
    v10 = objc_opt_new();
    manager = v2->_manager;
    v2->_manager = (HMHomeManager *)v10;

    objc_msgSend_setDelegate_(v2->_manager, v12, (uint64_t)v2, v13);
    v14 = objc_alloc(MEMORY[0x1E0D815F0]);
    v15 = (void *)objc_opt_new();
    v18 = objc_msgSend_initWithGuardedData_(v14, v16, (uint64_t)v15, v17);
    guardedData = v2->_guardedData;
    v2->_guardedData = (_PASLock *)v18;

  }
  return v2;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *guardedData;
  id v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GDConstructionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1C0771000, v5, OS_LOG_TYPE_DEFAULT, "GDHomeManager: homeManagerDidUpdateHomes called with %@", buf, 0xCu);
  }

  guardedData = self->_guardedData;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1C1067DD8;
  v10[3] = &unk_1E7A49870;
  v11 = v4;
  v7 = v4;
  objc_msgSend_runWithLockAcquired_(guardedData, v8, (uint64_t)v10, v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_homeUpdateSem);

}

- (NSArray)homes
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _PASLock *guardedData;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t v26[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  GDConstructionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C0771000, v3, OS_LOG_TYPE_DEFAULT, "GDHomeManager: homes called", buf, 2u);
  }

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_homeUpdateSem, 0xFFFFFFFFFFFFFFFFLL))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v15, (uint64_t)"void _PASWaitForeverForSemaphore(dispatch_semaphore_t  _Nonnull __strong)", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v14, v18, (uint64_t)v17, (uint64_t)CFSTR("_PASDispatchInline.h"), 39, CFSTR("Unexpected failure on unlimited dispatch_semaphore_wait()"));

  }
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = sub_1C1067D3C;
  v24 = sub_1C1067D4C;
  v25 = 0;
  guardedData = self->_guardedData;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1C1067D54;
  v19[3] = &unk_1E7A498D8;
  v19[4] = buf;
  objc_msgSend_runWithLockAcquired_(guardedData, v4, (uint64_t)v19, v6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend_count(*((void **)v21 + 5), v8, v9, v10);
    *(_DWORD *)v26 = 134217984;
    v27 = v11;
    _os_log_impl(&dword_1C0771000, v3, OS_LOG_TYPE_DEFAULT, "GDHomeManager: homes returning %tu homes", v26, 0xCu);
  }

  v12 = *((id *)v21 + 5);
  _Block_object_dispose(buf, 8);

  return (NSArray *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardedData, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_homeUpdateSem, 0);
}

@end
