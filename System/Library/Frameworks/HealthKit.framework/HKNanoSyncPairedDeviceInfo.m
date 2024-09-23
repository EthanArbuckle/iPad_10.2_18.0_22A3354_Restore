@implementation HKNanoSyncPairedDeviceInfo

- (HKNanoSyncPairedDeviceInfo)initWithSourceBundleIdentifier:(id)a3 systemBuildVersion:(id)a4 productType:(id)a5 active:(BOOL)a6 restoreComplete:(BOOL)a7 protocolVersion:(int)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  HKNanoSyncPairedDeviceInfo *v17;
  uint64_t v18;
  NSString *sourceBundleIdentifier;
  uint64_t v20;
  NSString *systemBuildVersion;
  uint64_t v22;
  NSString *productType;
  objc_super v25;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKNanoSyncPairedDeviceInfo;
  v17 = -[HKNanoSyncPairedDeviceInfo init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    sourceBundleIdentifier = v17->_sourceBundleIdentifier;
    v17->_sourceBundleIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    systemBuildVersion = v17->_systemBuildVersion;
    v17->_systemBuildVersion = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    productType = v17->_productType;
    v17->_productType = (NSString *)v22;

    if (v10)
      v17->_state |= 1uLL;
    if (v9)
      v17->_state |= 2uLL;
    v17->_protocolVersion = a8;
  }

  return v17;
}

- (BOOL)isActive
{
  return self->_state & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *sourceBundleIdentifier;
  NSString *v7;
  NSString *systemBuildVersion;
  NSString *v9;
  NSString *productType;
  NSString *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    v7 = (NSString *)v5[1];
    v12 = (sourceBundleIdentifier == v7 || v7
                                        && -[NSString isEqualToString:](sourceBundleIdentifier, "isEqualToString:"))
       && ((systemBuildVersion = self->_systemBuildVersion, v9 = (NSString *)v5[2], systemBuildVersion == v9)
        || v9 && -[NSString isEqualToString:](systemBuildVersion, "isEqualToString:"))
       && ((productType = self->_productType, v11 = (NSString *)v5[3], productType == v11)
        || v11 && -[NSString isEqualToString:](productType, "isEqualToString:"))
       && self->_state == v5[4]
       && self->_protocolVersion == *((_DWORD *)v5 + 10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

- (BOOL)isRestoreComplete
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_sourceBundleIdentifier, "hash");
  v4 = v3 ^ (2 * -[NSString hash](self->_systemBuildVersion, "hash"));
  return v4 ^ (4 * -[NSString hash](self->_productType, "hash")) ^ (8 * self->_state) ^ (16 * self->_protocolVersion);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *productType;
  _BOOL4 v6;
  const char *v7;
  __int128 v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v9 = *(_OWORD *)&self->_sourceBundleIdentifier;
  productType = self->_productType;
  v6 = -[HKNanoSyncPairedDeviceInfo isRestoreComplete](self, "isRestoreComplete");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p source=\"%@\" build=\"%@\" product=%@ restored=%s protocol=%d>"), v4, self, v9, productType, v7, self->_protocolVersion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNanoSyncPairedDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  HKNanoSyncPairedDeviceInfo *v5;
  uint64_t v6;
  NSString *sourceBundleIdentifier;
  uint64_t v8;
  NSString *systemBuildVersion;
  uint64_t v10;
  NSString *productType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKNanoSyncPairedDeviceInfo;
  v5 = -[HKNanoSyncPairedDeviceInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
    v8 = objc_claimAutoreleasedReturnValue();
    systemBuildVersion = v5->_systemBuildVersion;
    v5->_systemBuildVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v10 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v10;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_protocolVersion = objc_msgSend(v4, "decodeIntForKey:", CFSTR("protocol"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sourceBundleIdentifier;
  id v5;

  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceBundleIdentifier, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemBuildVersion, CFSTR("build"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_protocolVersion, CFSTR("protocol"));

}

@end
