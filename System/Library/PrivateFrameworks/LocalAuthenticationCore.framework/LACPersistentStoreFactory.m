@implementation LACPersistentStoreFactory

+ (id)makePersistentStoreWithSuiteName:(id)a3
{
  id v3;
  _TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore *v4;

  v3 = a3;
  v4 = -[LACUserDefaultsPersistentStore initWithSuiteName:]([_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore alloc], "initWithSuiteName:", v3);

  return v4;
}

@end
