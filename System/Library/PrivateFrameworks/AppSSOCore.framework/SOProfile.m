@implementation SOProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
  objc_storeStrong((id *)&self->_URLPrefix, 0);
  objc_storeStrong((id *)&self->_urlNoWildCards, 0);
  objc_storeStrong((id *)&self->_urlPredicates, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  void *v7;
  void *v8;
  NSArray *URLPrefix;
  void *v10;
  NSArray *hosts;
  void *v12;
  NSString *extensionBundleIdentifier;
  void *v14;
  NSString *realm;
  void *v16;
  NSArray *deniedBundleIdentifiers;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, v8);

  URLPrefix = self->_URLPrefix;
  NSStringFromSelector(sel_URLPrefix);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", URLPrefix, v10);

  hosts = self->_hosts;
  NSStringFromSelector(sel_hosts);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", hosts, v12);

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", extensionBundleIdentifier, v14);

  realm = self->_realm;
  NSStringFromSelector(sel_realm);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", realm, v16);

  deniedBundleIdentifiers = self->_deniedBundleIdentifiers;
  NSStringFromSelector(sel_deniedBundleIdentifiers);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", deniedBundleIdentifiers, v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_screenLockedBehavior);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_screenLockedBehavior);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v19, v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_pssoAuthenticationMethod);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pssoAuthenticationMethod);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v22, v21);

}

- (void)preLoadURLData
{
  NSMutableDictionary *v3;
  NSMutableDictionary *urlPredicates;
  NSMutableDictionary *v5;
  NSMutableDictionary *urlNoWildCards;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  urlPredicates = self->_urlPredicates;
  self->_urlPredicates = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  urlNoWildCards = self->_urlNoWildCards;
  self->_urlNoWildCards = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_URLPrefix;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "containsString:", CFSTR("*")))
        {
          v13 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v12, "stringByAppendingString:", CFSTR("*"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "predicateWithFormat:", CFSTR("SELF LIKE[c] %@"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlPredicates, "setObject:forKeyedSubscript:", v15, v12);
        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlNoWildCards, "setObject:forKeyedSubscript:", &unk_1E8C61250, v12);
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_opt_new();
  v4[3] = self->_type;
  v5 = -[NSArray copy](self->_URLPrefix, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSArray copy](self->_hosts, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[NSString copy](self->_extensionBundleIdentifier, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSString copy](self->_realm, "copy");
  v12 = (void *)v4[7];
  v4[7] = v11;

  v13 = -[NSArray copy](self->_deniedBundleIdentifiers, "copy");
  v14 = (void *)v4[8];
  v4[8] = v13;

  v4[9] = self->_screenLockedBehavior;
  v4[10] = self->_pssoAuthenticationMethod;
  return v4;
}

- (SOProfile)initWithCoder:(id)a3
{
  id v4;
  SOProfile *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *URLPrefix;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *hosts;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *extensionBundleIdentifier;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *realm;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *deniedBundleIdentifiers;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SOProfile;
  v5 = -[SOProfile init](&v42, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_type);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "integerValue");

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_URLPrefix);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    URLPrefix = v5->_URLPrefix;
    v5->_URLPrefix = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_hosts);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    hosts = v5->_hosts;
    v5->_hosts = (NSArray *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_extensionBundleIdentifier);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v23;

    v25 = objc_opt_class();
    NSStringFromSelector(sel_realm);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    realm = v5->_realm;
    v5->_realm = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deniedBundleIdentifiers);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    deniedBundleIdentifiers = v5->_deniedBundleIdentifiers;
    v5->_deniedBundleIdentifiers = (NSArray *)v33;

    v35 = objc_opt_class();
    NSStringFromSelector(sel_screenLockedBehavior);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenLockedBehavior = objc_msgSend(v37, "integerValue");

    v38 = objc_opt_class();
    NSStringFromSelector(sel_pssoAuthenticationMethod);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pssoAuthenticationMethod = objc_msgSend(v40, "integerValue");

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)matchesURL:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_URLPrefix;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary valueForKey:](self->_urlNoWildCards, "valueForKey:", v10, (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v4, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "hasPrefix:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_16;
        }
        else
        {
          -[NSMutableDictionary valueForKey:](self->_urlPredicates, "valueForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15 && (objc_msgSend(v15, "evaluateWithObject:", v4) & 1) != 0)
          {

LABEL_16:
            v17 = 1;
            goto LABEL_17;
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_17:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringWithProfileType:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return off_1E8C5C690[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %d>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringWithScreenLockedBehavior:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return off_1E8C5C6A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %d>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringWithAuthenticationMethod:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return off_1E8C5C6C0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %d>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  uint64_t v3;
  void *v4;
  NSArray *URLPrefix;
  NSArray *hosts;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *realm;
  NSArray *deniedBundleIdentifiers;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[8];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("Type");
  objc_msgSend((id)objc_opt_class(), "stringWithProfileType:", self->_type);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  URLPrefix = self->_URLPrefix;
  hosts = self->_hosts;
  if (!URLPrefix)
    URLPrefix = (NSArray *)CFSTR("<null>");
  v20[0] = v3;
  v20[1] = URLPrefix;
  v19[1] = CFSTR("URLPrefix");
  v19[2] = CFSTR("Hosts");
  if (hosts)
    v7 = (const __CFString *)hosts;
  else
    v7 = CFSTR("<null>");
  v20[2] = v7;
  v19[3] = CFSTR("BundleIdentifier");
  -[SOProfile extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<null>");
  realm = (const __CFString *)self->_realm;
  deniedBundleIdentifiers = self->_deniedBundleIdentifiers;
  if (!realm)
    realm = CFSTR("<null>");
  v20[3] = v10;
  v20[4] = realm;
  v19[4] = CFSTR("Realm");
  v19[5] = CFSTR("DeniedBundleIdentifiers");
  if (deniedBundleIdentifiers)
    v13 = (const __CFString *)deniedBundleIdentifiers;
  else
    v13 = CFSTR("<null>");
  v20[5] = v13;
  v19[6] = CFSTR("ScreenLockedBehavior");
  objc_msgSend((id)objc_opt_class(), "stringWithScreenLockedBehavior:", self->_screenLockedBehavior);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v14;
  v19[7] = CFSTR("AuthenticationMethod");
  objc_msgSend((id)objc_opt_class(), "stringWithAuthenticationMethod:", self->_pssoAuthenticationMethod);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)URLPrefix
{
  return self->_URLPrefix;
}

- (void)setURLPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_URLPrefix, a3);
}

- (NSArray)hosts
{
  return self->_hosts;
}

- (void)setHosts:(id)a3
{
  objc_storeStrong((id *)&self->_hosts, a3);
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, a3);
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (NSArray)deniedBundleIdentifiers
{
  return self->_deniedBundleIdentifiers;
}

- (void)setDeniedBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deniedBundleIdentifiers, a3);
}

- (int64_t)screenLockedBehavior
{
  return self->_screenLockedBehavior;
}

- (void)setScreenLockedBehavior:(int64_t)a3
{
  self->_screenLockedBehavior = a3;
}

- (int64_t)pssoAuthenticationMethod
{
  return self->_pssoAuthenticationMethod;
}

- (void)setPssoAuthenticationMethod:(int64_t)a3
{
  self->_pssoAuthenticationMethod = a3;
}

@end
