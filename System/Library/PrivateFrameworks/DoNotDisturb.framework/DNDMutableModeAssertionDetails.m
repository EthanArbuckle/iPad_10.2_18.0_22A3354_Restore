@implementation DNDMutableModeAssertionDetails

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setModeIdentifier:(id)a3
{
  uint64_t v4;
  __CFString *v5;
  id v6;

  v4 = objc_msgSend(a3, "copy");
  v6 = (id)v4;
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("com.apple.donotdisturb.mode.default");
  objc_storeStrong((id *)&self->super._modeIdentifier, v5);

}

- (void)setModeConfigurationModifiedDate:(id)a3
{
  NSDate *v4;
  NSDate *modeConfigurationModifiedDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  modeConfigurationModifiedDate = self->super._modeConfigurationModifiedDate;
  self->super._modeConfigurationModifiedDate = v4;

}

- (void)setLifetime:(id)a3
{
  DNDModeAssertionLifetime *v4;
  DNDModeAssertionLifetime *lifetime;

  v4 = (DNDModeAssertionLifetime *)objc_msgSend(a3, "copy");
  lifetime = self->super._lifetime;
  self->super._lifetime = v4;

}

- (void)setReason:(unint64_t)a3
{
  self->super._reason = a3;
}

- (void)setUserVisibleEndDate:(id)a3
{
  NSDate *v4;
  NSDate *userVisibleEndDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  userVisibleEndDate = self->super._userVisibleEndDate;
  self->super._userVisibleEndDate = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDModeAssertionDetails _initWithDetails:]([DNDModeAssertionDetails alloc], "_initWithDetails:", self);
}

@end
