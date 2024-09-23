@implementation ASDBetaAppVersion

+ (ASDBetaAppVersion)versionWithBundleID:(id)a3 bundleVersion:(id)a4 andShortVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v10, v9, objc_msgSend(a1, "defaultPlatform"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASDBetaAppVersion *)v11;
}

+ (ASDBetaAppVersion)versionWithBundleID:(id)a3 bundleVersion:(id)a4 platform:(int64_t)a5 andShortVersion:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  const char *v13;
  _QWORD *v14;
  SEL v15;
  SEL v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (_QWORD *)objc_opt_new();
  v14 = v12;
  if (v12)
  {
    objc_setProperty_atomic_copy(v12, v13, v9, 8);
    objc_setProperty_atomic_copy(v14, v15, v10, 16);
    v14[3] = a5;
    objc_setProperty_atomic_copy(v14, v16, v11, 32);
  }

  return (ASDBetaAppVersion *)v14;
}

+ (int64_t)defaultPlatform
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ (%@) - Platform (%ld)"), self->_bundleID, self->_shortVersion, self->_bundleVersion, self->_platform);
}

- (BOOL)isEqual:(id)a3
{
  ASDBetaAppVersion *v4;
  uint64_t v5;
  NSString *bundleID;
  void *v7;
  NSString *bundleVersion;
  void *v9;
  NSString *shortVersion;
  void *v11;
  int64_t platform;
  BOOL v13;

  v4 = (ASDBetaAppVersion *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
      goto LABEL_7;
    bundleID = self->_bundleID;
    -[ASDBetaAppVersion bundleID](v4, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(bundleID) = -[NSString isEqualToString:](bundleID, "isEqualToString:", v7);

    if (!(_DWORD)bundleID)
      goto LABEL_7;
    bundleVersion = self->_bundleVersion;
    -[ASDBetaAppVersion bundleVersion](v4, "bundleVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(bundleVersion) = -[NSString isEqualToString:](bundleVersion, "isEqualToString:", v9);

    if (!(_DWORD)bundleVersion)
      goto LABEL_7;
    shortVersion = self->_shortVersion;
    -[ASDBetaAppVersion shortVersion](v4, "shortVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(shortVersion) = -[NSString isEqual:](shortVersion, "isEqual:", v11);

    if ((_DWORD)shortVersion)
    {
      platform = self->_platform;
      v13 = platform == -[ASDBetaAppVersion platform](v4, "platform");
    }
    else
    {
LABEL_7:
      v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDBetaAppVersion *v4;

  v4 = -[ASDBetaAppVersion init](+[ASDBetaAppVersion allocWithZone:](ASDBetaAppVersion, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v4->_bundleVersion, self->_bundleVersion);
  v4->_platform = self->_platform;
  objc_storeStrong((id *)&v4->_shortVersion, self->_shortVersion);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("A"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("B"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_platform, CFSTR("D"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortVersion, CFSTR("C"));

}

- (ASDBetaAppVersion)initWithCoder:(id)a3
{
  id v4;
  ASDBetaAppVersion *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *bundleVersion;
  uint64_t v10;
  NSString *shortVersion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDBetaAppVersion;
  v5 = -[ASDBetaAppVersion init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    v5->_platform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("D"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("C"));
    v10 = objc_claimAutoreleasedReturnValue();
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v10;

  }
  return v5;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)platform
{
  return self->_platform;
}

- (NSString)shortVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
