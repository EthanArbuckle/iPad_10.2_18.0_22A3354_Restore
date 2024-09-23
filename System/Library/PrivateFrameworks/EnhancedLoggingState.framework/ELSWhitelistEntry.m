@implementation ELSWhitelistEntry

- (ELSWhitelistEntry)initWithBundleIdentifier:(id)a3 parameterName:(id)a4 baseLocalizationKey:(id)a5 needsWAPIKeys:(BOOL)a6 requiresFollowup:(BOOL)a7 retry:(BOOL)a8 platforms:(id)a9
{
  _BOOL8 v11;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  ELSWhitelistEntry *v23;
  uint64_t v25;

  v11 = a6;
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = a9;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_DESCRIPTION"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_SENSITIVE_INFORMATION"), v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v25) = a8;
  LOBYTE(v25) = a7;
  v23 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:displayNameLocalizationKey:descriptionLocalizationKey:sensitiveInformationLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](self, "initWithBundleIdentifier:parameterName:displayNameLocalizationKey:descriptionLocalizationKey:sensitiveInformationLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", v20, v19, v18, v21, v22, v11, v25, v17);

  return v23;
}

- (ELSWhitelistEntry)initWithBundleIdentifier:(id)a3 parameterName:(id)a4 displayNameLocalizationKey:(id)a5 descriptionLocalizationKey:(id)a6 sensitiveInformationLocalizationKey:(id)a7 needsWAPIKeys:(BOOL)a8 requiresFollowup:(BOOL)a9 retry:(BOOL)a10 platforms:(id)a11
{
  _BOOL4 v11;
  id v18;
  id v19;
  id v20;
  ELSWhitelistEntry *v21;
  ELSWhitelistEntry *v22;
  uint64_t v23;
  NSString *displayNameLocalizationKey;
  uint64_t v25;
  NSString *descriptionLocalizationKey;
  NSString *v27;
  NSString *sensitiveInformationLocalizationKey;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v11 = a8;
  v31 = a3;
  v30 = a4;
  v32 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)ELSWhitelistEntry;
  v21 = -[ELSWhitelistEntry init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v22->_parameterName, a4);
    objc_storeStrong((id *)&v22->_platformAvailability, a11);
    if (v11 && MGGetBoolAnswer())
    {
      objc_msgSend(v32, "stringByAppendingString:", CFSTR("_WAPI"));
      v23 = objc_claimAutoreleasedReturnValue();
      displayNameLocalizationKey = v22->_displayNameLocalizationKey;
      v22->_displayNameLocalizationKey = (NSString *)v23;

      objc_msgSend(v18, "stringByAppendingString:", CFSTR("_WAPI"));
      v25 = objc_claimAutoreleasedReturnValue();
      descriptionLocalizationKey = v22->_descriptionLocalizationKey;
      v22->_descriptionLocalizationKey = (NSString *)v25;

      objc_msgSend(v19, "stringByAppendingString:", CFSTR("_WAPI"));
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_storeStrong((id *)&v22->_displayNameLocalizationKey, a5);
      objc_storeStrong((id *)&v22->_descriptionLocalizationKey, a6);
      v27 = (NSString *)v19;
    }
    sensitiveInformationLocalizationKey = v22->_sensitiveInformationLocalizationKey;
    v22->_sensitiveInformationLocalizationKey = v27;

    v22->_requiresFollowup = a9;
    v22->_retry = a10;
  }

  return v22;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (void)setParameterName:(id)a3
{
  objc_storeStrong((id *)&self->_parameterName, a3);
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, a3);
}

- (NSString)descriptionLocalizationKey
{
  return self->_descriptionLocalizationKey;
}

- (void)setDescriptionLocalizationKey:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLocalizationKey, a3);
}

- (NSString)sensitiveInformationLocalizationKey
{
  return self->_sensitiveInformationLocalizationKey;
}

- (NSArray)platformAvailability
{
  return self->_platformAvailability;
}

- (BOOL)requiresFollowup
{
  return self->_requiresFollowup;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformAvailability, 0);
  objc_storeStrong((id *)&self->_sensitiveInformationLocalizationKey, 0);
  objc_storeStrong((id *)&self->_descriptionLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
