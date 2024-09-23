@implementation EDForceRecategorizationUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EDForceRecategorizationUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_31 != -1)
    dispatch_once(&log_onceToken_31, block);
  return (id)log_log_31;
}

void __41__EDForceRecategorizationUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_31;
  log_log_31 = (uint64_t)v1;

}

+ (BOOL)runWithConnection:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("message_global_data"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("model_category"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("model_subcategory"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("category_model_version"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("model_analytics"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E94E4700, CFSTR("model_high_impact"));
  LOBYTE(a4) = objc_msgSend(v5, "executeUpdateStatement:error:", v6, a4);

  return (char)a4;
}

@end
