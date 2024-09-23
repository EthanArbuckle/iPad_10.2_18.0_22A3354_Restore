@implementation HMDPersonSettingsManagerDependencyFactory

- (HMDFileManager)fileManager
{
  return objc_alloc_init(HMDFileManager);
}

- (HMDPersistentStore)persistentStore
{
  return objc_alloc_init(HMDPersistentStore);
}

@end
