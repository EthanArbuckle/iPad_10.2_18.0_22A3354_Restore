@implementation HKFHIRVersion

- (HKFHIRVersion)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKFHIRVersion)initWithSemanticVersion:(id *)a3
{
  HKFHIRVersion *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFHIRVersion;
  result = -[HKFHIRVersion init](&v5, sel_init);
  if (result)
  {
    result->_majorVersion = a3->var0;
    result->_minorVersion = a3->var1;
    result->_patchVersion = a3->var2;
  }
  return result;
}

- (HKFHIRVersion)initWithInvalidVersionString:(id)a3
{
  id v4;
  HKFHIRVersion *v5;
  uint64_t v6;
  NSString *invalidVersionString;
  __int128 v9;
  uint64_t v10;

  v4 = a3;
  v9 = xmmword_19A44CB58;
  v10 = 0;
  v5 = -[HKFHIRVersion initWithSemanticVersion:](self, "initWithSemanticVersion:", &v9);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    invalidVersionString = v5->_invalidVersionString;
    v5->_invalidVersionString = (NSString *)v6;

  }
  return v5;
}

+ (id)versionFromVersionString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  HKFHIRVersion *v6;
  NSObject *v7;
  HKFHIRVersion *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  +[HKFHIRVersion versionFromVersionString:error:](HKFHIRVersion, "versionFromVersionString:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      +[HKFHIRVersion versionFromVersionString:].cold.1((uint64_t)v5, v7);
    v6 = -[HKFHIRVersion initWithInvalidVersionString:]([HKFHIRVersion alloc], "initWithInvalidVersionString:", v3);
  }
  v8 = v6;

  return v8;
}

+ (HKFHIRVersion)versionFromVersionString:(NSString *)versionString error:(NSError *)errorOut
{
  char v5;
  id v6;
  HKFHIRVersion *v7;
  HKFHIRVersion *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v16 = 0uLL;
  v17 = 0;
  v15 = 0;
  v5 = HKSemanticVersionByParsingString(versionString, &v16, (uint64_t)&v15);
  v6 = v15;
  if ((v5 & 1) != 0)
  {
    v7 = [HKFHIRVersion alloc];
    v13 = v16;
    v14 = v17;
    v8 = -[HKFHIRVersion initWithSemanticVersion:](v7, "initWithSemanticVersion:", &v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse: %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 3, v9, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (errorOut)
        *errorOut = (NSError *)objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
    }

    v8 = 0;
  }

  return v8;
}

- (HKFHIRRelease)FHIRRelease
{
  int64_t majorVersion;
  id *v3;

  majorVersion = self->_majorVersion;
  if (majorVersion == 4)
  {
    if (!self->_minorVersion)
    {
      v3 = (id *)&HKFHIRReleaseR4;
      return (HKFHIRRelease)*v3;
    }
    goto LABEL_6;
  }
  if (majorVersion != 1 || self->_minorVersion)
  {
LABEL_6:
    v3 = (id *)&HKFHIRReleaseUnknown;
    return (HKFHIRRelease)*v3;
  }
  v3 = (id *)&HKFHIRReleaseDSTU2;
  return (HKFHIRRelease)*v3;
}

+ (HKFHIRVersion)primaryDSTU2Version
{
  __int128 v3;
  uint64_t v4;

  v3 = xmmword_19A44CB70;
  v4 = 2;
  return (HKFHIRVersion *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSemanticVersion:", &v3);
}

+ (HKFHIRVersion)primaryR4Version
{
  __int128 v3;
  uint64_t v4;

  v3 = xmmword_19A44CB88;
  v4 = 1;
  return (HKFHIRVersion *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSemanticVersion:", &v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "requiresSecureCoding"))
  {
    objc_msgSend(v4, "encodeInteger:forKey:", self->_majorVersion, CFSTR("Major"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_minorVersion, CFSTR("Minor"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_patchVersion, CFSTR("Patch"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_invalidVersionString, CFSTR("InvalidVersionString"));
  }

}

- (HKFHIRVersion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKFHIRVersion *v6;
  HKFHIRVersion *v7;
  _QWORD v9[3];

  v4 = a3;
  if (objc_msgSend(v4, "requiresSecureCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InvalidVersionString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[HKFHIRVersion initWithInvalidVersionString:](self, "initWithInvalidVersionString:", v5);
    }
    else
    {
      v9[0] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Major"));
      v9[1] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Minor"));
      v9[2] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Patch"));
      v6 = -[HKFHIRVersion initWithSemanticVersion:](self, "initWithSemanticVersion:", v9);
    }
    self = v6;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKFHIRVersion *v4;
  HKFHIRVersion *v5;
  HKFHIRVersion *v6;
  int64_t majorVersion;
  int64_t minorVersion;
  int64_t patchVersion;
  NSString *invalidVersionString;
  NSString *v11;
  char v12;

  v4 = (HKFHIRVersion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_12;
  }
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  majorVersion = self->_majorVersion;
  if (majorVersion != -[HKFHIRVersion majorVersion](v6, "majorVersion"))
    goto LABEL_9;
  minorVersion = self->_minorVersion;
  if (minorVersion != -[HKFHIRVersion minorVersion](v6, "minorVersion"))
    goto LABEL_9;
  patchVersion = self->_patchVersion;
  if (patchVersion != -[HKFHIRVersion patchVersion](v6, "patchVersion"))
    goto LABEL_9;
  invalidVersionString = self->_invalidVersionString;
  v11 = v6->_invalidVersionString;
  if (invalidVersionString == v11)
  {
    v12 = 1;
    goto LABEL_10;
  }
  if (v11)
    v12 = -[NSString isEqualToString:](invalidVersionString, "isEqualToString:");
  else
LABEL_9:
    v12 = 0;
LABEL_10:

LABEL_12:
  return v12;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_minorVersion ^ self->_majorVersion ^ self->_patchVersion;
  return v2 ^ -[NSString hash](self->_invalidVersionString, "hash");
}

- (NSString)stringRepresentation
{
  NSString *invalidVersionString;

  invalidVersionString = self->_invalidVersionString;
  if (invalidVersionString)
    return invalidVersionString;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld.%ld"), self->_majorVersion, self->_minorVersion, self->_patchVersion);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSInteger)majorVersion
{
  return self->_majorVersion;
}

- (NSInteger)minorVersion
{
  return self->_minorVersion;
}

- (NSInteger)patchVersion
{
  return self->_patchVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidVersionString, 0);
}

+ (void)versionFromVersionString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Unable to parse: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
