@implementation FFSubscription

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  abort();
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  abort();
}

+ (id)mergeSubscriptions:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (id)encodeToDictionary
{
  abort();
}

+ (id)decodeFromDictionary:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (id)nameOfClass
{
  abort();
}

- (FFSubscription)init
{
  -[FFSubscription initPrivate](self, "initPrivate");
  abort();
}

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FFSubscription;
  return -[FFSubscription init](&v3, sel_init);
}

@end
