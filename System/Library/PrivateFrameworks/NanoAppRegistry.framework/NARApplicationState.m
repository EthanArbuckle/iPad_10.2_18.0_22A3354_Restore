@implementation NARApplicationState

- (NARApplicationState)initWithRestricted:(BOOL)a3 removedSystemApp:(BOOL)a4
{
  NARApplicationState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NARApplicationState;
  result = -[NARApplicationState init](&v7, sel_init);
  if (result)
  {
    result->_restricted = a3;
    result->_removedSystemApp = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 restricted;
  id v5;

  restricted = self->_restricted;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", restricted, CFSTR("restricted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_removedSystemApp, CFSTR("removedSystemApp"));

}

- (NARApplicationState)initWithCoder:(id)a3
{
  id v4;
  NARApplicationState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NARApplicationState;
  v5 = -[NARApplicationState init](&v7, sel_init);
  if (v5)
  {
    v5->_restricted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restricted"));
    v5->_removedSystemApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removedSystemApp"));
  }

  return v5;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isRemovedSystemApp
{
  return self->_removedSystemApp;
}

@end
