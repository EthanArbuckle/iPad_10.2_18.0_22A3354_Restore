@implementation SOErrorHelper

+ (id)silentInternalErrorWithMessage:(id)a3
{
  return +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -1000, a3);
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 moreInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D50]);
  if (v8)
    objc_msgSend(v10, "addEntriesFromDictionary:", v8);
  +[SOErrorHelper errorWithCode:userInfo:](SOErrorHelper, "errorWithCode:userInfo:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AppSSO.AuthorizationError"), a3, a4);
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  return +[SOErrorHelper errorWithCode:message:moreInfo:](SOErrorHelper, "errorWithCode:message:moreInfo:", a3, a4, 0);
}

+ (id)errorWithCode:(int64_t)a3
{
  return +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", a3, 0);
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 suberror:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0CB3388];
  v14[0] = a5;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOErrorHelper errorWithCode:message:moreInfo:](SOErrorHelper, "errorWithCode:message:moreInfo:", a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 message:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("Subcode");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOErrorHelper errorWithCode:message:moreInfo:](SOErrorHelper, "errorWithCode:message:moreInfo:", a3, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)internalErrorWithMessage:(id)a3
{
  void *v3;
  NSObject *v4;

  +[SOErrorHelper silentInternalErrorWithMessage:](SOErrorHelper, "silentInternalErrorWithMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOErrorHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper internalErrorWithMessage:].cold.1();

  return v3;
}

+ (id)parameterErrorWithMessage:(id)a3
{
  void *v3;
  NSObject *v4;

  +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -9, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOErrorHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper internalErrorWithMessage:].cold.1();

  return v3;
}

+ (id)missingEntitlementError:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Caller is missing the required '%@' entitlement."), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -11, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOErrorHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper internalErrorWithMessage:].cold.1();

  return v4;
}

+ (id)invalidURLError:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -9, CFSTR("not AppSSO URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOErrorHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper invalidURLError:].cold.1(v3, v5);

  return v4;
}

+ (id)doNotHandleBreakingRecursionWithCallerBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("breaking calling recursion for caller with bundleIdentifier: %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOErrorHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper internalErrorWithMessage:].cold.1();

  return v4;
}

+ (id)deniedBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("denied caller with bundleIdentifier: %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOErrorHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper internalErrorWithMessage:].cold.1();

  return v4;
}

+ (id)errorNotSupported
{
  void *v2;
  NSObject *v3;

  +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("This call is not supported on iOS."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOErrorHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[SOErrorHelper internalErrorWithMessage:].cold.1();

  return v2;
}

+ (void)raiseExceptionOnError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AppSSO.AuthorizationError"));

    if (v6 && objc_msgSend(v4, "code") == -9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v4);
    SO_LOG_SOErrorHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SOErrorHelper raiseExceptionOnError:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected error: %@"), v4);
  }

}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.AppSSO.AuthorizationError")))
    v7 = objc_msgSend(v5, "code") == a4;
  else
    v7 = 0;

  return v7;
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Subcode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.AppSSO.AuthorizationError")))
  {
    v11 = 0;
    if (objc_msgSend(v7, "code") == a4 && v9)
      v11 = objc_msgSend(v9, "integerValue") == a5;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)internalErrorWithMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)invalidURLError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 141558275;
  v5 = 1752392040;
  v6 = 2117;
  v7 = v3;
  _os_log_error_impl(&dword_1CF39B000, a2, OS_LOG_TYPE_ERROR, "not AppSSO URL: %{sensitive, mask.hash}@", (uint8_t *)&v4, 0x16u);

}

+ (void)raiseExceptionOnError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "Raising exception due to error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
