@implementation CRKCloudTuple

- (CRKCloudTuple)initWithChangedObject:(id)a3 originalObject:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKCloudTuple;
  return -[CRKCloudTuple init](&v5, sel_init, a3, a4);
}

- (id)originalObject
{
  return 0;
}

- (id)changedObject
{
  return 0;
}

@end
