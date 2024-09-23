@implementation AFError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D50]);
  if (v8)
    objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x1E0CB3388]);
  v11 = (void *)MEMORY[0x1E0CB35C8];
  if (objc_msgSend(v10, "count"))
    v12 = v10;
  else
    v12 = 0;
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingErrors:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") > 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v10 = v12;
    if (v8)
      objc_msgSend(v12, "setObject:forKey:", v8, *MEMORY[0x1E0CB2D50]);
    if (v9)
    {
      v13 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("SiriUnderlyingErrors"));

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), a3, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "errorWithCode:description:underlyingError:", a3, v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;

  return v14;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:description:underlyingError:", a3, a4, 0);
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:description:", a3, 0);
}

+ (id)new
{
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AFError.m"), 57, CFSTR("AFError is not designed to be instantiated."));

  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_FAULT))
  {
    v7 = 136315394;
    v8 = "+[AFError new]";
    v9 = 2080;
    v10 = "+[AFError new]";
    _os_log_fault_impl(&dword_19AF50000, v5, OS_LOG_TYPE_FAULT, "%s %s is not available, as AFError is not designed to be instantiated. Returning nil.", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (AFError)init
{
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFError.m"), 65, CFSTR("AFError is not designed to be instantiated."));

  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_FAULT))
  {
    v7 = 136315394;
    v8 = "-[AFError init]";
    v9 = 2080;
    v10 = "-[AFError init]";
    _os_log_fault_impl(&dword_19AF50000, v5, OS_LOG_TYPE_FAULT, "%s %s is not available, as AFError is not designed to be instantiated. Returning nil.", (uint8_t *)&v7, 0x16u);
  }

  return 0;
}

@end
