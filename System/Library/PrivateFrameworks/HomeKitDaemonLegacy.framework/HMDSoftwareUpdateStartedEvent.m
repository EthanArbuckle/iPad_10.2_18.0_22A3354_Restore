@implementation HMDSoftwareUpdateStartedEvent

- (BOOL)isAutomaticUpdateEnabled
{
  return self->_automaticUpdateEnabled;
}

- (void)setAutomaticUpdateEnabled:(BOOL)a3
{
  self->_automaticUpdateEnabled = a3;
}

+ (id)eventUpdateStartedWithAutomaticUpdateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  HMDSoftwareUpdateStartedEvent *v4;

  v3 = a3;
  v4 = objc_alloc_init(HMDSoftwareUpdateStartedEvent);
  -[HMDSoftwareUpdateStartedEvent setAutomaticUpdateEnabled:](v4, "setAutomaticUpdateEnabled:", v3);
  return v4;
}

@end
