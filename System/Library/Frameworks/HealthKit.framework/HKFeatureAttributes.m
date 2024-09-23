@implementation HKFeatureAttributes

+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HKFeatureAttributes *v7;

  v3 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentOSBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKFeatureUpdateVersionFromMajorVersionAndBuildVersion((uint64_t)v3, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKFeatureAttributes initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:]([HKFeatureAttributes alloc], "initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:", v3, v6, 0, 0);
  return v7;
}

+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3 watchDeviceIdentifier:(id)a4 phoneDeviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isAppleWatch"))
    v12 = v9;
  else
    v12 = v8;
  v13 = v12;

  objc_msgSend(a1, "featureAttributesDerivedFromOSBuildAndFeatureVersion:deviceIdentifier:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3 deviceIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKFeatureAttributes *v11;

  v5 = a4;
  v6 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentOSBuild");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKFeatureUpdateVersionFromMajorVersionAndBuildVersion((uint64_t)v6, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKUDIDeviceIdentifierFromDeviceIdentifierAndBatchNumber(v5, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKFeatureAttributes initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:]([HKFeatureAttributes alloc], "initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:", v6, v9, v10, CFSTR("2024"));
  return v11;
}

- (HKFeatureAttributes)initWithFeatureVersion:(id)a3 updateVersion:(id)a4 UDIDeviceIdentifier:(id)a5 yearOfRelease:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKFeatureAttributes *v14;
  uint64_t v15;
  NSString *featureVersion;
  uint64_t v17;
  NSString *updateVersion;
  uint64_t v19;
  NSString *UDIDeviceIdentifier;
  uint64_t v21;
  NSString *yearOfRelease;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKFeatureAttributes;
  v14 = -[HKFeatureAttributes init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    featureVersion = v14->_featureVersion;
    v14->_featureVersion = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    updateVersion = v14->_updateVersion;
    v14->_updateVersion = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    UDIDeviceIdentifier = v14->_UDIDeviceIdentifier;
    v14->_UDIDeviceIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    yearOfRelease = v14->_yearOfRelease;
    v14->_yearOfRelease = (NSString *)v21;

  }
  return v14;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p featureVersion:%@ updateVersion:%@ UDI:%@ year:%@>"), objc_opt_class(), self, self->_featureVersion, self->_updateVersion, self->_UDIDeviceIdentifier, self->_yearOfRelease);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  NSString *featureVersion;
  NSString *v8;
  NSString *updateVersion;
  NSString *v10;
  NSString *UDIDeviceIdentifier;
  NSString *v12;
  NSString *yearOfRelease;
  NSString *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKFeatureAttributes;
  if (!-[HKFeatureAttributes isEqual:](&v16, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_19;
    }
    v6 = v4;
    featureVersion = self->_featureVersion;
    v8 = (NSString *)v6[1];
    if (featureVersion != v8 && (!v8 || !-[NSString isEqualToString:](featureVersion, "isEqualToString:")))
      goto LABEL_17;
    updateVersion = self->_updateVersion;
    v10 = (NSString *)v6[2];
    if (updateVersion != v10 && (!v10 || !-[NSString isEqualToString:](updateVersion, "isEqualToString:")))
      goto LABEL_17;
    UDIDeviceIdentifier = self->_UDIDeviceIdentifier;
    v12 = (NSString *)v6[3];
    if (UDIDeviceIdentifier != v12 && (!v12 || !-[NSString isEqualToString:](UDIDeviceIdentifier, "isEqualToString:")))
      goto LABEL_17;
    yearOfRelease = self->_yearOfRelease;
    v14 = (NSString *)v6[4];
    if (yearOfRelease == v14)
    {
      v5 = 1;
      goto LABEL_18;
    }
    if (v14)
      v5 = -[NSString isEqualToString:](yearOfRelease, "isEqualToString:");
    else
LABEL_17:
      v5 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v5 = 1;
LABEL_19:

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_featureVersion, "hash");
  v4 = -[NSString hash](self->_updateVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_UDIDeviceIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_yearOfRelease, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAttributes)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAttributes *v5;
  uint64_t v6;
  NSString *featureVersion;
  uint64_t v8;
  NSString *updateVersion;
  uint64_t v10;
  NSString *UDIDeviceIdentifier;
  uint64_t v12;
  NSString *yearOfRelease;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKFeatureAttributes;
  v5 = -[HKFeatureAttributes init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    featureVersion = v5->_featureVersion;
    v5->_featureVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    updateVersion = v5->_updateVersion;
    v5->_updateVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UDIDeviceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    UDIDeviceIdentifier = v5->_UDIDeviceIdentifier;
    v5->_UDIDeviceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("yearOfRelease"));
    v12 = objc_claimAutoreleasedReturnValue();
    yearOfRelease = v5->_yearOfRelease;
    v5->_yearOfRelease = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureVersion;
  id v5;

  featureVersion = self->_featureVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureVersion, CFSTR("featureVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updateVersion, CFSTR("updateVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UDIDeviceIdentifier, CFSTR("UDIDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_yearOfRelease, CFSTR("yearOfRelease"));

}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (NSString)updateVersion
{
  return self->_updateVersion;
}

- (NSString)UDIDeviceIdentifier
{
  return self->_UDIDeviceIdentifier;
}

- (NSString)yearOfRelease
{
  return self->_yearOfRelease;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearOfRelease, 0);
  objc_storeStrong((id *)&self->_UDIDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_updateVersion, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
}

@end
