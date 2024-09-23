@implementation APConfigurationStorage

- (APConfigurationStorage)init
{
  APConfigurationStorage *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  APUnfairLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APConfigurationStorage;
  v2 = -[APConfigurationStorage init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v5 = objc_msgSend_initWithOptions_(v3, v4, 1);
    lock = v2->_lock;
    v2->_lock = (APUnfairLock *)v5;

  }
  return v2;
}

- (BOOL)resetConfigurationSystem
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235C39000, v3, OS_LOG_TYPE_DEFAULT, "Reset Configuration System: Process started.", buf, 2u);
  }

  objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_lock(self, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v9, v10, v11);
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_fileExistsAtPath_(v14, v15, (uint64_t)v8)
      && (v26 = 0,
          objc_msgSend_removeItemAtPath_error_(v14, v16, (uint64_t)v8, &v26),
          (v18 = v26) != 0))
    {
      v19 = v18;
      objc_msgSend_unlock(v9, v16, v17);
      APLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_description(v19, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_235C39000, v20, OS_LOG_TYPE_ERROR, "Reset Configuration System: Could not remove current configuration, error: %{public}@.", buf, 0xCu);

      }
      v24 = 0;
    }
    else
    {
      objc_msgSend_unlock(v9, v16, v17);
      APLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235C39000, v19, OS_LOG_TYPE_DEFAULT, "Reset Configuration System: Process completed.", buf, 2u);
      }
      v24 = 1;
    }

  }
  else
  {
    APLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235C39000, v9, OS_LOG_TYPE_ERROR, "Reset Configuration System: Error, path to config is nil.", buf, 2u);
    }
    v24 = 0;
  }

  return v24;
}

- (BOOL)updateConfigurationSystemWithData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  APConfigurationResponseHandler *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char v16;
  const char *v17;
  const char *v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9);
  v10 = objc_alloc_init(APConfigurationResponseHandler);
  objc_msgSend_setResponseHandler_(self, v11, (uint64_t)v10);

  objc_msgSend_responseHandler(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_processResponseWithData_(v14, v15, (uint64_t)v4);

  objc_msgSend_setResponseHandler_(self, v17, 0);
  objc_msgSend_unlock(v7, v18, v19);

  return v16;
}

- (void)cancelConfigurationUpdate
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;

  objc_msgSend_responseHandler(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend_cancelProcess(v3, v4, v5);
    v3 = v6;
  }

}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (APConfigurationResponseHandler)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
