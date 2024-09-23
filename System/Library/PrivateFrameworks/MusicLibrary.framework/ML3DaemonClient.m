@implementation ML3DaemonClient

+ (ML3DaemonClient)sharedDaemonClient
{
  if (sharedDaemonClient___once != -1)
    dispatch_once(&sharedDaemonClient___once, &__block_literal_global_9972);
  return (ML3DaemonClient *)(id)sharedDaemonClient___sharedDaemonClient;
}

- (ML3DaemonClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ML3DaemonClient;
  return -[ML3Client initWithConnection:](&v3, sel_initWithConnection_, 0);
}

- (id)bundleID
{
  return CFSTR("com.apple.medialibraryd");
}

- (id)name
{
  return CFSTR("medialibraryd");
}

void __37__ML3DaemonClient_sharedDaemonClient__block_invoke()
{
  ML3DaemonClient *v0;
  void *v1;

  v0 = objc_alloc_init(ML3DaemonClient);
  v1 = (void *)sharedDaemonClient___sharedDaemonClient;
  sharedDaemonClient___sharedDaemonClient = (uint64_t)v0;

}

@end
