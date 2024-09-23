@implementation FSModuleIdentity

- (FSModuleIdentity)initWithApplicationExtensionRecord:(id)a3 isEnabled:(BOOL)a4 isSystem:(BOOL)a5
{
  id v8;
  FSModuleIdentity *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  void *v12;
  uint64_t v13;
  NSDictionary *attributes;
  uint64_t v15;
  NSURL *url;
  uint64_t v17;
  NSUUID *uuid;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *desc;
  uint64_t v23;
  NSString *localizedName;
  objc_super v26;

  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FSModuleIdentity;
  v9 = -[FSModuleIdentity init](&v26, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    objc_msgSend(v8, "infoDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:ofClass:", CFSTR("EXAppExtensionAttributes"), objc_opt_class());
    v13 = objc_claimAutoreleasedReturnValue();
    attributes = v9->_attributes;
    v9->_attributes = (NSDictionary *)v13;

    objc_msgSend(v8, "URL");
    v15 = objc_claimAutoreleasedReturnValue();
    url = v9->_url;
    v9->_url = (NSURL *)v15;

    objc_msgSend(v8, "uniqueIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v17;

    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Extension identity [%@]: %@ platform: %u"), v20, v9->_bundleIdentifier, objc_msgSend(v8, "platform"));
    v21 = objc_claimAutoreleasedReturnValue();
    desc = v9->_desc;
    v9->_desc = (NSString *)v21;

    v9->_enabled = a4;
    v9->_system = a5;
    objc_msgSend(v8, "localizedName");
    v23 = objc_claimAutoreleasedReturnValue();
    localizedName = v9->_localizedName;
    v9->_localizedName = (NSString *)v23;

  }
  return v9;
}

- (FSModuleIdentity)initWithApplicationExtensionRecord:(id)a3 isEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  FSModuleIdentity *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."));

  v9 = -[FSModuleIdentity initWithApplicationExtensionRecord:isEnabled:isSystem:](self, "initWithApplicationExtensionRecord:isEnabled:isSystem:", v6, v8 | v4, v8);
  return v9;
}

- (id)description
{
  return self->_desc;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("FSModuleIdentity.bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("FSModuleIdentity.attributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("FSModuleIdentity.url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("FSModuleIdentity.uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_desc, CFSTR("FSModuleIdentity.description"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("FSModuleIdentity.enabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_system, CFSTR("FSModuleIdentity.system"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("FSModuleIdentity.locName"));

}

- (FSModuleIdentity)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bundleIdentifier;
  void *v7;
  NSDictionary *v8;
  NSDictionary *attributes;
  NSURL *v10;
  NSURL *url;
  NSUUID *v12;
  NSUUID *uuid;
  NSString *v14;
  NSString *desc;
  NSString *v16;
  NSString *localizedName;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSModuleIdentity.bundleID"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

  +[FSKitConstants plistTypes](FSKitConstants, "plistTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("FSModuleIdentity.attributes"));
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  attributes = self->_attributes;
  self->_attributes = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSModuleIdentity.url"));
  v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSModuleIdentity.uuid"));
  v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSModuleIdentity.description"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  desc = self->_desc;
  self->_desc = v14;

  self->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSModuleIdentity.enabled"));
  self->_system = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSModuleIdentity.system"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSModuleIdentity.locName"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  localizedName = self->_localizedName;
  self->_localizedName = v16;

  return self;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSystem
{
  return self->_system;
}

- (NSString)desc
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
