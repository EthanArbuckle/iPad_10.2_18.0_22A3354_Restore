@implementation ARMainDaemonConfiguration

- (ARMainDaemonConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARMainDaemonConfiguration;
  return -[ARMainDaemonConfiguration init](&v3, sel_init);
}

- (Class)controlClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLibraryDirectoryReadWriteAccess
{
  return 1;
}

- (BOOL)isInProcess
{
  return 0;
}

- (BOOL)supportsWatchdog
{
  return 1;
}

@end
