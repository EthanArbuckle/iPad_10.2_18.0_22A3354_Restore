@implementation MSPrimaryUserChangedEvent

- (MSPrimaryUserChangedEvent)initWithAccessory:(id)a3
{
  MSPrimaryUserChangedEvent *v3;
  MSPrimaryUserChangedEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSPrimaryUserChangedEvent;
  v3 = -[MSPrimaryUserChangedEvent init](&v6, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    -[MSPrimaryUserChangedEvent setIsAutomatic:](v3, "setIsAutomatic:", 0);
    -[MSPrimaryUserChangedEvent setChangedToHomeOwner:](v4, "setChangedToHomeOwner:", 0);
    -[MSPrimaryUserChangedEvent setChangedToUserNotInHome:](v4, "setChangedToUserNotInHome:", 0);
  }
  return v4;
}

- (BOOL)changedToHomeOwner
{
  return self->_changedToHomeOwner;
}

- (void)setChangedToHomeOwner:(BOOL)a3
{
  self->_changedToHomeOwner = a3;
}

- (BOOL)changedToUserNotInHome
{
  return self->_changedToUserNotInHome;
}

- (void)setChangedToUserNotInHome:(BOOL)a3
{
  self->_changedToUserNotInHome = a3;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (void)setIsAutomatic:(BOOL)a3
{
  self->_isAutomatic = a3;
}

@end
