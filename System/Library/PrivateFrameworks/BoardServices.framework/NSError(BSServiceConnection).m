@implementation NSError(BSServiceConnection)

- (uint64_t)isBSServiceConnectionError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("BSServiceConnectionErrorDomain"));

  return v2;
}

@end
