@implementation NSError(HMBShareOperation)

- (BOOL)hmbIsRetryShareOperationError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("HMBShareOperationErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 1;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)hmbRetryShareOperationError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("HMBShareOperationErrorDomain"), 1, 0);
}

@end
