@implementation MADVIVisualSearchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIVisualSearchRequest)initWithGatingResultItems:(id)a3 payload:(id)a4 documentObservations:(id)a5
{
  id v9;
  id v10;
  id v11;
  MADVIVisualSearchRequest *v12;
  MADVIVisualSearchRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADVIVisualSearchRequest;
  v12 = -[MADVIVisualSearchRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_gatingResultItems, a3);
    objc_storeStrong((id *)&v13->_gatingPayload, a4);
    objc_storeStrong((id *)&v13->_documentObservations, a5);
  }

  return v13;
}

- (MADVIVisualSearchRequest)initWithGatingResultItems:(id)a3 andPayload:(id)a4
{
  return -[MADVIVisualSearchRequest initWithGatingResultItems:payload:documentObservations:](self, "initWithGatingResultItems:payload:documentObservations:", a3, a4, 0);
}

- (MADVIVisualSearchRequest)init
{
  return -[MADVIVisualSearchRequest initWithGatingResultItems:payload:documentObservations:](self, "initWithGatingResultItems:payload:documentObservations:", MEMORY[0x1E0C9AA60], 0, 0);
}

- (MADVIVisualSearchRequest)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *gatingResultItems;
  uint64_t v11;
  NSData *gatingPayload;
  uint64_t v13;
  NSNumber *queryID;
  uint64_t v15;
  NSNumber *uiScale;
  uint64_t v17;
  CLLocation *location;
  uint64_t v19;
  NSURL *imageURL;
  uint64_t v21;
  NSURL *referralURL;
  uint64_t v23;
  NSNumber *imageType;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *catalogIDs;
  uint64_t v30;
  NSString *featureIdentifier;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *documentObservations;
  uint64_t v39;
  NSString *engagementSuggestionType;
  objc_super v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)MADVIVisualSearchRequest;
  v5 = -[MADRequest initWithCoder:](&v42, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("GatingResultItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    gatingResultItems = v5->_gatingResultItems;
    v5->_gatingResultItems = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GatingPayload"));
    v11 = objc_claimAutoreleasedReturnValue();
    gatingPayload = v5->_gatingPayload;
    v5->_gatingPayload = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QueryID"));
    v13 = objc_claimAutoreleasedReturnValue();
    queryID = v5->_queryID;
    v5->_queryID = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIScale"));
    v15 = objc_claimAutoreleasedReturnValue();
    uiScale = v5->_uiScale;
    v5->_uiScale = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Location"));
    v17 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReferralURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    referralURL = v5->_referralURL;
    v5->_referralURL = (NSURL *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageType"));
    v23 = objc_claimAutoreleasedReturnValue();
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("CatalogIDs"));
    v28 = objc_claimAutoreleasedReturnValue();
    catalogIDs = v5->_catalogIDs;
    v5->_catalogIDs = (NSArray *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FeatureIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v48[0] = objc_opt_class();
    v44 = 0;
    v45 = &v44;
    v46 = 0x2050000000;
    v33 = (void *)getVNDocumentObservationClass_softClass;
    v47 = getVNDocumentObservationClass_softClass;
    if (!getVNDocumentObservationClass_softClass)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __getVNDocumentObservationClass_block_invoke;
      v43[3] = &unk_1E97E2300;
      v43[4] = &v44;
      __getVNDocumentObservationClass_block_invoke((uint64_t)v43);
      v33 = (void *)v45[3];
    }
    v34 = objc_retainAutorelease(v33);
    _Block_object_dispose(&v44, 8);
    v48[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("DocumentObservations"));
    v37 = objc_claimAutoreleasedReturnValue();
    documentObservations = v5->_documentObservations;
    v5->_documentObservations = (NSArray *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EngagementSuggestionType"));
    v39 = objc_claimAutoreleasedReturnValue();
    engagementSuggestionType = v5->_engagementSuggestionType;
    v5->_engagementSuggestionType = (NSString *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_gatingResultItems, CFSTR("GatingResultItems"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_gatingPayload, CFSTR("GatingPayload"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryID, CFSTR("QueryID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uiScale, CFSTR("UIScale"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("Location"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageURL, CFSTR("ImageURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referralURL, CFSTR("ReferralURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageType, CFSTR("ImageType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_catalogIDs, CFSTR("CatalogIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureIdentifier, CFSTR("FeatureIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentObservations, CFSTR("DocumentObservations"));
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

  objc_msgSend(v3, "appendFormat:", CFSTR("gatingResultItems: %@, "), self->_gatingResultItems);
  objc_msgSend(v3, "appendFormat:", CFSTR("gatingPayload: %@, "), self->_gatingPayload);
  if (self->_queryID)
    objc_msgSend(v3, "appendFormat:", CFSTR("queryID: %@, "), self->_queryID);
  if (self->_uiScale)
    objc_msgSend(v3, "appendFormat:", CFSTR("uiScale: %@, "), self->_uiScale);
  if (self->_location)
    objc_msgSend(v3, "appendFormat:", CFSTR("location: %@, "), self->_location);
  if (self->_imageURL)
    objc_msgSend(v3, "appendFormat:", CFSTR("imageURL: <redacted>, "));
  if (self->_referralURL)
    objc_msgSend(v3, "appendFormat:", CFSTR("referralURL: <redacted>, "));
  if (self->_imageType)
    objc_msgSend(v3, "appendFormat:", CFSTR("imageType: %@, "), self->_imageType);
  if (self->_catalogIDs)
    objc_msgSend(v3, "appendFormat:", CFSTR("catalogIDs: %@, "), self->_catalogIDs);
  if (self->_featureIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("featureIdentifier: %@, "), self->_featureIdentifier);
  if (self->_documentObservations)
    objc_msgSend(v3, "appendFormat:", CFSTR("documentObservations: %@, "), self->_documentObservations);
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

- (NSArray)gatingResultItems
{
  return self->_gatingResultItems;
}

- (NSData)gatingPayload
{
  return self->_gatingPayload;
}

- (NSArray)documentObservations
{
  return self->_documentObservations;
}

- (NSNumber)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)uiScale
{
  return self->_uiScale;
}

- (void)setUiScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)referralURL
{
  return self->_referralURL;
}

- (void)setReferralURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)catalogIDs
{
  return self->_catalogIDs;
}

- (void)setCatalogIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (void)setEngagementSuggestionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_catalogIDs, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uiScale, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  objc_storeStrong((id *)&self->_gatingPayload, 0);
  objc_storeStrong((id *)&self->_gatingResultItems, 0);
}

@end
