@implementation _CDErrorUtilities

+ (id)transformErrorForNSSecureCoding:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "code");
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v4;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isCoreDataFatalError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C979C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(&unk_1E272BF98, "containsObject:", v4);
  return (char)v3;
}

+ (BOOL)isCoreDataTemporaryError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C979C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(&unk_1E272BFB0, "containsObject:", v4);
  return (char)v3;
}

+ (void)simulateCrashWithDescription:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[_CDErrorUtilities simulateCrashWithDescription:].cold.1((uint64_t)a3);
}

+ (void)simulateCrashWithDescription:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Simulating crash. Reason: %@", (uint8_t *)&v1, 0xCu);
}

@end
