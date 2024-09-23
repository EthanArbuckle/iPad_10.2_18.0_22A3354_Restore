@implementation CNReputationLogger

- (void)beginQueryForHandle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "queryLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "obfuscateHandle:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Determining trust of handle %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)queryForHandle:(id)a3 didFinishWithReputation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "queryLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "obfuscateHandle:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "describeScore:", objc_msgSend(v6, "score"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "Handle '%{public}@' has reputation: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)queryForHandle:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "queryLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "obfuscate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "Failed to look up handle '%{public}@': %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)timeToResolve:(double)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((id)objc_opt_class(), "performanceLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CNReputationLogger timeToResolve:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)coreRecentsConfirmedTrust
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "Handle is trusted by CoreRecents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)coreRecentsCouldNotConfirmTrust
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "CoreRecents could not confirm trust", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)couldNotQueryCoreRecentsWithError:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "queryLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CNReputationLogger couldNotQueryCoreRecentsWithError:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)contactsConfirmedTrustOfEmailAddress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "Handle is trusted by Contacts (email)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)contactsCouldNotConfirmTrustOfEmailAddress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "Contacts (email) could not confirm trust", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)couldNotQueryContactsForEmailAddressWithError:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "queryLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CNReputationLogger couldNotQueryContactsForEmailAddressWithError:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)contactsConfirmedTrustOfPhoneNumber
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "Handle is trusted by Contacts (phone number)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)contactsCouldNotConfirmTrustOfPhoneNumber
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "Contacts (phone number) could not confirm trust", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)couldNotQueryContactsForPhoneNumberWithError:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "queryLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CNReputationLogger couldNotQueryContactsForPhoneNumberWithError:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)reputationUnestablished
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "No source could establish a reputation for the handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (OS_os_log)queryLog
{
  if (queryLog_cn_once_token_14 != -1)
    dispatch_once(&queryLog_cn_once_token_14, &__block_literal_global_96);
  return (OS_os_log *)(id)queryLog_cn_once_object_14;
}

void __30__CNReputationLogger_queryLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.reputation", "query");
  v1 = (void *)queryLog_cn_once_object_14;
  queryLog_cn_once_object_14 = (uint64_t)v0;

}

+ (OS_os_log)performanceLog
{
  if (performanceLog_cn_once_token_15 != -1)
    dispatch_once(&performanceLog_cn_once_token_15, &__block_literal_global_3_9);
  return (OS_os_log *)(id)performanceLog_cn_once_object_15;
}

void __36__CNReputationLogger_performanceLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.reputation", "performance");
  v1 = (void *)performanceLog_cn_once_object_15;
  performanceLog_cn_once_object_15 = (uint64_t)v0;

}

+ (id)describeScore:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if ((unint64_t)a3 >= 3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("unknown (%@)"), v5);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_1E29FC358[a3];
  }
  return v3;
}

+ (id)obfuscateHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "obfuscate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)obfuscate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = obfuscate__cn_once_token_16;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&obfuscate__cn_once_token_16, &__block_literal_global_13_0);
  objc_msgSend(v4, "_cn_SHA256HashStringWithSalt:", obfuscate__cn_once_object_16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __32__CNReputationLogger_obfuscate___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)obfuscate__cn_once_object_16;
  obfuscate__cn_once_object_16 = v1;

}

- (void)timeToResolve:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, a1, a3, "Time to resolve: %.0fms", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)couldNotQueryCoreRecentsWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, a2, a3, "Could not query CoreRecents: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)couldNotQueryContactsForEmailAddressWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, a2, a3, "Could not query Contacts (email): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)couldNotQueryContactsForPhoneNumberWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, a2, a3, "Could not query Contacts (phone number): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
