@implementation CNUICoreContactFetchRequestAccumulator

+ (id)resultOfFetchRequest:(id)a3 fromStore:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  char v25;
  id v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;

  v5 = a3;
  v6 = a4;
  if (v5)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_6 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_23);
  v7 = CNGuardOSLog_cn_once_object_0_6;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
  {
    +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    if (v6)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v6)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_6 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_23);
  v15 = CNGuardOSLog_cn_once_object_0_6;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
    +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __73__CNUICoreContactFetchRequestAccumulator_resultOfFetchRequest_fromStore___block_invoke;
  v32 = &unk_1EA603CB0;
  v24 = v23;
  v33 = v24;
  v25 = objc_msgSend(v6, "enumerateContactsWithFetchRequest:error:usingBlock:", v5, &v34, &v29);
  v26 = v34;
  if ((v25 & 1) == 0)
  {

    v24 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithValue:orError:", v24, v26, v29, v30, v31, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __73__CNUICoreContactFetchRequestAccumulator_resultOfFetchRequest_fromStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (void)resultOfFetchRequest:(uint64_t)a3 fromStore:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactStore’ must be nonnull", a5, a6, a7, a8, 0);
}

+ (void)resultOfFetchRequest:(uint64_t)a3 fromStore:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘fetchRequest’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
