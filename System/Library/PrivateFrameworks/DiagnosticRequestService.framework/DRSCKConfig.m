@implementation DRSCKConfig

- (int64_t)ckRapidEnvironment
{
  if (-[DRSCKConfig rapidEnvironment](self, "rapidEnvironment") == 2)
    return 2;
  else
    return 1;
}

- (int64_t)ckContainerEnvironment
{
  if (-[DRSCKConfig containerEnvironment](self, "containerEnvironment") == 2)
    return 2;
  else
    return 1;
}

+ (id)_configWithConfigMO_ON_MOC_QUEUE:(id)a3
{
  id v3;
  DRSCKConfig *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;

  v3 = a3;
  v4 = [DRSCKConfig alloc];
  v5 = objc_msgSend(v3, "containerEnvironment");
  v6 = objc_msgSend(v3, "rapidEnvironment");
  v7 = objc_msgSend(v3, "overridesDefault");

  return -[DRSCKConfig initWithContainerEnvironment:rapidEnvironment:overridesDefault:](v4, "initWithContainerEnvironment:rapidEnvironment:overridesDefault:", v5, v6, v7);
}

- (id)newConfigMOInContext_ON_MOC_QUEUE:(id)a3
{
  id v4;
  DRSCKConfigMO *v5;

  v4 = a3;
  v5 = -[DRSCKConfigMO initWithContext:]([DRSCKConfigMO alloc], "initWithContext:", v4);

  -[DRSCKConfigMO setContainerEnvironment:](v5, "setContainerEnvironment:", -[DRSCKConfig containerEnvironment](self, "containerEnvironment"));
  -[DRSCKConfigMO setRapidEnvironment:](v5, "setRapidEnvironment:", -[DRSCKConfig rapidEnvironment](self, "rapidEnvironment"));
  -[DRSCKConfigMO setOverridesDefault:](v5, "setOverridesDefault:", -[DRSCKConfig overridesDefault](self, "overridesDefault"));
  return v5;
}

+ (id)defaultConfig
{
  if (defaultConfig_onceToken != -1)
    dispatch_once(&defaultConfig_onceToken, &__block_literal_global_326);
  return (id)defaultConfig_defaultConfig;
}

void __28__DRSCKConfig_defaultConfig__block_invoke()
{
  DRSCKConfig *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(DRSCKConfig);
  v1 = (void *)defaultConfig_defaultConfig;
  defaultConfig_defaultConfig = (uint64_t)v0;

  DPLogHandle_CKConfig();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isInternal"))
      v4 = "Internal";
    else
      v4 = "Customer";
    objc_msgSend((id)defaultConfig_defaultConfig, "debugDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("Unknown");
    if (v5)
      v7 = (const __CFString *)v5;
    v8 = 136315394;
    v9 = v4;
    v10 = 2114;
    v11 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DefaultConfigInitialized", "Default config (%s): %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

- (DRSCKConfig)initWithContainerEnvironment:(unsigned __int8)a3 rapidEnvironment:(unsigned __int8)a4 overridesDefault:(BOOL)a5
{
  DRSCKConfig *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DRSCKConfig;
  result = -[DRSCKConfig init](&v9, sel_init);
  if (result)
  {
    result->_containerEnvironment = a3;
    result->_rapidEnvironment = a4;
    result->_overridesDefault = a5;
  }
  return result;
}

- (DRSCKConfig)init
{
  void *v3;
  int v4;
  uint64_t v5;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
    v5 = 2;
  else
    v5 = 1;
  return -[DRSCKConfig initWithContainerEnvironment:rapidEnvironment:overridesDefault:](self, "initWithContainerEnvironment:rapidEnvironment:overridesDefault:", 1, v5, 0);
}

- (id)debugDescription
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[DRSCKConfig containerEnvironment](self, "containerEnvironment");
  if (v4 == 1)
    v5 = CFSTR("Production");
  else
    v5 = CFSTR("Unknown");
  if (v4 == 2)
    v5 = CFSTR("Sandbox");
  v6 = v5;
  v7 = -[DRSCKConfig rapidEnvironment](self, "rapidEnvironment");
  if (v7 == 1)
    v8 = CFSTR("Production");
  else
    v8 = CFSTR("Unknown");
  if (v7 == 2)
    v8 = CFSTR("Sandbox");
  v9 = v8;
  v10 = -[DRSCKConfig overridesDefault](self, "overridesDefault");
  v11 = CFSTR("(Default)");
  if (v10)
    v11 = CFSTR("(Overrides default)");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Container Environment: %@, RAPID Environment: %@ %@"), v6, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  DRSCKConfig *v4;
  DRSCKConfig *v5;
  DRSCKConfig *v6;
  int v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (DRSCKConfig *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[DRSCKConfig containerEnvironment](self, "containerEnvironment");
    if (v7 == -[DRSCKConfig containerEnvironment](v6, "containerEnvironment")
      && (v8 = -[DRSCKConfig rapidEnvironment](self, "rapidEnvironment"),
          v8 == -[DRSCKConfig rapidEnvironment](v6, "rapidEnvironment")))
    {
      v9 = -[DRSCKConfig overridesDefault](self, "overridesDefault");
      v10 = v9 ^ -[DRSCKConfig overridesDefault](v6, "overridesDefault") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
LABEL_7:
    LOBYTE(v10) = 0;
  }
LABEL_11:

  return v10;
}

- (unsigned)rapidEnvironment
{
  return self->_rapidEnvironment;
}

- (unsigned)containerEnvironment
{
  return self->_containerEnvironment;
}

- (BOOL)overridesDefault
{
  return self->_overridesDefault;
}

@end
