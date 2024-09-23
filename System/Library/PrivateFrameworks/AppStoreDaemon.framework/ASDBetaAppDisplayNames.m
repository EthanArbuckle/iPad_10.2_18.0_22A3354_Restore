@implementation ASDBetaAppDisplayNames

+ (id)displayNameWithLocalizedNames:(id)a3 andPrimaryLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setLocalizedNames:", v6);

  objc_msgSend(v7, "setPrimaryLocale:", v5);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Primary Locale: %@\nLocalized Names: %@"), self->_primaryLocale, self->_localizedNames);
}

- (BOOL)isEqual:(id)a3
{
  ASDBetaAppDisplayNames *v4;
  uint64_t v5;
  NSDictionary *localizedNames;
  void *v7;
  NSString *primaryLocale;
  void *v9;
  char v10;

  v4 = (ASDBetaAppDisplayNames *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (localizedNames = self->_localizedNames,
          -[ASDBetaAppDisplayNames localizedNames](v4, "localizedNames"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(localizedNames) = -[NSDictionary isEqual:](localizedNames, "isEqual:", v7),
          v7,
          (_DWORD)localizedNames))
    {
      primaryLocale = self->_primaryLocale;
      -[ASDBetaAppDisplayNames primaryLocale](v4, "primaryLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqual:](primaryLocale, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDBetaAppDisplayNames *v4;

  v4 = -[ASDBetaAppDisplayNames init](+[ASDBetaAppDisplayNames allocWithZone:](ASDBetaAppDisplayNames, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_localizedNames, self->_localizedNames);
  objc_storeStrong((id *)&v4->_primaryLocale, self->_primaryLocale);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *localizedNames;
  id v5;

  localizedNames = self->_localizedNames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedNames, CFSTR("A"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryLocale, CFSTR("B"));

}

- (ASDBetaAppDisplayNames)initWithCoder:(id)a3
{
  id v4;
  ASDBetaAppDisplayNames *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *localizedNames;
  uint64_t v11;
  NSString *primaryLocale;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDBetaAppDisplayNames;
  v5 = -[ASDBetaAppDisplayNames init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("A"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v11 = objc_claimAutoreleasedReturnValue();
    primaryLocale = v5->_primaryLocale;
    v5->_primaryLocale = (NSString *)v11;

  }
  return v5;
}

- (NSDictionary)localizedNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalizedNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)primaryLocale
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryLocale:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLocale, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
}

@end
