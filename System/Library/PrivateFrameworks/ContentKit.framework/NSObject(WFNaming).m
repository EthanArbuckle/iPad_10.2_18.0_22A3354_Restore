@implementation NSObject(WFNaming)

- (id)wfName
{
  void *v2;
  void *v3;

  +[WFObjectNameProvider sharedProvider](WFObjectNameProvider, "sharedProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameForObject:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
