@implementation NEDNSSettingsBundle

- (NEDNSSettingsBundle)init
{
  NEDNSSettingsBundle *v2;
  NEDNSSettingsBundle *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEDNSSettingsBundle;
  v2 = -[NEDNSSettingsBundle init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NEDNSSettingsBundle setEnabled:](v2, "setEnabled:", 0);
  return v3;
}

- (NEDNSSettingsBundle)initWithCoder:(id)a3
{
  id v4;
  NEDNSSettingsBundle *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *onDemandRules;
  void *v11;
  uint64_t v12;
  NEDNSSettings *settings;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEDNSSettingsBundle;
  v5 = -[NEDNSSettingsBundle init](&v15, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("OnDemandRules"));
    v9 = objc_claimAutoreleasedReturnValue();
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("Settings"));
    v12 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (NEDNSSettings *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("OnDemandRules"));

  -[NEDNSSettingsBundle settings](self, "settings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Settings"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEDNSSettingsBundle *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NEDNSSettingsBundle init](+[NEDNSSettingsBundle allocWithZone:](NEDNSSettingsBundle, "allocWithZone:", a3), "init");
  -[NEDNSSettingsBundle setEnabled:](v4, "setEnabled:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"));
  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    -[NEDNSSettingsBundle setOnDemandRules:](v4, "setOnDemandRules:", v8);

  }
  -[NEDNSSettingsBundle settings](self, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEDNSSettingsBundle setSettings:](v4, "setSettings:", v9);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEDNSSettingsBundle settings](self, "settings");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEDNSSettingsBundle settings](self, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "checkValidityAndCollectErrors:", v4);

  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing settings"), v4);
  }
  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = objc_msgSend(v13, "checkValidityAndCollectErrors:", v4) & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid on demand rule object"), v4);
            LODWORD(v5) = 0;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("onDemandRules"), v5, a4);

  -[NEDNSSettingsBundle settings](self, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("settings"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEDNSSettingsBundle descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOnDemandRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NEDNSSettings)settings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_onDemandRules, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
