@implementation ACDDatabaseBackupActivity

+ (ACDDatabaseBackupActivity)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDDatabaseBackupActivity)init
{
  -[ACDDatabaseBackupActivity doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ACDDatabaseBackupActivity)initWithDatabase:(id)a3
{
  id v5;
  ACDDatabaseBackupActivity *v6;
  ACDDatabaseBackupActivity *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACDDatabaseBackupActivity;
  v6 = -[ACDDatabaseBackupActivity init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.accounts.databasebackup.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (id)activityCriteria
{
  OS_xpc_object *activityExecutionCriteria;
  OS_xpc_object *v4;
  OS_xpc_object *v5;

  activityExecutionCriteria = self->_activityExecutionCriteria;
  if (!activityExecutionCriteria)
  {
    v4 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    v5 = self->_activityExecutionCriteria;
    self->_activityExecutionCriteria = v4;

    xpc_dictionary_set_string(self->_activityExecutionCriteria, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
    xpc_dictionary_set_BOOL(self->_activityExecutionCriteria, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_int64(self->_activityExecutionCriteria, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC600]);
    xpc_dictionary_set_int64(self->_activityExecutionCriteria, (const char *)*MEMORY[0x24BDAC5B8], *MEMORY[0x24BDAC5F8]);
    activityExecutionCriteria = self->_activityExecutionCriteria;
  }
  return activityExecutionCriteria;
}

- (void)registerActivityIfNeeded
{
  -[ACDDatabaseBackupActivity _registerActivityIfNeededSchedulingBackup:](self, "_registerActivityIfNeededSchedulingBackup:", 0);
}

- (void)_registerActivityIfNeededSchedulingBackup:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke;
  v4[3] = &unk_24C7E34F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

void __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    _ACDLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(v2, "_registerActivitySchedulingBackup:", *(unsigned __int8 *)(a1 + 40));
    if (*(_BYTE *)(a1 + 40))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
}

- (void)_registerActivitySchedulingBackup:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "com.apple.accounts.databasebackup.activity";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"Registering activity %s (scheduling backup: %d)\", buf, 0x12u);
  }

  v6 = (void *)*MEMORY[0x24BDAC5A0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke;
  v7[3] = &unk_24C7E3520;
  v8 = v3;
  v7[4] = self;
  xpc_activity_register("com.apple.accounts.databasebackup.activity", v6, v7);
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  _xpc_activity_s *v13;
  id v14;
  uint8_t buf[16];

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (xpc_activity_set_state(v3, 4))
    {
      v9 = (void *)os_transaction_create();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(NSObject **)(v10 + 24);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2;
      block[3] = &unk_24C7E2248;
      block[4] = v10;
      v13 = v3;
      v14 = v9;
      v6 = v9;
      dispatch_async(v11, block);

    }
    else
    {
      _ACDLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_cold_1(v6);
    }
    goto LABEL_16;
  }
  if (!state)
  {
    _ACDLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"Checking in for accounts database backup activity\", buf, 2u);
    }

    if (*(_BYTE *)(a1 + 40))
    {
      v6 = xpc_activity_copy_criteria(v3);
      objc_msgSend(*(id *)(a1 + 32), "activityCriteria");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6 || !xpc_equal(v6, v7))
      {
        _ACDLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "\"Setting accounts database backup activity criteria\", buf, 2u);
        }

        xpc_activity_set_criteria(v3, v7);
      }

LABEL_16:
    }
  }

}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEFAULT, "\"Running accounts database backup activity\", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v3, "performBackupReturningError:", &v9);
  v5 = v9;

  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v11 = v8;
      _os_log_impl(&dword_20D8CB000, v7, OS_LOG_TYPE_DEFAULT, "\"Successfully backed up database: %{private}@\", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2_cold_1((uint64_t)v5, v7);
  }

  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;

}

- (void)scheduleBackup
{
  -[ACDDatabaseBackupActivity _registerActivityIfNeededSchedulingBackup:](self, "_registerActivityIfNeededSchedulingBackup:", 1);
}

- (void)scheduleBackupIfNonexistent
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "\"Accounts' database local backup file exists.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (ACDDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityExecutionCriteria, 0);
}

void __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "\"ACDDatabaseBackupActivity already has an xpc_activity pending\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"Couldn't set ACDDatabaseBackupActivity activity state to XPC_ACTIVITY_STATE_CONTINUE\", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_ERROR, "\"Failed to backup database, error: %@\", (uint8_t *)&v2, 0xCu);
}

@end
