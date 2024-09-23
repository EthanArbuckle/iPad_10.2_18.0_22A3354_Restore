@implementation MADVIVisualSearchGatingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIVisualSearchGatingRequest)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchGatingRequest *v5;
  uint64_t v6;
  NSNumber *queryID;
  uint64_t v8;
  CLLocation *location;
  uint64_t v10;
  NSURL *imageURL;
  uint64_t v12;
  NSURL *referralURL;
  uint64_t v14;
  NSNumber *imageType;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *domains;
  uint64_t v21;
  NSString *featureIdentifier;
  uint64_t v23;
  NSString *engagementSuggestionType;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MADVIVisualSearchGatingRequest;
  v5 = -[MADRequest initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QueryID"));
    v6 = objc_claimAutoreleasedReturnValue();
    queryID = v5->_queryID;
    v5->_queryID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Location"));
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReferralURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    referralURL = v5->_referralURL;
    v5->_referralURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageType"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("Domains"));
    v19 = objc_claimAutoreleasedReturnValue();
    domains = v5->_domains;
    v5->_domains = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FeatureIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EngagementSuggestionType"));
    v23 = objc_claimAutoreleasedReturnValue();
    engagementSuggestionType = v5->_engagementSuggestionType;
    v5->_engagementSuggestionType = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchGatingRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryID, CFSTR("QueryID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("Location"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageURL, CFSTR("ImageURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referralURL, CFSTR("ReferralURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageType, CFSTR("ImageType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domains, CFSTR("Domains"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureIdentifier, CFSTR("FeatureIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_engagementSuggestionType, CFSTR("EngagementSuggestionType"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  if (self->_queryID)
    objc_msgSend(v3, "appendFormat:", CFSTR("queryID: %@, "), self->_queryID);
  if (self->_location)
    objc_msgSend(v3, "appendFormat:", CFSTR("location: %@, "), self->_location);
  if (self->_imageURL)
    objc_msgSend(v3, "appendFormat:", CFSTR("imageURL: <redacted>, "));
  if (self->_referralURL)
    objc_msgSend(v3, "appendFormat:", CFSTR("referralURL: <redacted>, "));
  if (self->_imageType)
    objc_msgSend(v3, "appendFormat:", CFSTR("imageType: %@, "), self->_imageType);
  if (self->_domains)
    objc_msgSend(v3, "appendFormat:", CFSTR("domains: %@, "), self->_domains);
  if (self->_featureIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("featureIdentifier: %@, "), self->_featureIdentifier);
  if (self->_engagementSuggestionType)
    objc_msgSend(v3, "appendFormat:", CFSTR("engagementSuggestionType: %@, "), self->_engagementSuggestionType);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (NSNumber)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)referralURL
{
  return self->_referralURL;
}

- (void)setReferralURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (void)setEngagementSuggestionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
}

@end
