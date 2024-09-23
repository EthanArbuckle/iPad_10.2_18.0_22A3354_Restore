@implementation CNSocialProfile

+ (id)Username
{
  return &__block_literal_global_43;
}

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", key, a1, 0);
}

+ (NSString)localizedStringForService:(NSString *)service
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D13A98];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = service;
  objc_msgSend(v5, "bundleForClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForString:bundle:table:returningNilIfNotFound:", v6, v7, CFSTR("SocialServices"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (CNSocialProfile)socialProfileWithDictionaryRepresentation:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  v3 = a3;
  +[CN socialProfileFromDictionaryTransform](CN, "socialProfileFromDictionaryTransform");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNSocialProfile *)v5;
}

- (id)dictionaryRepresentation
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  +[CN socialProfileToDictionaryTransform](CN, "socialProfileToDictionaryTransform");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CNSocialProfile *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNSocialProfile)initWithUrlString:(NSString *)urlString username:(NSString *)username userIdentifier:(NSString *)userIdentifier service:(NSString *)service
{
  return -[CNSocialProfile initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:](self, "initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:", urlString, username, userIdentifier, service, 0, 0, 0);
}

- (CNSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayname:(id)a7
{
  return -[CNSocialProfile initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:](self, "initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:", a3, a4, a5, a6, a7, 0, 0);
}

- (CNSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayname:(id)a7 teamIdentifier:(id)a8 bundleIdentifiers:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CNSocialProfile *v22;
  uint64_t v23;
  NSString *urlString;
  uint64_t v25;
  NSString *username;
  uint64_t v27;
  NSString *userIdentifier;
  uint64_t v29;
  NSString *service;
  uint64_t v31;
  NSString *displayname;
  uint64_t v33;
  NSString *teamIdentifier;
  uint64_t v35;
  NSArray *bundleIdentifiers;
  CNSocialProfile *v37;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)CNSocialProfile;
  v22 = -[CNSocialProfile init](&v39, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    urlString = v22->_urlString;
    v22->_urlString = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    username = v22->_username;
    v22->_username = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    userIdentifier = v22->_userIdentifier;
    v22->_userIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    service = v22->_service;
    v22->_service = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    displayname = v22->_displayname;
    v22->_displayname = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    teamIdentifier = v22->_teamIdentifier;
    v22->_teamIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    bundleIdentifiers = v22->_bundleIdentifiers;
    v22->_bundleIdentifiers = (NSArray *)v35;

    v37 = v22;
  }

  return v22;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNMutableSocialProfile *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNMutableSocialProfile *v12;

  v4 = [CNMutableSocialProfile alloc];
  -[CNSocialProfile urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile userIdentifier](self, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile displayname](self, "displayname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile teamIdentifier](self, "teamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfile bundleIdentifiers](self, "bundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNSocialProfile initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:](v4, "initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSocialProfile)initWithCoder:(id)a3
{
  id v4;
  CNSocialProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *urlString;
  void *v9;
  uint64_t v10;
  NSString *username;
  void *v12;
  uint64_t v13;
  NSString *userIdentifier;
  void *v15;
  uint64_t v16;
  NSString *service;
  void *v18;
  uint64_t v19;
  NSString *displayname;
  void *v21;
  uint64_t v22;
  NSString *teamIdentifier;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *bundleIdentifiers;
  CNSocialProfile *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CNSocialProfile;
  v5 = -[CNSocialProfile init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_username"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    username = v5->_username;
    v5->_username = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_service"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    service = v5->_service;
    v5->_service = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayname"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    displayname = v5->_displayname;
    v5->_displayname = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("_bundleIdentifiers"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v28;

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *urlString;
  id v5;

  urlString = self->_urlString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", urlString, CFSTR("_urlString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_username, CFSTR("_username"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("_userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("_service"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayname, CFSTR("_displayname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamIdentifier, CFSTR("_teamIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifiers, CFSTR("_bundleIdentifiers"));

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("urlString"), self->_urlString, CFSTR("username"), self->_username, CFSTR("userIdentifier"), self->_userIdentifier, CFSTR("service"), self->_service, CFSTR("displayname"), self->_displayname, CFSTR("teamIdentifier"), self->_teamIdentifier, CFSTR("bundleIdentifiers"), self->_bundleIdentifiers, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  return -[CNSocialProfile isEqual:ignoreURLs:](self, "isEqual:ignoreURLs:", a3, 0);
}

- (BOOL)isEqual:(id)a3 ignoreURLs:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (self == a3)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v29 = v7;
    v30 = v6;
    v31 = v5;
    v32 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (unint64_t)-[CNSocialProfile teamIdentifier](self, "teamIdentifier");
      v14 = (unint64_t)(id)objc_msgSend(a3, "teamIdentifier");
      if (!(v13 | v14) || (v15 = objc_msgSend((id)v13, "isEqual:", v14)) != 0)
      {
        v16 = (unint64_t)-[CNSocialProfile bundleIdentifiers](self, "bundleIdentifiers", v29, v30, v31, v32, v8, v9);
        v17 = (unint64_t)(id)objc_msgSend(a3, "bundleIdentifiers");
        if (!(v16 | v17) || (v15 = objc_msgSend((id)v16, "isEqual:", v17)) != 0)
        {
          if (a4
            || (v18 = (unint64_t)-[CNSocialProfile urlString](self, "urlString"),
                v19 = (unint64_t)(id)objc_msgSend(a3, "urlString"),
                !(v18 | v19))
            || (v15 = objc_msgSend((id)v18, "isEqual:", v19)) != 0)
          {
            v20 = (unint64_t)-[CNSocialProfile username](self, "username");
            v21 = (unint64_t)(id)objc_msgSend(a3, "username");
            if (!(v20 | v21) || (v15 = objc_msgSend((id)v20, "isEqual:", v21)) != 0)
            {
              v22 = (unint64_t)-[CNSocialProfile userIdentifier](self, "userIdentifier");
              v23 = (unint64_t)(id)objc_msgSend(a3, "userIdentifier");
              if (!(v22 | v23) || (v15 = objc_msgSend((id)v22, "isEqual:", v23)) != 0)
              {
                v24 = (unint64_t)-[CNSocialProfile service](self, "service");
                v25 = (unint64_t)(id)objc_msgSend(a3, "service");
                if (!(v24 | v25) || (v15 = objc_msgSend((id)v24, "isEqual:", v25)) != 0)
                {
                  v26 = (unint64_t)-[CNSocialProfile displayname](self, "displayname");
                  v27 = (unint64_t)(id)objc_msgSend(a3, "displayname");
                  if (!(v26 | v27) || (v15 = objc_msgSend((id)v26, "isEqual:", v27)) != 0)
                    LOBYTE(v15) = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile urlString](self, "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5;

  v9 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile userIdentifier](self, "userIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "objectHash:", v10) - v8 + 32 * v8;

  v12 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "objectHash:", v13) - v11 + 32 * v11;

  v15 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile displayname](self, "displayname");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "objectHash:", v16) - v14 + 32 * v14;

  v18 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile teamIdentifier](self, "teamIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "objectHash:", v19) - v17 + 32 * v17;

  v21 = (void *)MEMORY[0x1E0D13A78];
  -[CNSocialProfile bundleIdentifiers](self, "bundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "objectHash:", v22) - v20 + 32 * v20 + 0x6CE5F3FACFLL;

  return v23;
}

- (BOOL)isValid:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  if (isValid__cn_once_token_0_2 != -1)
    dispatch_once(&isValid__cn_once_token_0_2, &__block_literal_global_101);
  v5 = (id)isValid__cn_once_object_0_2;
  if (isValid__cn_once_token_1_2 != -1)
    dispatch_once(&isValid__cn_once_token_1_2, &__block_literal_global_38_1);
  v6 = isValid__cn_once_token_2_2;
  v7 = (id)isValid__cn_once_object_1_2;
  if (v6 != -1)
    dispatch_once(&isValid__cn_once_token_2_2, &__block_literal_global_39);
  v8 = +[CN areValidKeyPaths:forObject:expectedClasses:allowNil:error:](CN, "areValidKeyPaths:forObject:expectedClasses:allowNil:error:", v5, self, v7, isValid__cn_once_object_2_2, a3);

  return v8;
}

void __27__CNSocialProfile_isValid___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40698, "copy");
  v1 = (void *)isValid__cn_once_object_0_2;
  isValid__cn_once_object_0_2 = v0;

}

void __27__CNSocialProfile_isValid___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy", v3, v4, v5, v6, v7, v8);
  v2 = (void *)isValid__cn_once_object_1_2;
  isValid__cn_once_object_1_2 = v1;

}

void __27__CNSocialProfile_isValid___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A406B0, "copy");
  v1 = (void *)isValid__cn_once_object_2_2;
  isValid__cn_once_object_2_2 = v0;

}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayname
{
  return self->_displayname;
}

- (void)setDisplayname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_displayname, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
