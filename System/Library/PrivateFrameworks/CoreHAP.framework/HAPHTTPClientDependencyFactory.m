@implementation HAPHTTPClientDependencyFactory

- (id)createHTTPClientWithQueue:(id)a3
{
  id v3;
  HAPCoreUtilsHTTPClient *v4;

  v3 = a3;
  v4 = -[HAPCoreUtilsHTTPClient initWithQueue:]([HAPCoreUtilsHTTPClient alloc], "initWithQueue:", v3);

  return v4;
}

@end
