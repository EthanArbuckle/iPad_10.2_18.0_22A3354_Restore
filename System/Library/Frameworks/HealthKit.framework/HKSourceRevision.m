@implementation HKSourceRevision

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKSource *source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.majorVersion, CFSTR("operatingSystemMajorVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.minorVersion, CFSTR("operatingSystemMinorVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.patchVersion, CFSTR("operatingSystemPatchVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));

}

- (HKSourceRevision)initWithSource:(HKSource *)source version:(NSString *)version productType:(NSString *)productType operatingSystemVersion:(NSOperatingSystemVersion *)operatingSystemVersion
{
  NSString *v10;
  NSString *v11;
  HKSourceRevision *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  __int128 v17;

  v10 = version;
  v11 = productType;
  v12 = -[HKSourceRevision _initWithSource:](self, "_initWithSource:", source);
  if (v12)
  {
    v13 = -[NSString copy](v10, "copy");
    v14 = v12->_version;
    v12->_version = (NSString *)v13;

    v15 = -[NSString copy](v11, "copy");
    v16 = v12->_productType;
    v12->_productType = (NSString *)v15;

    v17 = *(_OWORD *)&operatingSystemVersion->majorVersion;
    v12->_operatingSystemVersion.patchVersion = operatingSystemVersion->patchVersion;
    *(_OWORD *)&v12->_operatingSystemVersion.majorVersion = v17;
  }

  return v12;
}

- (id)_initWithSource:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  HKSourceRevision *v7;
  uint64_t v8;
  HKSource *source;
  HKSourceRevision *v10;
  objc_super v12;

  v4 = a3;
  v6 = HKProgramSDKAtLeast(0x7E00901FFFFFFFFLL, v5);
  if (!v4 && v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid source is required."));
  v12.receiver = self;
  v12.super_class = (Class)HKSourceRevision;
  v7 = -[HKSourceRevision init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v4, "copy");
    source = v7->_source;
    v7->_source = (HKSource *)v8;

    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (HKSource)source
{
  return (HKSource *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)productType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSOperatingSystemVersion)operatingSystemVersion
{
  NSOperatingSystemVersion *result;

  objc_copyStruct(retstr, &self->_operatingSystemVersion, 24, 1, 0);
  return result;
}

- (id)asJSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSourceRevision source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asJSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("source"));

  -[HKSourceRevision version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("version"));

  -[HKSourceRevision productType](self, "productType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("productType"));

  -[HKSourceRevision operatingSystemVersion](self, "operatingSystemVersion");
  HKNSOperatingSystemVersionString(v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("operatingSystemVersion"));

  return v3;
}

- (HKSourceRevision)init
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

- (HKSourceRevision)initWithSource:(HKSource *)source version:(NSString *)version
{
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v5 = *(_OWORD *)&HKSourceRevisionAnyOperatingSystem.majorVersion;
  return -[HKSourceRevision initWithSource:version:productType:operatingSystemVersion:](self, "initWithSource:version:productType:operatingSystemVersion:", source, version, CFSTR("HKSourceRevisionAnyProductType"), &v5);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKSource *source;
  HKSource *v6;
  NSString *version;
  NSString *v8;
  NSString *productType;
  NSString *v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0
     && ((source = self->_source, v6 = (HKSource *)v4[1], source == v6) || v6
                                                                        && -[HKSource isEqual:](source, "isEqual:"))
     && ((version = self->_version, v8 = (NSString *)v4[2], version == v8)
      || v8 && -[NSString isEqualToString:](version, "isEqualToString:"))
     && ((productType = self->_productType, v10 = (NSString *)v4[3], productType == v10)
      || v10 && -[NSString isEqualToString:](productType, "isEqualToString:"))
     && self->_operatingSystemVersion.majorVersion == v4[4]
     && self->_operatingSystemVersion.minorVersion == v4[5]
     && self->_operatingSystemVersion.patchVersion == v4[6];

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[HKSource hash](self->_source, "hash");
  v4 = -[NSString hash](self->_version, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_productType, "hash") ^ (2654435761 * self->_operatingSystemVersion.majorVersion) ^ (2654435761 * self->_operatingSystemVersion.minorVersion) ^ (2654435761 * self->_operatingSystemVersion.patchVersion);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *version;
  NSString *productType;
  void *v10;
  void *v11;
  $A44FF20282FB96BA82CF1B0FF6945C38 operatingSystemVersion;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSource name](self->_source, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  productType = self->_productType;
  operatingSystemVersion = self->_operatingSystemVersion;
  HKNSOperatingSystemVersionString(&operatingSystemVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name:%@, bundle:%@, version:%@, productType:%@, operatingSystemVersion:%@>"), v5, v6, v7, version, productType, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setSource:(id)a3
{
  HKSource *v4;
  HKSource *source;

  v4 = (HKSource *)objc_msgSend(a3, "copy");
  source = self->_source;
  self->_source = v4;

}

- (void)_setVersion:(id)a3
{
  NSString *v4;
  NSString *version;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  version = self->_version;
  self->_version = v4;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSourceRevision;
  return -[HKSourceRevision init](&v3, sel_init);
}

- (HKSourceRevision)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKSourceRevision *v8;
  _QWORD v10[3];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operatingSystemMajorVersion"));
    v10[1] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operatingSystemMinorVersion"));
    v10[2] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operatingSystemPatchVersion"));
    self = -[HKSourceRevision initWithSource:version:productType:operatingSystemVersion:](self, "initWithSource:version:productType:operatingSystemVersion:", v5, v6, v7, v10);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
