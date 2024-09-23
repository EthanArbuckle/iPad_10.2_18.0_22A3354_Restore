@implementation HMDSoftwareUpdateAutomaticUpdateToggledEvent

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (id)eventWithAutomaticUpdateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  HMDSoftwareUpdateAutomaticUpdateToggledEvent *v4;

  v3 = a3;
  v4 = objc_alloc_init(HMDSoftwareUpdateAutomaticUpdateToggledEvent);
  -[HMDSoftwareUpdateAutomaticUpdateToggledEvent setEnabled:](v4, "setEnabled:", v3);
  return v4;
}

@end
