@implementation ASAuthorizationSingleSignOnRequest

- (ASAuthorizationSingleSignOnRequest)initWithProvider:(id)a3
{
  ASAuthorizationSingleSignOnRequest *v3;
  ASAuthorizationSingleSignOnRequest *v4;
  ASAuthorizationSingleSignOnRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASAuthorizationSingleSignOnRequest;
  v3 = -[ASAuthorizationRequest initWithProvider:](&v7, sel_initWithProvider_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_userInterfaceEnabled = 1;
    v3->_internalLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

- (NSArray)authorizationOptions
{
  os_unfair_lock_s *p_internalLock;
  NSArray *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_authorizationOptions;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAuthorizationOptions:(NSArray *)authorizationOptions
{
  NSArray *v4;
  NSArray *v5;

  v4 = authorizationOptions;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_authorizationOptions;
  self->_authorizationOptions = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (BOOL)isUserInterfaceEnabled
{
  ASAuthorizationSingleSignOnRequest *v2;
  os_unfair_lock_s *p_internalLock;

  v2 = self;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  LOBYTE(v2) = v2->_userInterfaceEnabled;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setUserInterfaceEnabled:(BOOL)userInterfaceEnabled
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_userInterfaceEnabled = userInterfaceEnabled;
  os_unfair_lock_unlock(p_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationOptions, 0);
}

@end
