@implementation NSSUsageApp

- (unint64_t)totalSize
{
  unint64_t staticSize;

  staticSize = self->_staticSize;
  return -[NSSUsageApp dataSize](self, "dataSize") + staticSize;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<NSSUsageApp: %p; name: \"%@\", bundleIdentifier: \"%@\", bundleVersion: \"%@\", staticSize: %llu, dynamicSize: %llu, sharedSize: %llu>"),
               self,
               self->_name,
               self->_bundleIdentifier,
               self->_bundleVersion,
               self->_staticSize,
               self->_dynamicSize,
               self->_sharedSize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_staticSize, CFSTR("staticSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_dynamicSize, CFSTR("dynamicSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sharedSize, CFSTR("sharedSize"));

}

- (NSSUsageApp)initWithCoder:(id)a3
{
  id v4;
  NSSUsageApp *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *bundleVersion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSSUsageApp;
  v5 = -[NSSUsageApp init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    v5->_staticSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("staticSize"));
    v5->_dynamicSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dynamicSize"));
    v5->_sharedSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sharedSize"));
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (unint64_t)staticSize
{
  return self->_staticSize;
}

- (void)setStaticSize:(unint64_t)a3
{
  self->_staticSize = a3;
}

- (unint64_t)dynamicSize
{
  return self->_dynamicSize;
}

- (void)setDynamicSize:(unint64_t)a3
{
  self->_dynamicSize = a3;
}

- (unint64_t)sharedSize
{
  return self->_sharedSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
