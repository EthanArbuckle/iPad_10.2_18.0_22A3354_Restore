@implementation FLUtilities

+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v7, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("FollowUp"));
  objc_msgSend(v8, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  objc_msgSend(v8, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("637431"));
  objc_msgSend(v8, "addObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v8, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  objc_msgSend(v8, "addObject:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
  objc_msgSend(v8, "addObject:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v6);
  objc_msgSend(v8, "addObject:", v15);

  if (v19)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v19);
    objc_msgSend(v8, "addObject:", v16);

  }
  objc_msgSend(v7, "setQueryItems:", v8);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openURL:", v18);

}

+ (BOOL)launchPasswordResetForAppleID:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[FLUtilities launchPasswordResetForAppleID:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

+ (BOOL)launchPasswordChangeForAppleID:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[FLUtilities launchPasswordChangeForAppleID:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

+ (void)launchPasswordResetForAppleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8D53000, a1, a3, "Password reset notifications are not driven by FollowUp on iOS!", a5, a6, a7, a8, 0);
}

+ (void)launchPasswordChangeForAppleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8D53000, a1, a3, "Password change notifications are not driven by FollowUp on iOS!", a5, a6, a7, a8, 0);
}

@end
