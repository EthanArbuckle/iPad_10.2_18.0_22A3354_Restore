@implementation NARGlance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NARGlance appID](self, "appID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appID"));

  -[NARGlance displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[NARGlance glanceID](self, "glanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("glanceID"));

  -[NARGlance localizedDisplayNameMap](self, "localizedDisplayNameMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localizedDisplayNameMap"));

}

- (NARGlance)initWithCoder:(id)a3
{
  id v4;
  NARGlance *v5;
  uint64_t v6;
  NSString *appID;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *glanceID;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *localizedDisplayNameMap;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NARGlance;
  v5 = -[NARGlance init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appID"));
    v6 = objc_claimAutoreleasedReturnValue();
    appID = v5->_appID;
    v5->_appID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("glanceID"));
    v10 = objc_claimAutoreleasedReturnValue();
    glanceID = v5->_glanceID;
    v5->_glanceID = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("localizedDisplayNameMap"));
    v15 = objc_claimAutoreleasedReturnValue();
    localizedDisplayNameMap = v5->_localizedDisplayNameMap;
    v5->_localizedDisplayNameMap = (NSDictionary *)v15;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; glanceID=%@>"), v5, self, self->_glanceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; glanceID=%@; displayName=%@; appID=%@>\nlocalizedDisplayNameMap=%@"),
    v5,
    self,
    self->_glanceID,
    self->_displayName,
    self->_appID,
    self->_localizedDisplayNameMap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)glanceID
{
  return self->_glanceID;
}

- (void)setGlanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)localizedDisplayNameMap
{
  return self->_localizedDisplayNameMap;
}

- (void)setLocalizedDisplayNameMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayNameMap, 0);
  objc_storeStrong((id *)&self->_glanceID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
