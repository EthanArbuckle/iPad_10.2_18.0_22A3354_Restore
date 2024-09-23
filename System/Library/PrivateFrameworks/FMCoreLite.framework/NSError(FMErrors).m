@implementation NSError(FMErrors)

+ (uint64_t)fm_errorWithCode:()FMErrors
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FMErrorDomain"), a3, 0);
}

+ (uint64_t)fm_timeoutError
{
  return objc_msgSend(a1, "fm_errorWithCode:", 1);
}

+ (uint64_t)fm_cancelledError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
}

+ (uint64_t)fm_genericError
{
  return objc_msgSend(a1, "fm_errorWithCode:", 330669);
}

- (BOOL)fm_isTimeoutError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("FMErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)fm_isCancelledError
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

@end
