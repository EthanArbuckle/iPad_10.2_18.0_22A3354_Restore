@implementation ASDImpressionParamsConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *appAdamId;
  id v5;

  appAdamId = self->_appAdamId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appAdamId, CFSTR("1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adNetworkId, CFSTR("2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_campaignId, CFSTR("3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_impressionId, CFSTR("4"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceAppAdamId, CFSTR("5"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributionSignature, CFSTR("6"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceAppBundleId, CFSTR("7"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("8"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("9"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fidelityType, CFSTR("10"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processName, CFSTR("11"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceIdentifier, CFSTR("12"));

}

- (ASDImpressionParamsConfig)initWithCoder:(id)a3
{
  id v4;
  ASDImpressionParamsConfig *v5;
  uint64_t v6;
  NSNumber *appAdamId;
  uint64_t v8;
  NSString *adNetworkId;
  uint64_t v10;
  NSNumber *campaignId;
  uint64_t v12;
  NSString *impressionId;
  uint64_t v14;
  NSNumber *sourceAppAdamId;
  uint64_t v16;
  NSString *attributionSignature;
  uint64_t v18;
  NSString *sourceAppBundleId;
  uint64_t v20;
  NSString *version;
  uint64_t v22;
  NSNumber *timestamp;
  uint64_t v24;
  NSNumber *fidelityType;
  uint64_t v26;
  NSString *processName;
  uint64_t v28;
  NSNumber *sourceIdentifier;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASDImpressionParamsConfig;
  v5 = -[ASDImpressionParamsConfig init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("1"));
    v6 = objc_claimAutoreleasedReturnValue();
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("2"));
    v8 = objc_claimAutoreleasedReturnValue();
    adNetworkId = v5->_adNetworkId;
    v5->_adNetworkId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("3"));
    v10 = objc_claimAutoreleasedReturnValue();
    campaignId = v5->_campaignId;
    v5->_campaignId = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("4"));
    v12 = objc_claimAutoreleasedReturnValue();
    impressionId = v5->_impressionId;
    v5->_impressionId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("5"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceAppAdamId = v5->_sourceAppAdamId;
    v5->_sourceAppAdamId = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("6"));
    v16 = objc_claimAutoreleasedReturnValue();
    attributionSignature = v5->_attributionSignature;
    v5->_attributionSignature = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("7"));
    v18 = objc_claimAutoreleasedReturnValue();
    sourceAppBundleId = v5->_sourceAppBundleId;
    v5->_sourceAppBundleId = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("8"));
    v20 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("9"));
    v22 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("10"));
    v24 = objc_claimAutoreleasedReturnValue();
    fidelityType = v5->_fidelityType;
    v5->_fidelityType = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("11"));
    v26 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("12"));
    v28 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSNumber *)v28;

  }
  return v5;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_appAdamId, a3);
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
  objc_storeStrong((id *)&self->_adNetworkId, a3);
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (void)setImpressionId:(id)a3
{
  objc_storeStrong((id *)&self->_impressionId, a3);
}

- (NSNumber)sourceAppAdamId
{
  return self->_sourceAppAdamId;
}

- (void)setSourceAppAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAppAdamId, a3);
}

- (NSNumber)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSignature, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)sourceAppBundleId
{
  return self->_sourceAppBundleId;
}

- (void)setSourceAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAppBundleId, a3);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSNumber)fidelityType
{
  return self->_fidelityType;
}

- (void)setFidelityType:(id)a3
{
  objc_storeStrong((id *)&self->_fidelityType, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_fidelityType, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamId, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end
