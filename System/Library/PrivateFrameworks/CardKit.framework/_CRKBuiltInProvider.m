@implementation _CRKBuiltInProvider

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cardkit");
}

- (id)cardViewControllerForCard:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[CRKCardViewController _initWithCard:delegate:loadBundles:loadProvidersImmediately:]([CRKCardViewController alloc], "_initWithCard:delegate:loadBundles:loadProvidersImmediately:", v3, 0, 0, 0);

  return v4;
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return 0;
}

@end
