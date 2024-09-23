@implementation ASDClipCardMetricsEvent

- (ASDClipCardMetricsEvent)initWithClipBundleID:(id)a3
{
  id v5;
  ASDClipCardMetricsEvent *v6;
  ASDClipCardMetricsEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDClipCardMetricsEvent;
  v6 = -[ASDClipCardMetricsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleID, a3);

  return v7;
}

- (void)setReferralSource:(id)a3
{
  NSString *v5;
  NSString *referralSourceBundleID;
  id v7;

  objc_storeStrong((id *)&self->_referralSource, a3);
  v7 = a3;
  v5 = (NSString *)objc_msgSend(v7, "copy");
  referralSourceBundleID = self->_referralSourceBundleID;
  self->_referralSourceBundleID = v5;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDClipCardMetricsEvent)initWithCoder:(id)a3
{
  id v4;
  ASDClipCardMetricsEvent *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *itemID;
  uint64_t v10;
  NSString *referralSourceBundleID;
  uint64_t v12;
  NSString *referrerType;
  uint64_t v14;
  NSURL *sourceURL;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDClipCardMetricsEvent;
  v5 = -[ASDClipCardMetricsEvent init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemID"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referralSourceBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    referralSourceBundleID = v5->_referralSourceBundleID;
    v5->_referralSourceBundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referrerType"));
    v12 = objc_claimAutoreleasedReturnValue();
    referrerType = v5->_referrerType;
    v5->_referrerType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v14;

    v5->_thirdPartyWithNoAppReferrer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_thirdPartyWithNoAppReferrer"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("_itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referralSourceBundleID, CFSTR("_referralSourceBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerType, CFSTR("_referrerType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("_sourceURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_thirdPartyWithNoAppReferrer, CFSTR("_thirdPartyWithNoAppReferrer"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSString)referralSource
{
  return self->_referralSource;
}

- (NSString)referralSourceBundleID
{
  return self->_referralSourceBundleID;
}

- (void)setReferralSourceBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_referralSourceBundleID, a3);
}

- (NSString)referrerType
{
  return self->_referrerType;
}

- (void)setReferrerType:(id)a3
{
  objc_storeStrong((id *)&self->_referrerType, a3);
}

- (BOOL)thirdPartyWithNoAppReferrer
{
  return self->_thirdPartyWithNoAppReferrer;
}

- (void)setThirdPartyWithNoAppReferrer:(BOOL)a3
{
  self->_thirdPartyWithNoAppReferrer = a3;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_referrerType, 0);
  objc_storeStrong((id *)&self->_referralSourceBundleID, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
