@implementation EDAddMailboxSyncInfoUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDAddMailboxSyncInfoUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (id)log_log_5;
}

void __38__EDAddMailboxSyncInfoUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE mailboxes ADD COLUMN sync_info BLOB;",
         0,
         0,
         0);

  return v4;
}

@end
