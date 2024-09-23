@implementation DNDSMutableStateProviderSystemSnapshot

- (void)setAssertions:(id)a3
{
  NSArray *v4;
  NSArray *assertions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  assertions = self->super._assertions;
  self->super._assertions = v4;

}

- (void)setActiveAssertionUUIDs:(id)a3
{
  NSArray *v4;
  NSArray *activeAssertionUUIDs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  activeAssertionUUIDs = self->super._activeAssertionUUIDs;
  self->super._activeAssertionUUIDs = v4;

}

- (void)setActiveDateIntervalByAssertionUUID:(id)a3
{
  NSDictionary *v4;
  NSDictionary *activeDateIntervalByAssertionUUID;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  activeDateIntervalByAssertionUUID = self->super._activeDateIntervalByAssertionUUID;
  self->super._activeDateIntervalByAssertionUUID = v4;

}

- (void)setInterruptionBehaviorSetting:(unint64_t)a3
{
  self->super._interruptionBehaviorSetting = a3;
}

- (void)setLostModeState:(unint64_t)a3
{
  self->super._lostModeState = a3;
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->super._lastUpdate, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSStateProviderSystemSnapshot _initWithSnapshot:]([DNDSStateProviderSystemSnapshot alloc], "_initWithSnapshot:", self);
}

@end
