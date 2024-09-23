@implementation HKHealthStore(HKDisplayTypeControllerAccessorAdditions)

- (id)displayTypeController
{
  return +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", a1);
}

@end
