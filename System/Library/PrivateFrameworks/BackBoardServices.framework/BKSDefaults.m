@implementation BKSDefaults

+ (id)localDefaults
{
  if (localDefaults___once != -1)
    dispatch_once(&localDefaults___once, &__block_literal_global_9826);
  return (id)localDefaults___instance;
}

+ (id)externalDefaults
{
  if (externalDefaults___once != -1)
    dispatch_once(&externalDefaults___once, &__block_literal_global_1_9824);
  return (id)externalDefaults___instance;
}

void __31__BKSDefaults_externalDefaults__block_invoke()
{
  BKSExternalDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(BKSExternalDefaults);
  v1 = (void *)externalDefaults___instance;
  externalDefaults___instance = (uint64_t)v0;

}

void __28__BKSDefaults_localDefaults__block_invoke()
{
  BKSLocalDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(BKSLocalDefaults);
  v1 = (void *)localDefaults___instance;
  localDefaults___instance = (uint64_t)v0;

}

@end
