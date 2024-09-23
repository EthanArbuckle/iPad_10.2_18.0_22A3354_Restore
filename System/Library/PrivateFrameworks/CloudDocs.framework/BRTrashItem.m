@implementation BRTrashItem

- (NSString)itemIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CAABC8];
}

- (NSString)parentItemIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CAABA8];
}

- (NSString)filename
{
  return (NSString *)CFSTR(".Trash");
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
}

- (NSFileProviderItemVersion)itemVersion
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CAAD08]);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v2, "initWithContentVersion:metadataVersion:", v3, v4);

  return (NSFileProviderItemVersion *)v5;
}

- (unint64_t)capabilities
{
  if (BRIsFPFSEnabled(self, a2))
    return 3;
  else
    return 67;
}

- (unint64_t)fileSystemFlags
{
  return 14;
}

@end
