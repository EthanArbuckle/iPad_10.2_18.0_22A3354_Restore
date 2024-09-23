@implementation ASAuthorizationAppleIDRequest

- (ASAuthorizationAppleIDRequest)init
{
  ASAuthorizationAppleIDRequest *v2;
  ASAuthorizationAppleIDRequest *v3;
  ASAuthorizationAppleIDRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASAuthorizationAppleIDRequest;
  v2 = -[ASAuthorizationOpenIDRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_internalLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSString)user
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_user;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setUser:(NSString *)user
{
  NSString *v4;
  NSString *v5;

  v4 = user;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_user;
  self->_user = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
}

@end
