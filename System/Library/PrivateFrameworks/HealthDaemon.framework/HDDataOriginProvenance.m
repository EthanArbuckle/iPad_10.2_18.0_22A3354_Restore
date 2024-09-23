@implementation HDDataOriginProvenance

- (NSNumber)sourceID
{
  return self->_sourceID;
}

- (BOOL)isValid
{
  return self->_sourceID
      && self->_deviceID
      && self->_sourceVersion
      && self->_productType
      && self->_systemBuild
      && self->_timeZoneName != 0;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t syncProvenance;
  id v5;

  syncProvenance = self->_syncProvenance;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", syncProvenance, CFSTR("sync"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncIdentity, CFSTR("sync_identity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("product_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemBuild, CFSTR("build"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceVersion, CFSTR("source_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZoneName, CFSTR("tz_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceID, CFSTR("source_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceID, CFSTR("device_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contributorReference, CFSTR("contributor_reference"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.majorVersion, CFSTR("os_major_version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.minorVersion, CFSTR("os_minor_version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.patchVersion, CFSTR("os_patch_version"));

}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 80);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributorReference, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_productType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDataOriginProvenance)initWithCoder:(id)a3
{
  id v4;
  HDDataOriginProvenance *v5;
  uint64_t v6;
  NSString *productType;
  void *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *systemBuild;
  uint64_t v13;
  NSString *sourceVersion;
  uint64_t v15;
  NSString *timeZoneName;
  uint64_t v17;
  NSNumber *sourceID;
  uint64_t v19;
  NSNumber *deviceID;
  uint64_t v21;
  HDContributorReference *contributorReference;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  int64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDDataOriginProvenance;
  v5 = -[HDDataOriginProvenance init](&v29, sel_init);
  if (v5)
  {
    v5->_syncProvenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync"));
    v5->_syncIdentity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync_identity"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("product_type"));
    v6 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v6;

    if (!v5->_productType)
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentDeviceProductType");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v5->_productType;
      v5->_productType = (NSString *)v9;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
    v11 = objc_claimAutoreleasedReturnValue();
    systemBuild = v5->_systemBuild;
    v5->_systemBuild = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source_version"));
    v13 = objc_claimAutoreleasedReturnValue();
    sourceVersion = v5->_sourceVersion;
    v5->_sourceVersion = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tz_name"));
    v15 = objc_claimAutoreleasedReturnValue();
    timeZoneName = v5->_timeZoneName;
    v5->_timeZoneName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source_id"));
    v17 = objc_claimAutoreleasedReturnValue();
    sourceID = v5->_sourceID;
    v5->_sourceID = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device_id"));
    v19 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contributor_reference"));
    v21 = objc_claimAutoreleasedReturnValue();
    contributorReference = v5->_contributorReference;
    v5->_contributorReference = (HDContributorReference *)v21;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("os_major_version")))
    {
      v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("os_major_version"));
      v24 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("os_minor_version"));
      v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("os_patch_version"));
      v5->_operatingSystemVersion.majorVersion = v23;
      v5->_operatingSystemVersion.minorVersion = v24;
      v5->_operatingSystemVersion.patchVersion = v25;
    }
    else
    {
      HDVersionFromBuildStringForProductType(v5->_systemBuild, v5->_productType, &v27);
      *(_OWORD *)&v5->_operatingSystemVersion.majorVersion = v27;
      v5->_operatingSystemVersion.patchVersion = v28;
    }
  }

  return v5;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;

  v3 = self->_syncIdentity ^ self->_syncProvenance;
  v4 = v3 ^ -[NSString hash](self->_productType, "hash");
  v5 = -[NSString hash](self->_systemBuild, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_sourceID, "hash");
  v7 = -[NSNumber hash](self->_deviceID, "hash");
  v8 = v7 ^ -[HDContributorReference hash](self->_contributorReference, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_sourceVersion, "hash");
  return v9 ^ -[NSString hash](self->_timeZoneName, "hash") ^ (2654435761 * self->_operatingSystemVersion.majorVersion) ^ (2654435761 * self->_operatingSystemVersion.minorVersion) ^ (2654435761 * self->_operatingSystemVersion.patchVersion);
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDDataOriginProvenance *v5;
  uint64_t v6;
  NSString *productType;
  uint64_t v8;
  NSString *systemBuild;
  uint64_t v10;
  NSString *sourceVersion;
  uint64_t v12;
  NSString *timeZoneName;
  __int128 v14;

  v5 = -[HDDataOriginProvenance init](+[HDDataOriginProvenance allocWithZone:](HDDataOriginProvenance, "allocWithZone:"), "init");
  v5->_syncProvenance = self->_syncProvenance;
  v5->_syncIdentity = self->_syncIdentity;
  v6 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  productType = v5->_productType;
  v5->_productType = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_systemBuild, "copyWithZone:", a3);
  systemBuild = v5->_systemBuild;
  v5->_systemBuild = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_sourceVersion, "copyWithZone:", a3);
  sourceVersion = v5->_sourceVersion;
  v5->_sourceVersion = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
  timeZoneName = v5->_timeZoneName;
  v5->_timeZoneName = (NSString *)v12;

  objc_storeStrong((id *)&v5->_sourceID, self->_sourceID);
  objc_storeStrong((id *)&v5->_deviceID, self->_deviceID);
  objc_storeStrong((id *)&v5->_contributorReference, self->_contributorReference);
  v14 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  v5->_operatingSystemVersion.patchVersion = self->_operatingSystemVersion.patchVersion;
  *(_OWORD *)&v5->_operatingSystemVersion.majorVersion = v14;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSNumber *sourceID;
  NSNumber *v6;
  NSNumber *deviceID;
  NSNumber *v8;
  HDContributorReference *contributorReference;
  HDContributorReference *v10;
  NSString *productType;
  NSString *v12;
  NSString *systemBuild;
  NSString *v14;
  NSString *sourceVersion;
  NSString *v16;
  NSString *timeZoneName;
  NSString *v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_28;
  if (self->_syncProvenance != v4[1])
    goto LABEL_28;
  if (self->_syncIdentity != v4[2])
    goto LABEL_28;
  sourceID = self->_sourceID;
  v6 = (NSNumber *)v4[7];
  if (sourceID != v6 && (!v6 || !-[NSNumber isEqual:](sourceID, "isEqual:")))
    goto LABEL_28;
  deviceID = self->_deviceID;
  v8 = (NSNumber *)v4[8];
  if (deviceID != v8 && (!v8 || !-[NSNumber isEqual:](deviceID, "isEqual:")))
    goto LABEL_28;
  contributorReference = self->_contributorReference;
  v10 = (HDContributorReference *)v4[9];
  if (contributorReference != v10 && (!v10 || !-[HDContributorReference isEqual:](contributorReference, "isEqual:")))
    goto LABEL_28;
  productType = self->_productType;
  v12 = (NSString *)v4[3];
  if (productType != v12 && (!v12 || !-[NSString isEqualToString:](productType, "isEqualToString:")))
    goto LABEL_28;
  if (((systemBuild = self->_systemBuild, v14 = (NSString *)v4[4], systemBuild == v14)
     || v14 && -[NSString isEqualToString:](systemBuild, "isEqualToString:"))
    && ((sourceVersion = self->_sourceVersion, v16 = (NSString *)v4[5], sourceVersion == v16)
     || v16 && -[NSString isEqualToString:](sourceVersion, "isEqualToString:"))
    && ((timeZoneName = self->_timeZoneName, v18 = (NSString *)v4[6], timeZoneName == v18)
     || v18 && -[NSString isEqualToString:](timeZoneName, "isEqualToString:"))
    && self->_operatingSystemVersion.majorVersion == v4[10]
    && self->_operatingSystemVersion.minorVersion == v4[11])
  {
    v19 = self->_operatingSystemVersion.patchVersion == v4[12];
  }
  else
  {
LABEL_28:
    v19 = 0;
  }

  return v19;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

+ (id)dataProvenanceWithSyncProvenance:(int64_t)a3 syncIdentity:(int64_t)a4 productType:(id)a5 systemBuild:(id)a6 operatingSystemVersion:(id *)a7 sourceVersion:(id)a8 timeZoneName:(id)a9 sourceID:(id)a10 deviceID:(id)a11 contributorReference:(id)a12
{
  NSNumber *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HDDataOriginProvenance *v23;
  uint64_t v24;
  NSString *productType;
  uint64_t v26;
  NSString *systemBuild;
  __int128 v28;
  uint64_t v29;
  NSString *sourceVersion;
  uint64_t v31;
  NSString *timeZoneName;
  NSNumber *sourceID;
  NSNumber *v34;
  NSNumber *deviceID;
  NSNumber *v36;
  uint64_t v37;
  HDContributorReference *contributorReference;
  NSNumber *v40;
  id v41;

  v18 = (NSNumber *)a10;
  v40 = (NSNumber *)a11;
  v41 = a12;
  v19 = a9;
  v20 = a8;
  v21 = a6;
  v22 = a5;
  v23 = objc_alloc_init(HDDataOriginProvenance);
  v23->_syncProvenance = a3;
  v23->_syncIdentity = a4;
  v24 = objc_msgSend(v22, "copy");

  productType = v23->_productType;
  v23->_productType = (NSString *)v24;

  v26 = objc_msgSend(v21, "copy");
  systemBuild = v23->_systemBuild;
  v23->_systemBuild = (NSString *)v26;

  v28 = *(_OWORD *)&a7->var0;
  v23->_operatingSystemVersion.patchVersion = a7->var2;
  *(_OWORD *)&v23->_operatingSystemVersion.majorVersion = v28;
  v29 = objc_msgSend(v20, "copy");

  sourceVersion = v23->_sourceVersion;
  v23->_sourceVersion = (NSString *)v29;

  v31 = objc_msgSend(v19, "copy");
  timeZoneName = v23->_timeZoneName;
  v23->_timeZoneName = (NSString *)v31;

  sourceID = v23->_sourceID;
  v23->_sourceID = v18;
  v34 = v18;

  deviceID = v23->_deviceID;
  v23->_deviceID = v40;
  v36 = v40;

  v37 = objc_msgSend(v41, "copy");
  contributorReference = v23->_contributorReference;
  v23->_contributorReference = (HDContributorReference *)v37;

  return v23;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *sourceVersion;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v11 = *(_OWORD *)&self->_productType;
  v12 = *(_OWORD *)&self->_syncProvenance;
  v9 = *(_OWORD *)&self->_deviceID;
  v10 = *(_OWORD *)&self->_timeZoneName;
  sourceVersion = self->_sourceVersion;
  HKNSOperatingSystemVersionString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p syncProvenance=%ld, syncIdentity=%ld, productType=%@, systemBuild=%@, timeZone=%@, sourceID=%@, deviceID=%@, contributorReference=%@, sourceVersion=%@ operatingSystemVersion=%@>"), v4, self, v12, v11, v10, v9, sourceVersion, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contributorID
{
  return -[HDContributorReference persistentID](self->_contributorReference, "persistentID");
}

- (void)setSyncProvenance:(int64_t)a3
{
  self->_syncProvenance = a3;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(int64_t)a3
{
  self->_syncIdentity = a3;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOperatingSystemVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v3;
}

- (void)setSourceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTimeZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSourceID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceID, a3);
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (HDContributorReference)contributorReference
{
  return self->_contributorReference;
}

- (void)setContributorReference:(id)a3
{
  objc_storeStrong((id *)&self->_contributorReference, a3);
}

@end
