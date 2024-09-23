@implementation DNDSMutableSyncSettings

- (void)setPairSyncEnabled:(BOOL)a3
{
  self->super._pairSyncEnabled = a3;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->super._cloudSyncEnabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSSyncSettings initWithPairSyncEnabled:cloudSyncEnabled:]([DNDSSyncSettings alloc], "initWithPairSyncEnabled:cloudSyncEnabled:", -[DNDSSyncSettings isPairSyncEnabled](self, "isPairSyncEnabled"), -[DNDSSyncSettings isCloudSyncEnabled](self, "isCloudSyncEnabled"));
}

@end
