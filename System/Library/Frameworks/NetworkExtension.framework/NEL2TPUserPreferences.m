@implementation NEL2TPUserPreferences

- (NEL2TPUserPreferences)initWithConfiguration:(id)a3
{
  id v4;
  NEL2TPUserPreferences *v5;
  SCNetworkConnectionRef v6;
  uint64_t v7;
  NSString *identifier;
  NEL2TPUserPreferences *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEL2TPUserPreferences;
  v5 = -[NEL2TPUserPreferences init](&v11, sel_init);
  if (v5)
  {
    v6 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)NEL2TPUserPreferences, v4);
    v5->_userPrefs = (__SCUserPreferencesRef *)SCNetworkConnectionCreateUserPreferences();
    CFRelease(v6);
    if (!v5->_userPrefs)
    {
      v9 = 0;
      goto LABEL_6;
    }
    SCUserPreferencesGetUniqueID();
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  NEL2TPUserPreferences *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (NEL2TPUserPreferences *)self->_userPrefs;
  CFRelease(self);
  v3.receiver = v2;
  v3.super_class = (Class)NEL2TPUserPreferences;
  -[NEL2TPUserPreferences dealloc](&v3, sel_dealloc);
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  -[NEL2TPUserPreferences name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[NEL2TPUserPreferences name](self, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        v8))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v4, "addObject:", CFSTR("L2TP user preferences has no name"));
    v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NEVPNProtocolL2TP)settings
{
  return (NEVPNProtocolL2TP *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)isForced
{
  return self->_forced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (SCNetworkConnectionRef)createConnectionForConfiguration:(uint64_t)a1
{
  id v2;
  void *v3;
  __CFString *v4;
  SCNetworkConnectionRef v5;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "UUIDString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = SCNetworkConnectionCreateWithServiceID((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0, 0);
  return v5;
}

+ (void)clearCurrentForConfiguration:(uint64_t)a1
{
  id v2;
  SCNetworkConnectionRef v3;
  const void *UserPreferences;

  v2 = a2;
  objc_opt_self();
  v3 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)NEL2TPUserPreferences, v2);

  UserPreferences = (const void *)SCNetworkConnectionCreateUserPreferences();
  SCUserPreferencesSetCurrent();
  SCUserPreferencesRemove();
  CFRelease(UserPreferences);
  CFRelease(v3);
}

@end
