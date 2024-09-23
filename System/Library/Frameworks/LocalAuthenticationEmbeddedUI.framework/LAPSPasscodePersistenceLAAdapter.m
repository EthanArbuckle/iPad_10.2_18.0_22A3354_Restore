@implementation LAPSPasscodePersistenceLAAdapter

- (BOOL)canRemovePasscode:(id *)a3
{
  id v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  _QWORD v17[4];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v15 = 0;
  objc_msgSend(v4, "canEvaluatePolicy:error:", 1, &v15);
  v5 = v15;
  if (objc_msgSend(v5, "code") == -7 || objc_msgSend(v5, "code") == -6)
  {
    LACLogPasscodeService();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_22FE91000, v6, OS_LOG_TYPE_DEFAULT, "canRemovePasscode: YES (%@)", buf, 0xCu);
    }
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "biometryType");
    NSLocalizedStringFromLACBiometryType();
    v6 = objc_claimAutoreleasedReturnValue();
    v16[0] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Biometry Enrolled (%@)"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v16[1] = *MEMORY[0x24BDD0FC8];
    +[LALocalizedString passcodeRemovalNotAllowedTitle:](LALocalizedString, "passcodeRemovalNotAllowedTitle:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    v16[2] = *MEMORY[0x24BDD0FF0];
    +[LALocalizedString passcodeRemovalNotAllowedText:](LALocalizedString, "passcodeRemovalNotAllowedText:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = CFSTR("LAPSInteractiveErrorKey");
    v17[2] = v10;
    v17[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAPSErrorBuilder errorWithCode:userInfo:](LAPSErrorBuilder, "errorWithCode:userInfo:", 8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = objc_retainAutorelease(v12);
    LACLogPasscodeService();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[LAPSPasscodePersistenceLAAdapter canRemovePasscode:].cold.1((uint64_t)v12, v13);

    v7 = 0;
  }

  return v7;
}

- (void)canRemovePasscode:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22FE91000, a2, OS_LOG_TYPE_ERROR, "canRemovePasscode: NO (%@)", (uint8_t *)&v2, 0xCu);
}

@end
