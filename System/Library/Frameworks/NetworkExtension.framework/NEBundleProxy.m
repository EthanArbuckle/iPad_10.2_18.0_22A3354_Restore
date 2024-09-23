@implementation NEBundleProxy

- (NEBundleProxy)initWithIdentifier:(id)a3 url:(id)a4 machOUUIDs:(id)a5 name:(id)a6 appGroups:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NEBundleProxy *v17;
  NEBundleProxy *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NEBundleProxy;
  v17 = -[NEBundleProxy init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_url, a4);
    objc_storeStrong((id *)&v18->_machOUUIDs, a5);
    objc_storeStrong((id *)&v18->_name, a6);
    objc_storeStrong((id *)&v18->_appGroups, a7);
  }

  return v18;
}

- (NEBundleProxy)initWithCoder:(id)a3
{
  id v4;
  NEBundleProxy *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *url;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *machOUUIDs;
  uint64_t v15;
  NSString *name;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *appGroups;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEBundleProxy;
  v5 = -[NEBundleProxy init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("machOUUIDs"));
    v13 = objc_claimAutoreleasedReturnValue();
    machOUUIDs = v5->_machOUUIDs;
    v5->_machOUUIDs = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v15 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("appGroups"));
    v20 = objc_claimAutoreleasedReturnValue();
    appGroups = v5->_appGroups;
    v5->_appGroups = (NSArray *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[NEBundleProxy identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[NEBundleProxy url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

  -[NEBundleProxy machOUUIDs](self, "machOUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("machOUUIDs"));

  -[NEBundleProxy name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("name"));

  -[NEBundleProxy appGroups](self, "appGroups");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("appGroups"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (NSArray)machOUUIDs
{
  return self->_machOUUIDs;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)appGroups
{
  return self->_appGroups;
}

- (BOOL)isWatchKitApp
{
  return self->_isWatchKitApp;
}

- (void)setIsWatchKitApp:(BOOL)a3
{
  self->_isWatchKitApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appGroups, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_machOUUIDs, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
