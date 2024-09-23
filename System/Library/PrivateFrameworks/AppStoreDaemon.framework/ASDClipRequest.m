@implementation ASDClipRequest

- (ASDClipRequest)initWithDictionary:(id)a3
{
  id v4;
  ASDClipRequest *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  uint64_t v8;
  NSUUID *uniqueID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDClipRequest;
  v5 = -[ASDClipRequest init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDClipRequest)initWithCoder:(id)a3
{
  id v4;
  ASDClipRequest *v5;
  uint64_t v6;
  NSData *placeholderArtwork;
  uint64_t v8;
  NSUUID *uniqueID;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *dictionary;
  uint64_t v18;
  NSString *installSourceBundleID;
  uint64_t v20;
  NSString *referrerType;
  uint64_t v22;
  NSURL *sourceURL;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASDClipRequest;
  v5 = -[ASDClipRequest init](&v25, sel_init);
  if (v5)
  {
    v5->_prefetchDecryption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefetchDecryption"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_placeholderArtwork"));
    v6 = objc_claimAutoreleasedReturnValue();
    placeholderArtwork = v5->_placeholderArtwork;
    v5->_placeholderArtwork = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueID"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_dictionary"));
    v16 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_installSourceBundleID"));
    v18 = objc_claimAutoreleasedReturnValue();
    installSourceBundleID = v5->_installSourceBundleID;
    v5->_installSourceBundleID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referrerType"));
    v20 = objc_claimAutoreleasedReturnValue();
    referrerType = v5->_referrerType;
    v5->_referrerType = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v22;

    v5->_thirdPartyWithNoAppReferrer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_thirdPartyWithNoAppReferrer"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 prefetchDecryption;
  id v5;

  prefetchDecryption = self->_prefetchDecryption;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", prefetchDecryption, CFSTR("_prefetchDecryption"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeholderArtwork, CFSTR("_placeholderArtwork"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueID, CFSTR("_uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dictionary, CFSTR("_dictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installSourceBundleID, CFSTR("_installSourceBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerType, CFSTR("_referrerType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("_sourceURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_thirdPartyWithNoAppReferrer, CFSTR("_thirdPartyWithNoAppReferrer"));

}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSData)placeholderArtwork
{
  return self->_placeholderArtwork;
}

- (void)setPlaceholderArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderArtwork, a3);
}

- (BOOL)prefetchDecryption
{
  return self->_prefetchDecryption;
}

- (void)setPrefetchDecryption:(BOOL)a3
{
  self->_prefetchDecryption = a3;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSString)installSourceBundleID
{
  return self->_installSourceBundleID;
}

- (void)setInstallSourceBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_installSourceBundleID, a3);
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
  objc_storeStrong((id *)&self->_installSourceBundleID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_placeholderArtwork, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
