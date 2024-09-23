@implementation ELSEvent

+ (void)createLoggingEventWith:(id)a3
{
  +[ELSEvent createLoggingEventWith:postfix:](ELSEvent, "createLoggingEventWith:postfix:", a3, 0);
}

+ (void)createLoggingEventWith:(id)a3 postfix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (createLoggingEventWith_postfix__onceToken != -1)
    dispatch_once(&createLoggingEventWith_postfix__onceToken, &__block_literal_global_3);
  +[ELSManager sharedManager](ELSManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[ELSEnvironment sharedInstance](ELSEnvironment, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudKitContainerIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:", v12);
    objc_msgSend(v13, "publicCloudDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(CFSTR(":"), "stringByAppendingString:", v7);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &stru_24D173D38;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:", CFSTR("EnhancedLoggingEvent"));
    objc_msgSend(a1, "sessionData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("session"));

    objc_msgSend(v6, "stringByAppendingString:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("event"));

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("capturedAt"));

    v20 = objc_alloc(MEMORY[0x24BDB9158]);
    v23[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithRecordsToSave:recordIDsToDelete:", v21, 0);

    objc_msgSend(v22, "setPerRecordSaveBlock:", &__block_literal_global_14);
    objc_msgSend(v14, "addOperation:", v22);

  }
  else
  {
    ELSLogHandleForCategory(11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ELSEvent createLoggingEventWith:postfix:].cold.1(v12);
  }

}

uint64_t __43__ELSEvent_createLoggingEventWith_postfix___block_invoke()
{
  return +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement](ELSEntitlementUtilities, "assertCurrentProcessHasEntitlement");
}

void __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  ELSLogHandleForCategory(11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_12_cold_2((uint64_t)v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_12_cold_1((uint64_t)v5, v8);
  }

}

+ (id)sessionData
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  +[ELSManager sharedManager](ELSManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = CFSTR("sessionKey");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v5 = CFSTR("enrollmentTicketNumber");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentTicketNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v5 = CFSTR("gigafilesToken");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gigafilesToken"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        v5 = CFSTR("not-found");
    }
  }
  v9 = v5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@:"), v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  else
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("not-found"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (void)createLoggingEventWith:(os_log_t)log postfix:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2141BF000, log, OS_LOG_TYPE_ERROR, "Error: Unable to create logging event when ELS snapshot metadata is nil", v1, 2u);
}

void __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2141BF000, a2, OS_LOG_TYPE_DEBUG, "Saved enhancedLoggingEventRecord: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_12_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2141BF000, a2, OS_LOG_TYPE_ERROR, "Error saving enhancedLoggingEventRecord: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
