@implementation NEHotspotHS20Settings

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEHotspotHS20Settings domainName](self, "domainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v4, CFSTR("Hotspot 2.0 Domain Name"), 0, 0);

  return v3;
}

- (NEHotspotHS20Settings)initWithDomainName:(NSString *)domainName roamingEnabled:(BOOL)roamingEnabled
{
  NSString *v6;
  NEHotspotHS20Settings *v7;
  uint64_t v8;
  NSString *v9;
  objc_super v11;

  v6 = domainName;
  v11.receiver = self;
  v11.super_class = (Class)NEHotspotHS20Settings;
  v7 = -[NEHotspotHS20Settings init](&v11, sel_init);
  if (v7)
  {
    v8 = -[NSString copy](v6, "copy");
    v9 = v7->_domainName;
    v7->_domainName = (NSString *)v8;

    v7->_roamingEnabled = roamingEnabled;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEHotspotHS20Settings *v4;
  void *v5;
  NEHotspotHS20Settings *v6;

  v4 = +[NEHotspotHS20Settings allocWithZone:](NEHotspotHS20Settings, "allocWithZone:", a3);
  -[NEHotspotHS20Settings domainName](self, "domainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEHotspotHS20Settings initWithDomainName:roamingEnabled:](v4, "initWithDomainName:roamingEnabled:", v5, -[NEHotspotHS20Settings isRoamingEnabled](self, "isRoamingEnabled"));

  -[NEHotspotHS20Settings setRoamingConsortiumOIs:](v6, "setRoamingConsortiumOIs:", self->_roamingConsortiumOIs);
  -[NEHotspotHS20Settings setNaiRealmNames:](v6, "setNaiRealmNames:", self->_naiRealmNames);
  -[NEHotspotHS20Settings setMCCAndMNCs:](v6, "setMCCAndMNCs:", self->_MCCAndMNCs);
  return v6;
}

- (NEHotspotHS20Settings)initWithCoder:(id)a3
{
  id v4;
  NEHotspotHS20Settings *v5;
  uint64_t v6;
  NSString *domainName;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *roamingConsortiumOIs;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *naiRealmNames;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *MCCAndMNCs;

  v4 = a3;
  v5 = -[NEHotspotHS20Settings init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DomainName"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;

    v5->_roamingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsRoamingEnabled"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("RoamingConsortiumOIs"));
    v11 = objc_claimAutoreleasedReturnValue();
    roamingConsortiumOIs = v5->_roamingConsortiumOIs;
    v5->_roamingConsortiumOIs = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("NAIRealmNames"));
    v16 = objc_claimAutoreleasedReturnValue();
    naiRealmNames = v5->_naiRealmNames;
    v5->_naiRealmNames = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("MCCAndMNCs"));
    v21 = objc_claimAutoreleasedReturnValue();
    MCCAndMNCs = v5->_MCCAndMNCs;
    v5->_MCCAndMNCs = (NSArray *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NEHotspotHS20Settings domainName](self, "domainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DomainName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotHS20Settings isRoamingEnabled](self, "isRoamingEnabled"), CFSTR("IsRoamingEnabled"));
  -[NEHotspotHS20Settings roamingConsortiumOIs](self, "roamingConsortiumOIs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("RoamingConsortiumOIs"));

  -[NEHotspotHS20Settings naiRealmNames](self, "naiRealmNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("NAIRealmNames"));

  -[NEHotspotHS20Settings MCCAndMNCs](self, "MCCAndMNCs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MCCAndMNCs"));

}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (void)setRoamingEnabled:(BOOL)roamingEnabled
{
  self->_roamingEnabled = roamingEnabled;
}

- (NSArray)roamingConsortiumOIs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRoamingConsortiumOIs:(NSArray *)roamingConsortiumOIs
{
  objc_setProperty_atomic_copy(self, a2, roamingConsortiumOIs, 24);
}

- (NSArray)naiRealmNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNaiRealmNames:(NSArray *)naiRealmNames
{
  objc_setProperty_atomic_copy(self, a2, naiRealmNames, 32);
}

- (NSArray)MCCAndMNCs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMCCAndMNCs:(NSArray *)MCCAndMNCs
{
  objc_setProperty_atomic_copy(self, a2, MCCAndMNCs, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_naiRealmNames, 0);
  objc_storeStrong((id *)&self->_roamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
