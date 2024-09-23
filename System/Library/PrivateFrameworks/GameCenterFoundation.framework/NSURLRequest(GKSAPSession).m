@implementation NSURLRequest(GKSAPSession)

- (id)_gkSAPSession
{
  return objc_getAssociatedObject(a1, CFSTR("SAPSession"));
}

- (void)_gkSetSAPSession:()GKSAPSession
{
  objc_setAssociatedObject(a1, CFSTR("SAPSession"), a3, (void *)1);
}

@end
