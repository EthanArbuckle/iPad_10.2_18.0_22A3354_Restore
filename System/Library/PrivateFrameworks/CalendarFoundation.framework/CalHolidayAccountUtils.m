@implementation CalHolidayAccountUtils

+ (id)logHandle
{
  if (logHandle_onceToken_2 != -1)
    dispatch_once(&logHandle_onceToken_2, &__block_literal_global_24);
  return (id)logHandle_logHandle_2;
}

void __35__CalHolidayAccountUtils_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar", "HolidayAccountUtils");
  v1 = (void *)logHandle_logHandle_2;
  logHandle_logHandle_2 = (uint64_t)v0;

}

+ (BOOL)holidayCalendarIsEnabledWithAccountStore:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "_holidayAccountWithAccountStore:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_isEnabledWithAccount:", v4);

  return (char)v3;
}

+ (void)setHolidayCalendarIsEnabled:(BOOL)a3 withAccountStore:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  _BOOL4 v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_holidayAccountWithAccountStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_isEnabledWithAccount:", v7) != v4)
  {
    objc_msgSend(a1, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v4;
      _os_log_impl(&dword_18FC12000, v8, OS_LOG_TYPE_DEFAULT, "Setting holiday account to %{BOOL}d", buf, 8u);
    }

    if (!v7)
    {
      objc_msgSend(a1, "_createUnsavedHolidayAccountWithAccountStore:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "setEnabled:forDataclass:", v4, *MEMORY[0x1E0C8EE58]);
    v18 = 0;
    v9 = objc_msgSend(v6, "saveVerifiedAccount:error:", v7, &v18);
    v10 = v18;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v11, "postNotificationName:object:", CFSTR("CalHolidayAccountEnabledChanged"), 0);
    }
    else
    {
      objc_msgSend(a1, "logHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CalHolidayAccountUtils setHolidayCalendarIsEnabled:withAccountStore:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
}

+ (void)ensureHolidayAccountExistsWithAccountStore:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "_holidayAccountWithAccountStore:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(a1, "setHolidayCalendarIsEnabled:withAccountStore:", 1, v5);

}

+ (id)holidayAccountDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Holiday Calendar"), &stru_1E2A86598, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isEnabledWithAccount:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEnabledForDataclass:", *MEMORY[0x1E0C8EE58]);
  else
    return 0;
}

+ (id)_holidayAccountWithAccountStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0C8F0B0];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "accountsWithAccountTypeIdentifiers:error:", v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v18;
  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CalHolidayAccountUtils _holidayAccountWithAccountStore:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }

  return v9;
}

+ (id)_createUnsavedHolidayAccountWithAccountStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F0B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v4);
  objc_msgSend(a1, "holidayAccountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountDescription:", v6);

  objc_msgSend(v5, "setAuthenticationType:", *MEMORY[0x1E0C8F348]);
  objc_msgSend(v5, "setSupportsAuthentication:", 0);
  objc_msgSend(v5, "setVisible:", 0);
  objc_msgSend(a1, "logHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_18FC12000, v7, OS_LOG_TYPE_DEFAULT, "Creating holiday account with identifier %{public}@", (uint8_t *)&v10, 0xCu);

  }
  return v5;
}

+ (void)setHolidayCalendarIsEnabled:(uint64_t)a3 withAccountStore:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "Failed to save holiday account: %@", a5, a6, a7, a8, 2u);
}

+ (void)_holidayAccountWithAccountStore:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "Failed to get holiday account: %@", a5, a6, a7, a8, 2u);
}

@end
