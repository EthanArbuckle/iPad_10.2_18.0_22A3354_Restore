@implementation LAAuthorizationError

+ (id)resourceNotFound
{
  return (id)objc_msgSend(a1, "resourceNotFoundWithMessage:", CFSTR("Resource not found"));
}

+ (id)resourceNotFoundWithMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[LAAuthorizationError resourceNotFoundWithUserInfo:]((uint64_t)a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)resourceNotFoundWithUserInfo:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:userInfo:", -1019, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)resourceNotFoundWithUnderylingError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[LAAuthorizationError resourceNotFoundWithUserInfo:]((uint64_t)a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isResourceNotFoundError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.LocalAuthentication")))
    v5 = objc_msgSend(v3, "code") == -1019;
  else
    v5 = 0;

  return v5;
}

+ (id)genericErrorWithMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[LAAuthorizationError genericErrorWithUserInfo:]((uint64_t)a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)genericErrorWithUserInfo:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:userInfo:", -1008, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)genericErrorWithStatus:(int)a3
{
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)SecCopyErrorMessageString(a3, 0);
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2F90];
  v12 = *MEMORY[0x1E0CB2938];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[LAAuthorizationError genericErrorWithUnderlyingError:]((uint64_t)a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)genericErrorWithUnderlyingError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[LAAuthorizationError genericErrorWithUserInfo:](v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)missingImplementation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CC1310];
  v6 = *MEMORY[0x1E0CB2938];
  v7[0] = CFSTR("Missing Implementation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithCode:userInfo:", -1000, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
