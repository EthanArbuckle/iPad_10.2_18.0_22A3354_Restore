@implementation EDUpdateOthersCategoryTypeUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EDUpdateOthersCategoryTypeUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_95 != -1)
    dispatch_once(&log_onceToken_95, block);
  return (id)log_log_95;
}

void __44__EDUpdateOthersCategoryTypeUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_95;
  log_log_95 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("model_category"), CFSTR("message_global_data"), 0))
  {
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "UPDATE message_global_data SET model_category = 2 where model_subcategory == 6;",
           0,
           0,
           0);
  }
  else
  {
    +[EDUpdateOthersCategoryTypeUpgradeStep log](EDUpdateOthersCategoryTypeUpgradeStep, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "model_category column does not exist in message_global_data table", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

@end
