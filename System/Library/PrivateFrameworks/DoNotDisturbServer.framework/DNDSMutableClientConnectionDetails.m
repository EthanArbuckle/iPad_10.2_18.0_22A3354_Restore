@implementation DNDSMutableClientConnectionDetails

- (void)setWantsStateUpdates:(BOOL)a3
{
  self->super._wantsStateUpdates = a3;
}

- (void)setInterruptionInvalidationAssertionUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *interruptionInvalidationAssertionUUID;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  interruptionInvalidationAssertionUUID = self->super._interruptionInvalidationAssertionUUID;
  self->super._interruptionInvalidationAssertionUUID = v4;

}

- (void)setAssertionUpdateClientIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *assertionUpdateClientIdentifiers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  assertionUpdateClientIdentifiers = self->super._assertionUpdateClientIdentifiers;
  self->super._assertionUpdateClientIdentifiers = v4;

}

- (void)setWantsSettingsUpdates:(BOOL)a3
{
  self->super._wantsSettingsUpdates = a3;
}

- (void)setWantsModeUpdates:(BOOL)a3
{
  self->super._wantsModeUpdates = a3;
}

- (void)setWantsActiveModeUpdates:(BOOL)a3
{
  self->super._wantsActiveModeUpdates = a3;
}

- (void)setActiveAssertionUpdateClientIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *activeAssertionUpdateClientIdentifiers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  activeAssertionUpdateClientIdentifiers = self->super._activeAssertionUpdateClientIdentifiers;
  self->super._activeAssertionUpdateClientIdentifiers = v4;

}

- (void)setWantsGlobalConfigurationUpdates:(BOOL)a3
{
  self->super._wantsGlobalConfigurationUpdates = a3;
}

- (void)setWantsMeDeviceStateUpdates:(BOOL)a3
{
  self->super._wantsMeDeviceStateUpdates = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSClientConnectionDetails _initWithDetails:]([DNDSClientConnectionDetails alloc], "_initWithDetails:", self);
}

@end
