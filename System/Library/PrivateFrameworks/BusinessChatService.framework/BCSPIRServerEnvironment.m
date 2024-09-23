@implementation BCSPIRServerEnvironment

- (BCSPIRServerEnvironment)initWithUserDefaults:(id)a3 isInternalInstall:(BOOL)a4 type:(int64_t)a5 serverType:(int64_t)a6
{
  id v11;
  BCSPIRServerEnvironment *v12;
  BCSPIRServerEnvironment *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCSPIRServerEnvironment;
  v12 = -[BCSPIRServerEnvironment init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    v13->_isInternalInstall = a4;
    v13->_type = a5;
    v13->_serverType = a6;
  }

  return v13;
}

- (NSString)pirUseCase
{
  int64_t v3;
  __CFString *v4;
  __CFString **v5;
  int64_t v6;
  __CFString *v7;
  int64_t v8;
  __CFString **v9;
  int64_t v10;

  if (!-[BCSPIRServerEnvironment isInternalInstall](self, "isInternalInstall"))
    goto LABEL_10;
  v3 = -[BCSPIRServerEnvironment type](self, "type");
  if (v3 == 4)
  {
    v6 = -[BCSPIRServerEnvironment serverType](self, "serverType");
    if ((unint64_t)(v6 - 1) < 2)
    {
      v4 = CFSTR("BCSBusinessEmailPIRUseCase");
      v5 = kBCSDefaultBusinessEmailPIRUseCase;
      goto LABEL_9;
    }
    if (v6 == 3)
    {
      v4 = CFSTR("BCSBusinessEmailLogoPIRUseCase");
      v5 = kBCSDefaultBusinessEmailLogoPIRUseCase;
      goto LABEL_9;
    }
LABEL_10:
    v8 = -[BCSPIRServerEnvironment type](self, "type");
    if (v8 == 4)
    {
      v10 = -[BCSPIRServerEnvironment serverType](self, "serverType");
      if ((unint64_t)(v10 - 1) < 2)
      {
        v9 = kBCSDefaultBusinessEmailPIRUseCase;
        goto LABEL_17;
      }
      if (v10 == 3)
      {
        v9 = kBCSDefaultBusinessEmailLogoPIRUseCase;
        goto LABEL_17;
      }
    }
    else if (v8 == 3)
    {
      v9 = kBCSDefaultBusinessCallerPIRUseCase;
LABEL_17:
      v7 = *v9;
      return (NSString *)v7;
    }
    v7 = 0;
    return (NSString *)v7;
  }
  if (v3 != 3)
    goto LABEL_10;
  v4 = CFSTR("BCSBusinessCallerPIRUseCase");
  v5 = kBCSDefaultBusinessCallerPIRUseCase;
LABEL_9:
  -[BCSPIRServerEnvironment _stringFromDefaultsForKey:defaultValue:](self, v4, *v5);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v7;
}

- (id)_stringFromDefaultsForKey:(void *)a3 defaultValue:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5
      && (objc_msgSend(a1, "userDefaults"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "objectForKey:", v5),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      objc_msgSend(a1, "userDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringForKey:", v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = v6;
    }
  }

  return a1;
}

- (BOOL)pirUsesCompression
{
  BCSPIRServerEnvironment *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString **v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = self;
  if (!-[BCSPIRServerEnvironment isInternalInstall](self, "isInternalInstall"))
    goto LABEL_6;
  v3 = -[BCSPIRServerEnvironment type](v2, "type");
  if (v3 == 3)
  {
    v5 = kBCSDefaultsBusinessCallerPIRUsesCompression;
    goto LABEL_8;
  }
  if (v3 != 4 || (v4 = -[BCSPIRServerEnvironment serverType](v2, "serverType"), (unint64_t)(v4 - 1) > 2))
  {
LABEL_6:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  v5 = off_24C39D040[v4 - 1];
LABEL_8:
  v6 = *v5;
  v7 = v6;
  if (v2)
  {
    if (v6
      && (-[BCSPIRServerEnvironment userDefaults](v2, "userDefaults"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "objectForKey:", v7),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      -[BCSPIRServerEnvironment userDefaults](v2, "userDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v2) = objc_msgSend(v10, "BOOLForKey:", v7);

    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }

  return (char)v2;
}

- (NSString)secondaryIdentifier
{
  _BOOL4 v3;
  int64_t v4;
  __CFString *v5;
  __CFString **v6;
  __CFString **v7;
  __CFString *v8;

  v3 = -[BCSPIRServerEnvironment isInternalInstall](self, "isInternalInstall");
  v4 = -[BCSPIRServerEnvironment type](self, "type");
  if (!v3)
  {
    if (v4 == 4)
    {
      v7 = kBCSPIRSecondaryIdentifierForEmail;
    }
    else
    {
      if (v4 != 3)
        goto LABEL_8;
      v7 = kBCSPIRSecondaryIdentifierForBusinessCaller;
    }
    v8 = *v7;
    return (NSString *)v8;
  }
  if (v4 == 4)
  {
    v5 = CFSTR("BCSBusinessEmailSecondaryIdentifier");
    v6 = kBCSPIRSecondaryIdentifierForEmail;
    goto LABEL_10;
  }
  if (v4 == 3)
  {
    v5 = CFSTR("BCSBusinessCallerSecondaryIdentifier");
    v6 = kBCSPIRSecondaryIdentifierForBusinessCaller;
LABEL_10:
    -[BCSPIRServerEnvironment _stringFromDefaultsForKey:defaultValue:](self, v5, *v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v8;
  }
LABEL_8:
  v8 = 0;
  return (NSString *)v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)serverType
{
  return self->_serverType;
}

- (void)setServerType:(int64_t)a3
{
  self->_serverType = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BCSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
