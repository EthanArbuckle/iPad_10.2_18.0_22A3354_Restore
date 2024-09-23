@implementation NSDictionary(ASDTIOA2Config)

- (uint64_t)asdtExclavesInputBufferName
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("ExclavesInputBufferName"));
}

- (uint64_t)asdtIsolatedInputUseCaseID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("IsolatedInputUseCaseID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedLongLongValue");

  return v2;
}

@end
