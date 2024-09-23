@implementation NSError(NAErrors)

- (BOOL)na_isCancelledError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v3 = objc_msgSend(a1, "code") == 3072;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)na_errorWithCode:()NAErrors
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NAErrorDomain"), a3, 0);
}

+ (uint64_t)na_timeoutError
{
  return objc_msgSend(a1, "na_errorWithCode:", 1);
}

+ (uint64_t)na_cancelledError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
}

+ (uint64_t)na_genericError
{
  return objc_msgSend(a1, "na_errorWithCode:", 330669);
}

- (BOOL)na_isTimeoutError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("NAErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 1;
  else
    v3 = 0;

  return v3;
}

@end
