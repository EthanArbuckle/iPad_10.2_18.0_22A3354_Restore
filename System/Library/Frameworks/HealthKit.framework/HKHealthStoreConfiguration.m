@implementation HKHealthStoreConfiguration

- (HKHealthStoreConfiguration)initWithSourceBundleIdentifier:(id)a3 sourceVersion:(id)a4 debugIdentifier:(id)a5 profileIdentifier:(id)a6 applicationSDKVersionToken:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKHealthStoreConfiguration *v16;
  uint64_t v17;
  NSString *sourceBundleIdentifier;
  uint64_t v19;
  NSString *sourceVersion;
  uint64_t v21;
  NSString *debugIdentifier;
  uint64_t v23;
  HKProfileIdentifier *profileIdentifier;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKHealthStoreConfiguration;
  v16 = -[HKHealthStoreConfiguration init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    sourceBundleIdentifier = v16->_sourceBundleIdentifier;
    v16->_sourceBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    sourceVersion = v16->_sourceVersion;
    v16->_sourceVersion = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    debugIdentifier = v16->_debugIdentifier;
    v16->_debugIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    profileIdentifier = v16->_profileIdentifier;
    v16->_profileIdentifier = (HKProfileIdentifier *)v23;

    v16->_applicationSDKVersionToken = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHealthStoreConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKHealthStoreConfiguration *v5;
  uint64_t v6;
  NSString *sourceBundleIdentifier;
  uint64_t v8;
  NSString *sourceVersion;
  uint64_t v10;
  NSString *debugIdentifier;
  uint64_t v12;
  HKProfileIdentifier *profileIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKHealthStoreConfiguration;
  v5 = -[HKHealthStoreConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sbid"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sver"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceVersion = v5->_sourceVersion;
    v5->_sourceVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dbid"));
    v10 = objc_claimAutoreleasedReturnValue();
    debugIdentifier = v5->_debugIdentifier;
    v5->_debugIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
    v12 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (HKProfileIdentifier *)v12;

    v5->_applicationSDKVersionToken = HKBitPatternCastSignedToUnsignedInt64(objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sdkv")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sourceBundleIdentifier;
  id v5;

  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceBundleIdentifier, CFSTR("sbid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceVersion, CFSTR("sver"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debugIdentifier, CFSTR("dbid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileIdentifier, CFSTR("pid"));
  objc_msgSend(v5, "encodeInt64:forKey:", HKBitPatternCastUnsignedToSignedInt64(self->_applicationSDKVersionToken), CFSTR("sdkv"));

}

- (BOOL)isEqual:(id)a3
{
  HKHealthStoreConfiguration *v4;
  NSString *sourceBundleIdentifier;
  NSString *v6;
  NSString *sourceVersion;
  NSString *v8;
  NSString *debugIdentifier;
  NSString *v10;
  HKProfileIdentifier *profileIdentifier;
  HKProfileIdentifier *v12;
  BOOL v13;

  v4 = (HKHealthStoreConfiguration *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    v6 = v4->_sourceBundleIdentifier;
    if (sourceBundleIdentifier != v6
      && (!v6 || !-[NSString isEqualToString:](sourceBundleIdentifier, "isEqualToString:")))
    {
      goto LABEL_16;
    }
    if (((sourceVersion = self->_sourceVersion, v8 = v4->_sourceVersion, sourceVersion == v8)
       || v8 && -[NSString isEqualToString:](sourceVersion, "isEqualToString:"))
      && ((debugIdentifier = self->_debugIdentifier, v10 = v4->_debugIdentifier, debugIdentifier == v10)
       || v10 && -[NSString isEqualToString:](debugIdentifier, "isEqualToString:"))
      && ((profileIdentifier = self->_profileIdentifier, v12 = v4->_profileIdentifier, profileIdentifier == v12)
       || v12 && -[HKProfileIdentifier isEqual:](profileIdentifier, "isEqual:")))
    {
      v13 = self->_applicationSDKVersionToken == v4->_applicationSDKVersionToken;
    }
    else
    {
LABEL_16:
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_sourceBundleIdentifier, "hash");
  v4 = -[NSString hash](self->_sourceVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_debugIdentifier, "hash");
  return v4 ^ v5 ^ -[HKProfileIdentifier hash](self->_profileIdentifier, "hash");
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (unint64_t)applicationSDKVersionToken
{
  return self->_applicationSDKVersionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

@end
