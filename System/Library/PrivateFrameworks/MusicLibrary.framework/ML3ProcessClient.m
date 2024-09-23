@implementation ML3ProcessClient

- (ML3ProcessClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ML3ProcessClient;
  return -[ML3Client initWithConnection:](&v3, sel_initWithConnection_, 0);
}

- (id)bundleID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)name
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (ML3ProcessClient)sharedProcessClient
{
  if (sharedProcessClient___once != -1)
    dispatch_once(&sharedProcessClient___once, &__block_literal_global_253);
  return (ML3ProcessClient *)(id)sharedProcessClient___sharedProcessClient;
}

void __39__ML3ProcessClient_sharedProcessClient__block_invoke()
{
  ML3ProcessClient *v0;
  void *v1;

  v0 = objc_alloc_init(ML3ProcessClient);
  v1 = (void *)sharedProcessClient___sharedProcessClient;
  sharedProcessClient___sharedProcessClient = (uint64_t)v0;

}

@end
