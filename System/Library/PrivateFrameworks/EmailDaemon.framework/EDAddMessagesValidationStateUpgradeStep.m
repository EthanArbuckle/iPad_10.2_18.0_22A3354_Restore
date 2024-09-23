@implementation EDAddMessagesValidationStateUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EDAddMessagesValidationStateUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (id)log_log_6;
}

void __46__EDAddMessagesValidationStateUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  if (!objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("validation_state"), CFSTR("messages"), 0))
  {
    +[EDAddMessagesValidationStateUpgradeStep log](EDAddMessagesValidationStateUpgradeStep, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "validation_state column does not exist in messages table", v12, 2u);
    }

    goto LABEL_9;
  }
  +[EDAddMessagesValidationStateUpgradeStep log](EDAddMessagesValidationStateUpgradeStep, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Drop validation_state column in messages table", buf, 2u);
  }

  v5 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE messages DROP COLUMN validation_state;",
         0,
         0,
         0);
  if (!v5)
  {
LABEL_9:
    if ((objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("validation_state"), CFSTR("message_global_data"), 0) & 1) != 0)
    {
      +[EDAddMessagesValidationStateUpgradeStep log](EDAddMessagesValidationStateUpgradeStep, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "validation_state column already exists in message_global_data table", v10, 2u);
      }

      v5 = 0;
    }
    else
    {
      +[EDAddMessagesValidationStateUpgradeStep log](EDAddMessagesValidationStateUpgradeStep, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Add validation_state column in message_global_data table", v11, 2u);
      }

      v5 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN validation_state INTEGER NOT NULL DEFAULT 0;",
             0,
             0,
             0);
    }
  }

  return v5;
}

@end
