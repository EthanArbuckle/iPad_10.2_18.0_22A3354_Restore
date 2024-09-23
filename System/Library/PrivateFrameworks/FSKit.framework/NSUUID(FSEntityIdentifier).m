@implementation NSUUID(FSEntityIdentifier)

- (FSContainerIdentifier)fs_containerIdentifier
{
  return -[FSEntityIdentifier initWithUUID:]([FSContainerIdentifier alloc], "initWithUUID:", a1);
}

- (FSEntityIdentifier)fs_entityIdentifier
{
  return -[FSEntityIdentifier initWithUUID:]([FSEntityIdentifier alloc], "initWithUUID:", a1);
}

- (FSVolumeIdentifier)fs_volumeIdentifier
{
  return -[FSEntityIdentifier initWithUUID:]([FSVolumeIdentifier alloc], "initWithUUID:", a1);
}

@end
