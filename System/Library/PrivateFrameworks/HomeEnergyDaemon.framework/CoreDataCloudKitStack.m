@implementation CoreDataCloudKitStack

- (void)handlePersistentCloudKitContainerEventChanged:(id)a3
{
  sub_23E641D7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *, uint64_t))sub_23E6400BC);
}

- (void)storeRemoteChange:(id)a3
{
  sub_23E641D7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *, uint64_t))sub_23E641310);
}

@end
