@implementation MKFCloudSyncMetadata

- (void)willSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKFCloudSyncMetadata;
  -[MKFCloudSyncMetadata willSave](&v3, sel_willSave);
  if ((-[MKFCloudSyncMetadata unique](self, "unique") & 1) == 0)
    -[MKFCloudSyncMetadata setUnique:](self, "setUnique:", 1);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("CloudSyncMetadata"));
}

@end
