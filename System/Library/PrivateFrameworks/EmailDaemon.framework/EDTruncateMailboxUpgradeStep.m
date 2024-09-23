@implementation EDTruncateMailboxUpgradeStep

void __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_2;
  v8[3] = &unk_1E949BCB8;
  v4 = v2;
  v9 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = (id)objc_msgSend(v3, "afterDelay:performBlock:", v8, 5.0);

}

+ (void)presentNeedlessAlertIfNecessaryWithPersistence:(id)a3
{
  id v4;
  _QWORD block[4];
  id v6;
  id v7;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke;
    block[3] = &unk_1E949B658;
    v6 = v4;
    v7 = a1;
    if (presentNeedlessAlertIfNecessaryWithPersistence__onceToken != -1)
      dispatch_once(&presentNeedlessAlertIfNecessaryWithPersistence__onceToken, block);

  }
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EDTruncateMailboxUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_93 != -1)
    dispatch_once(&log_onceToken_93, block);
  return (OS_os_log *)(id)log_log_93;
}

void __35__EDTruncateMailboxUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_93;
  log_log_93 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || (v5 = objc_msgSend(a1, "countOver10kWithConnection:", v4), v5 < 1))
  {
    v8 = 0;
  }
  else
  {
    +[EDTruncateMailboxUpgradeStep log](EDTruncateMailboxUpgradeStep, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[EDTruncateMailboxUpgradeStep runWithConnection:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInteger:forKey:", v5, CFSTR("_TruncateMailboxUpgradeStepOver10kCount"));

    v8 = 1;
  }

  return v8;
}

+ (int64_t)countOver10kWithConnection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT url, count() FROM messages m JOIN mailboxes mb ON (m.mailbox = mb.rowid) GROUP BY url;"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__EDTruncateMailboxUpgradeStep_countOver10kWithConnection___block_invoke;
  v16[3] = &unk_1E949ADD0;
  v18 = &v19;
  v6 = v4;
  v17 = v6;
  v15 = 0;
  v7 = objc_msgSend(v5, "executeUsingBlock:error:", v16, &v15);
  v8 = v15;

  if (v7)
  {
    +[EDTruncateMailboxUpgradeStep log](EDTruncateMailboxUpgradeStep, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v20[3];
      *(_DWORD *)buf = 134218242;
      v24 = v10;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Message counts over 10k: %lld, counts: %{public}@", buf, 0x16u);
    }

    v11 = v20[3];
  }
  else
  {
    +[EDTruncateMailboxUpgradeStep log](EDTruncateMailboxUpgradeStep, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDTruncateMailboxUpgradeStep countOver10kWithConnection:].cold.1(v13, buf, v12);
    }

    v11 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __59__EDTruncateMailboxUpgradeStep_countOver10kWithConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasPrefix:", CFSTR("imap://")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "integerValue") >= 10501)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v6, "integerValue");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
}

void __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "integerForKey:", CFSTR("_TruncateMailboxUpgradeStepOver10kCount"));
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("_TruncateMailboxUpgradeStepOver10kCount"));
  if (v2 >= 1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    objc_msgSend(*(id *)(a1 + 40), "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[EDTruncateMailboxUpgradeStep presentNeedlessAlertIfNecessaryWithPersistence:]_block_invoke_2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_3;
    v9[3] = &unk_1E949B778;
    v5 = *(_QWORD *)(a1 + 48);
    v9[4] = &v10;
    v9[5] = v5;
    objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v9);

    if (v11[3] > 0
      || objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", CFSTR("_TruncateMailboxUpgradeStepForceAlert")))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("_TruncateMailboxUpgradeStepForceAlert"));
      _EFLocalizedString();
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _EFLocalizedString();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _EFLocalizedString();
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFUserNotificationDisplayNotice(30.0, 3uLL, 0, 0, 0, v6, v7, v8);

    }
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "countOver10kWithConnection:", v3);

  return 1;
}

+ (void)runWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Wiping message DB", v1, 2u);
}

+ (void)countOver10kWithConnection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "failed to query for counts by mailbox: %{public}@", buf, 0xCu);

}

@end
