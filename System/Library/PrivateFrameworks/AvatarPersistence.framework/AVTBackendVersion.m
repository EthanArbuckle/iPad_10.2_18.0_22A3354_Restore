@implementation AVTBackendVersion

+ (id)versionFileLocationForStoreLocation:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("avatars.version"));
}

+ (id)currentVersion
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBackendVersion:avatarKitVersion:", 0.6, 12.0);
}

- (AVTBackendVersion)initWithBackendVersion:(double)a3 avatarKitVersion:(double)a4
{
  AVTBackendVersion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTBackendVersion;
  result = -[AVTBackendVersion init](&v7, sel_init);
  if (result)
  {
    result->_backendVersion = a3;
    result->_avatarKitVersion = a4;
  }
  return result;
}

- (BOOL)saveToDiskAtLocation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "versionFileLocationForStoreLocation:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "writeToURL:options:error:", v8, 0, a4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)versionFromDiskAtLocation:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AVTBackendVersion *v12;
  AVTBackendVersion *v13;
  AVTBackendVersion *v14;

  objc_msgSend(a1, "versionFileLocationForStoreLocation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = [AVTBackendVersion alloc];
      objc_msgSend(v11, "doubleValue");
      v13 = -[AVTBackendVersion initWithBackendVersion:avatarKitVersion:](v12, "initWithBackendVersion:avatarKitVersion:");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Version object is not of expected class"));
      v13 = v11;
    }
    v14 = v13;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTBackendVersion)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("backendVersion"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("avatarKitVersion"));
  v8 = v7;

  return -[AVTBackendVersion initWithBackendVersion:avatarKitVersion:](self, "initWithBackendVersion:avatarKitVersion:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[AVTBackendVersion backendVersion](self, "backendVersion");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("backendVersion"));
  -[AVTBackendVersion avatarKitVersion](self, "avatarKitVersion");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("avatarKitVersion"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v6, "backendVersion"),
        v9 = v8,
        -[AVTBackendVersion backendVersion](self, "backendVersion"),
        v9 == v10))
  {
    objc_msgSend(v7, "avatarKitVersion");
    v12 = v11;
    -[AVTBackendVersion avatarKitVersion](self, "avatarKitVersion");
    v14 = v12 == v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTBackendVersion;
  -[AVTBackendVersion description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTBackendVersion backendVersion](self, "backendVersion");
  v6 = v5;
  -[AVTBackendVersion avatarKitVersion](self, "avatarKitVersion");
  objc_msgSend(v4, "appendFormat:", CFSTR(" backend:%2.2f avatarKit:%2.2f"), v6, v7);
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (double)backendVersion
{
  return self->_backendVersion;
}

- (double)avatarKitVersion
{
  return self->_avatarKitVersion;
}

@end
