@implementation LACExtractablePasswordPersistenceBuilder

+ (id)passwordPersistenceWithOptions:(id)a3
{
  id v3;
  LACExtractablePasswordPersistenceStandardAdapter *v4;

  v3 = a3;
  v4 = -[LACExtractablePasswordPersistenceStandardAdapter initWithOptions:]([LACExtractablePasswordPersistenceStandardAdapter alloc], "initWithOptions:", v3);

  return v4;
}

@end
