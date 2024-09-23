@implementation CNApplicationProxy

- (CNApplicationProxy)initWithLSApplicationProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNApplicationProxy *v9;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CNApplicationProxy initWithBundleIdentifier:teamIdentifier:localizedName:activityTypes:](self, "initWithBundleIdentifier:teamIdentifier:localizedName:activityTypes:", v5, v6, v7, v8);
  return v9;
}

- (CNApplicationProxy)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 localizedName:(id)a5 activityTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNApplicationProxy *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  NSString *teamIdentifier;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *localizedName;
  uint64_t v23;
  NSArray *activityTypes;
  CNApplicationProxy *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CNApplicationProxy;
  v14 = -[CNApplicationProxy init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    teamIdentifier = v14->_teamIdentifier;
    v14->_teamIdentifier = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\u200E"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "copy");
    localizedName = v14->_localizedName;
    v14->_localizedName = (NSString *)v21;

    v23 = objc_msgSend(v13, "copy");
    activityTypes = v14->_activityTypes;
    v14->_activityTypes = (NSArray *)v23;

    v25 = v14;
    v12 = v20;
  }

  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (CNApplicationProxy)init
{
  id v2;

  CNInitializerUnavailableException(self, a2, sel_initWithLSApplicationProxy_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNApplicationProxy)initWithCoder:(id)a3
{
  id v4;
  CNApplicationProxy *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSString *teamIdentifier;
  void *v12;
  uint64_t v13;
  NSString *localizedName;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *activityTypes;
  CNApplicationProxy *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNApplicationProxy;
  v5 = -[CNApplicationProxy init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_activityTypes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    activityTypes = v5->_activityTypes;
    v5->_activityTypes = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamIdentifier, CFSTR("_teamIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("_localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityTypes, CFSTR("_activityTypes"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CNApplicationProxyApplicationIdentifierKey;
  -[CNApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", v4, v5);

  v7 = CNApplicationProxyTeamIdentifierKey;
  -[CNApplicationProxy teamIdentifier](self, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", v7, v8);

  v10 = CNApplicationProxyLocalizedNameKey;
  -[CNApplicationProxy localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendName:object:", v10, v11);

  v13 = CNApplicationProxyActivityTypesKey;
  -[CNApplicationProxy activityTypes](self, "activityTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendName:object:", v13, v14);

  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)activityTypes
{
  return self->_activityTypes;
}

- (void)setActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
