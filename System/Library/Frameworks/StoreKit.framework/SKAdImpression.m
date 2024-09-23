@implementation SKAdImpression

- (SKAdImpression)initWithSourceAppStoreItemIdentifier:(NSNumber *)sourceAppStoreItemIdentifier advertisedAppStoreItemIdentifier:(NSNumber *)advertisedAppStoreItemIdentifier adNetworkIdentifier:(NSString *)adNetworkIdentifier adCampaignIdentifier:(NSNumber *)adCampaignIdentifier adImpressionIdentifier:(NSString *)adImpressionIdentifier timestamp:(NSNumber *)timestamp signature:(NSString *)signature version:(NSString *)version
{
  NSString *v17;
  SKAdImpression *v18;
  SKAdImpression *v19;
  NSString *v21;
  NSNumber *v22;
  NSString *v23;
  NSNumber *v24;
  NSString *v25;
  NSNumber *v26;
  NSNumber *v27;
  objc_super v28;

  v27 = sourceAppStoreItemIdentifier;
  v26 = advertisedAppStoreItemIdentifier;
  v25 = adNetworkIdentifier;
  v24 = adCampaignIdentifier;
  v23 = adImpressionIdentifier;
  v22 = timestamp;
  v21 = signature;
  v17 = version;
  v28.receiver = self;
  v28.super_class = (Class)SKAdImpression;
  v18 = -[SKAdImpression init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceAppStoreItemIdentifier, sourceAppStoreItemIdentifier);
    objc_storeStrong((id *)&v19->_advertisedAppStoreItemIdentifier, advertisedAppStoreItemIdentifier);
    objc_storeStrong((id *)&v19->_adNetworkIdentifier, adNetworkIdentifier);
    objc_storeStrong((id *)&v19->_adCampaignIdentifier, adCampaignIdentifier);
    objc_storeStrong((id *)&v19->_adImpressionIdentifier, adImpressionIdentifier);
    objc_storeStrong((id *)&v19->_timestamp, timestamp);
    objc_storeStrong((id *)&v19->_signature, signature);
    objc_storeStrong((id *)&v19->_version, version);
  }

  return v19;
}

- (NSNumber)sourceAppStoreItemIdentifier
{
  return self->_sourceAppStoreItemIdentifier;
}

- (void)setSourceAppStoreItemIdentifier:(NSNumber *)sourceAppStoreItemIdentifier
{
  objc_storeStrong((id *)&self->_sourceAppStoreItemIdentifier, sourceAppStoreItemIdentifier);
}

- (NSNumber)advertisedAppStoreItemIdentifier
{
  return self->_advertisedAppStoreItemIdentifier;
}

- (void)setAdvertisedAppStoreItemIdentifier:(NSNumber *)advertisedAppStoreItemIdentifier
{
  objc_storeStrong((id *)&self->_advertisedAppStoreItemIdentifier, advertisedAppStoreItemIdentifier);
}

- (NSString)adNetworkIdentifier
{
  return self->_adNetworkIdentifier;
}

- (void)setAdNetworkIdentifier:(NSString *)adNetworkIdentifier
{
  objc_storeStrong((id *)&self->_adNetworkIdentifier, adNetworkIdentifier);
}

- (NSNumber)adCampaignIdentifier
{
  return self->_adCampaignIdentifier;
}

- (void)setAdCampaignIdentifier:(NSNumber *)adCampaignIdentifier
{
  objc_storeStrong((id *)&self->_adCampaignIdentifier, adCampaignIdentifier);
}

- (NSNumber)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(NSNumber *)sourceIdentifier
{
  objc_storeStrong((id *)&self->_sourceIdentifier, sourceIdentifier);
}

- (NSString)adImpressionIdentifier
{
  return self->_adImpressionIdentifier;
}

- (void)setAdImpressionIdentifier:(NSString *)adImpressionIdentifier
{
  objc_storeStrong((id *)&self->_adImpressionIdentifier, adImpressionIdentifier);
}

- (NSString)adType
{
  return self->_adType;
}

- (void)setAdType:(NSString *)adType
{
  objc_storeStrong((id *)&self->_adType, adType);
}

- (NSString)adDescription
{
  return self->_adDescription;
}

- (void)setAdDescription:(NSString *)adDescription
{
  objc_storeStrong((id *)&self->_adDescription, adDescription);
}

- (NSString)adPurchaserName
{
  return self->_adPurchaserName;
}

- (void)setAdPurchaserName:(NSString *)adPurchaserName
{
  objc_storeStrong((id *)&self->_adPurchaserName, adPurchaserName);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(NSNumber *)timestamp
{
  objc_storeStrong((id *)&self->_timestamp, timestamp);
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(NSString *)signature
{
  objc_storeStrong((id *)&self->_signature, signature);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(NSString *)version
{
  objc_storeStrong((id *)&self->_version, version);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_adPurchaserName, 0);
  objc_storeStrong((id *)&self->_adDescription, 0);
  objc_storeStrong((id *)&self->_adType, 0);
  objc_storeStrong((id *)&self->_adImpressionIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_adCampaignIdentifier, 0);
  objc_storeStrong((id *)&self->_adNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_advertisedAppStoreItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppStoreItemIdentifier, 0);
}

@end
