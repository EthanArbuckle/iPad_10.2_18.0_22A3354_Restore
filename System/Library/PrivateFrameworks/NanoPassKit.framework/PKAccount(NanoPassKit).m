@implementation PKAccount(NanoPassKit)

- (uint64_t)npkShouldShowSavingsAccountInfo
{
  unint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t result;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "state");
  if (v2 > 5)
    return 0;
  if (((1 << v2) & 0x31) != 0)
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    result = 0;
    if (v4)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_opt_class();
        v8 = v7;
        objc_msgSend(a1, "state");
        PKAccountStateToString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v7;
        v20 = 2112;
        v21 = v9;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %@ account in %@ state. Should show savings: %@", (uint8_t *)&v18, 0x20u);

      }
LABEL_6:

      return 0;
    }
  }
  else if (((1 << v2) & 6) != 0
         || (objc_msgSend(a1, "supportsOneTimeDeposit") & 1) != 0
         || (objc_msgSend(a1, "supportsOneTimeWithdrawal") & 1) != 0)
  {
    return 1;
  }
  else
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    result = 0;
    if (v12)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        objc_msgSend(a1, "state");
        PKAccountStateToString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "supportsOneTimeDeposit");
        NSStringFromBOOL();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "supportsOneTimeWithdrawal");
        NSStringFromBOOL();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138413058;
        v19 = v13;
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v17;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %@ account in %@ state, supports one time deposit %@, supports one time withdrawal %@.", (uint8_t *)&v18, 0x2Au);

      }
      goto LABEL_6;
    }
  }
  return result;
}

@end
