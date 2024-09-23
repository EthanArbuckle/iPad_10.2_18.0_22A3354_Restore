@implementation LNConnectionOptions

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNConnectionOptions authenticationPolicy](self, "authenticationPolicy");
  v7 = CFSTR("Force Unlock");
  if (!v6)
    v7 = CFSTR("Default");
  v8 = v7;
  v9 = -[LNConnectionOptions initiatesAudioSession](self, "initiatesAudioSession");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, authenticationPolicy: %@, initiatesAudioSession: %@>"), v5, self, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)initiatesAudioSession
{
  return self->_initiatesAudioSession;
}

- (BOOL)isEqual:(id)a3
{
  LNConnectionOptions *v4;
  LNConnectionOptions *v5;
  LNConnectionOptions *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNConnectionOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNConnectionOptions authenticationPolicy](self, "authenticationPolicy");
      v8 = v7 == -[LNConnectionOptions authenticationPolicy](v6, "authenticationPolicy");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)newConnectionAction
{
  LNConnectionAction *v2;
  void *v3;
  LNConnectionAction *v4;

  v2 = [LNConnectionAction alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LNConnectionAction initWithIdentifier:metadataVersion:](v2, "initWithIdentifier:metadataVersion:", v3, objc_msgSend(MEMORY[0x1E0D43C10], "latestMetadataVersion"));

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAuthenticationPolicy:", -[LNConnectionOptions authenticationPolicy](self, "authenticationPolicy"));
  return v4;
}

- (void)setAuthenticationPolicy:(int64_t)a3
{
  self->_authenticationPolicy = a3;
}

- (void)setInitiatesAudioSession:(BOOL)a3
{
  self->_initiatesAudioSession = a3;
}

@end
