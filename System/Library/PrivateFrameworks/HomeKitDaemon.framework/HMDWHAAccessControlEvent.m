@implementation HMDWHAAccessControlEvent

- (BOOL)isP2PEnabled
{
  return self->_isP2PEnabled;
}

- (void)setIsP2PEnabled:(BOOL)a3
{
  self->_isP2PEnabled = a3;
}

- (int)privilegeLevel
{
  return self->_privilegeLevel;
}

- (void)setPrivilegeLevel:(int)a3
{
  self->_privilegeLevel = a3;
}

- (BOOL)isPasswordSet
{
  return self->_isPasswordSet;
}

- (void)setIsPasswordSet:(BOOL)a3
{
  self->_isPasswordSet = a3;
}

+ (id)eventWithP2PEnabled:(BOOL)a3 privilegeLevel:(int64_t)a4 passwordSet:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  HMDWHAAccessControlEvent *v8;

  v5 = a5;
  v7 = a3;
  v8 = objc_alloc_init(HMDWHAAccessControlEvent);
  -[HMDWHAAccessControlEvent setIsP2PEnabled:](v8, "setIsP2PEnabled:", v7);
  -[HMDWHAAccessControlEvent setPrivilegeLevel:](v8, "setPrivilegeLevel:", +[HMDWHAAccessControlEvent awdUserPrivilegeFromHMUserPrivilege:](HMDWHAAccessControlEvent, "awdUserPrivilegeFromHMUserPrivilege:", a4));
  -[HMDWHAAccessControlEvent setIsPasswordSet:](v8, "setIsPasswordSet:", v5);
  return v8;
}

+ (int)awdUserPrivilegeFromHMUserPrivilege:(int64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = 1;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

@end
