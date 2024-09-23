@implementation NSFileProviderKnownFolderLocation

- (NSFileProviderKnownFolderLocation)initWithParentItemIdentifier:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  FPKnownFolderPathMatchingLocation *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[FPKnownFolderPathMatchingLocation initWithParentItemIdentifier:filename:]([FPKnownFolderPathMatchingLocation alloc], "initWithParentItemIdentifier:filename:", v7, v6);

  return &v8->super;
}

- (NSFileProviderKnownFolderLocation)initWithExistingItemIdentifier:(id)a3
{
  id v4;
  FPKnownFolderExistingLocation *v5;

  v4 = a3;
  v5 = -[FPKnownFolderExistingLocation initWithExistingItemIdentifier:]([FPKnownFolderExistingLocation alloc], "initWithExistingItemIdentifier:", v4);

  return &v5->super;
}

- (id)asExistingLocation
{
  return 0;
}

- (id)asPathMatchingLocation
{
  return 0;
}

@end
