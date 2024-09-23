@implementation AKPrivateEmailValidator

+ (BOOL)canPerformRequestWithAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "securityLevelForAccount:", v5) != 4)
  {
    _AKLogHme();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AKPrivateEmailValidator canPerformRequestWithAccount:error:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7070);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v10 = 0;
      *a4 = v19;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v6, "reachableEmailAddressesForAccount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (objc_msgSend(v6, "phoneAsAppleIDForAccount:", v5))
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    _AKLogHme();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[AKPrivateEmailValidator canPerformRequestWithAccount:error:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKPrivateEmailError"), -11007, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v10 = 1;
LABEL_17:

  return v10;
}

+ (void)canPerformRequestWithAccount:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Cannot perform HME request - Phone as AppleID Account without reachable emails", a5, a6, a7, a8, 0);
}

+ (void)canPerformRequestWithAccount:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Cannot perform HME request - Insufficient security level", a5, a6, a7, a8, 0);
}

@end
