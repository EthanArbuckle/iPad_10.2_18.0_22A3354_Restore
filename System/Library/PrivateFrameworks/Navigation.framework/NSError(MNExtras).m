@implementation NSError(MNExtras)

+ (uint64_t)_navigation_errorWithCode:()MNExtras
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)_navigation_errorWithCode:()MNExtras debugDescription:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", a3, a4, 0);
}

+ (id)_navigation_errorWithCode:()MNExtras debugDescription:underlyingError:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2938]);
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNErrorDomain"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_navigation_errorWithCode:()MNExtras userInfo:
{
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNErrorDomain"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MNGetErrorsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "_navigation_errorCodeAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Navigation service error: %@ (%d)", (uint8_t *)&v9, 0x12u);

  }
  return v5;
}

- (const)_navigation_errorCodeAsString
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "code");
  if (v1 > 0x12)
    return CFSTR("MNErrorCode_MissingEntitlement");
  else
    return off_1E61D2AB8[v1];
}

@end
