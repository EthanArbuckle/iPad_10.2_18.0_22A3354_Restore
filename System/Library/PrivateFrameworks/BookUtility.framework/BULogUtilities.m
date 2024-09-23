@implementation BULogUtilities

- (BOOL)buVerboseLoggingEnabled
{
  return self->_buVerboseLoggingEnabled;
}

- (BOOL)verboseLoggingEnabled
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E47B24;
  v5[3] = &unk_24CED9AC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E4A130;
  block[3] = &unk_24CED9980;
  block[4] = a1;
  if (qword_253DB24D8 != -1)
    dispatch_once(&qword_253DB24D8, block);
  return (id)qword_253DB24D0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int isEqualToString;
  NSObject *accessQueue;
  _QWORD v27[5];
  char v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  v10 = objc_opt_class();
  objc_msgSend_objectForKeyedSubscript_(v8, v11, *MEMORY[0x24BDD0E70]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_BOOLValue(v13, v14, v15);

  BookUtilityLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_keyPath(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v20;
    v31 = 1024;
    v32 = v16;
    _os_log_impl(&dword_212E45000, v17, OS_LOG_TYPE_DEFAULT, "BULogUtilities: Received change for keypath %@:%{BOOL}d", buf, 0x12u);

  }
  objc_msgSend_keyPath(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v9, v24, (uint64_t)v23);

  if (isEqualToString)
  {
    accessQueue = self->_accessQueue;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_212E49C3C;
    v27[3] = &unk_24CEDA0B0;
    v27[4] = self;
    v28 = v16;
    dispatch_barrier_sync(accessQueue, v27);
  }
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_keyPath, a3);
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void)setBuVerboseLoggingEnabled:(BOOL)a3
{
  self->_buVerboseLoggingEnabled = a3;
}

- (void)observeDefaults
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;

  objc_msgSend_defaults(self, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyPath(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_forKeyPath_options_context_(v8, v7, (uint64_t)self, v6, 5, 0);

}

- (BULogUtilities)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  BULogUtilities *v9;

  objc_msgSend_books(BUAppGroup, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userDefaults(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (BULogUtilities *)objc_msgSend_initWithUserDefaults_keyPath_(self, v8, (uint64_t)v7, CFSTR("buVerboseLoggingEnabled"));
  return v9;
}

- (BULogUtilities)initWithUserDefaults:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  BULogUtilities *v8;
  const char *v9;
  BULogUtilities *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *accessQueue;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BULogUtilities;
  v8 = -[BULogUtilities init](&v30, sel_init);
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setDefaults_(v8, v9, (uint64_t)v6);
    objc_msgSend_setKeyPath_(v10, v11, (uint64_t)v7);
    objc_msgSend_defaults(v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_BOOLForKey_(v14, v15, (uint64_t)v7);
    objc_msgSend_setBuVerboseLoggingEnabled_(v10, v17, v16);

    v18 = dispatch_queue_create("BULogUtilities.access", MEMORY[0x24BDAC9C0]);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v18;

    objc_msgSend_observeDefaults(v10, v20, v21);
    BookUtilityLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_keyPath(v10, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_buVerboseLoggingEnabled(v10, v26, v27);
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 1024;
      v34 = v28;
      _os_log_impl(&dword_212E45000, v22, OS_LOG_TYPE_DEFAULT, "BULogUtilities: Init with %@:%{BOOL}d", buf, 0x12u);

    }
  }

  return v10;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  objc_msgSend_defaults(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyPath(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_forKeyPath_(v4, v8, (uint64_t)self, v7);

  v9.receiver = self;
  v9.super_class = (Class)BULogUtilities;
  -[BULogUtilities dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
