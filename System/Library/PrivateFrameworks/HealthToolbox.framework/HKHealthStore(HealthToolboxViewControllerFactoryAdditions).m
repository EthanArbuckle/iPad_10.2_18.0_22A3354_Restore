@implementation HKHealthStore(HealthToolboxViewControllerFactoryAdditions)

- (id)viewControllerFactory
{
  return +[HBXViewControllerFactory sharedInstanceForHealthStore:](HBXViewControllerFactory, "sharedInstanceForHealthStore:", a1);
}

@end
