@implementation _DOCNavigationButtonAXIdentifier

+ (id)idBase
{
  return CFSTR("DOC.navBarButton");
}

+ (NSString)backInHistory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("backInHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)forwardInHistory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("forwardInHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)historyMenuPrefix
{
  return (NSString *)CFSTR("DOC.historyMenuItem");
}

@end
