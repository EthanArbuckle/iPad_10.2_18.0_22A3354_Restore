@implementation HDQueryServerClientState

- (HDQueryServerClientState)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDQueryServerClientState)initWithApplicationState:(unsigned int)a3
{
  HDQueryServerClientState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDQueryServerClientState;
  result = -[HDQueryServerClientState init](&v5, sel_init);
  if (result)
    result->_applicationState = a3;
  return result;
}

- (BOOL)isForeground
{
  return self->_applicationState == 8;
}

- (BOOL)isSuspended
{
  return self->_applicationState == 2;
}

- (BOOL)isBackgroundRunning
{
  return self->_applicationState == 4;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HDBKSApplicationStateString(self->_applicationState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDQueryServerClientState isForeground](self, "isForeground"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[HDQueryServerClientState isSuspended](self, "isSuspended"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: foreground=%@, suspended=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

@end
