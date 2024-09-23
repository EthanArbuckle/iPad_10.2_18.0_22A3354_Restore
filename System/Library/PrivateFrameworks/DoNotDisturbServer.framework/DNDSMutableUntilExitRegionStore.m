@implementation DNDSMutableUntilExitRegionStore

- (void)setActiveLifetimeAssertionUUIDs:(id)a3
{
  NSArray *v4;
  NSArray *activeLifetimeAssertionUUIDs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  activeLifetimeAssertionUUIDs = self->super._activeLifetimeAssertionUUIDs;
  self->super._activeLifetimeAssertionUUIDs = v4;

}

- (void)setHasActiveLifetimes:(id)a3
{
  objc_storeStrong((id *)&self->super._hasActiveLifetimes, a3);
}

- (void)setCurrentRegion:(id)a3
{
  CLRegion *v4;
  CLRegion *currentRegion;

  v4 = (CLRegion *)objc_msgSend(a3, "copy");
  currentRegion = self->super._currentRegion;
  self->super._currentRegion = v4;

}

- (void)setRegionEntered:(id)a3
{
  objc_storeStrong((id *)&self->super._regionEntered, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSUntilExitRegionStore _initWithStore:]([DNDSUntilExitRegionStore alloc], "_initWithStore:", self);
}

@end
