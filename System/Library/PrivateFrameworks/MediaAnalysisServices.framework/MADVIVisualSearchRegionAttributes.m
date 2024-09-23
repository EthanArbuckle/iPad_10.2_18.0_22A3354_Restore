@implementation MADVIVisualSearchRegionAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchRegionAttributes)initWithDomain:(id)a3 knowledgeGraphID:(id)a4 title:(id)a5 thumbnailURL:(id)a6 thumbnailAspectRatio:(float)a7 shortDescription:(id)a8 detailedDescription:(id)a9 webURL:(id)a10 knowledgeProperties:(id)a11
{
  id v19;
  MADVIVisualSearchRegionAttributes *v20;
  MADVIVisualSearchRegionAttributes *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a8;
  v24 = a9;
  v23 = a10;
  v19 = a11;
  v30.receiver = self;
  v30.super_class = (Class)MADVIVisualSearchRegionAttributes;
  v20 = -[MADVIVisualSearchRegionAttributes init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_domain, a3);
    objc_storeStrong((id *)&v21->_knowledgeGraphID, a4);
    objc_storeStrong((id *)&v21->_title, a5);
    objc_storeStrong((id *)&v21->_thumbnailURL, a6);
    v21->_thumbnailAspectRatio = a7;
    objc_storeStrong((id *)&v21->_shortDescription, a8);
    objc_storeStrong((id *)&v21->_detailedDescription, a9);
    objc_storeStrong((id *)&v21->_webURL, a10);
    objc_storeStrong((id *)&v21->_knowledgeProperties, a11);
  }

  return v21;
}

- (MADVIVisualSearchRegionAttributes)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchRegionAttributes *v5;
  uint64_t v6;
  NSString *domain;
  uint64_t v8;
  NSString *knowledgeGraphID;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSURL *thumbnailURL;
  float v14;
  uint64_t v15;
  NSString *shortDescription;
  uint64_t v17;
  NSString *detailedDescription;
  uint64_t v19;
  NSURL *webURL;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *knowledgeProperties;
  uint64_t v26;
  MADVIVisualSearchThirdPartyObject *thirdPartyObject;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MADVIVisualSearchRegionAttributes;
  v5 = -[MADVIVisualSearchRegionAttributes init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Domain"));
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KnowledgeGraphID"));
    v8 = objc_claimAutoreleasedReturnValue();
    knowledgeGraphID = v5->_knowledgeGraphID;
    v5->_knowledgeGraphID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ThumbnailURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ThumbnailAspectRatio"));
    v5->_thumbnailAspectRatio = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShortDescription"));
    v15 = objc_claimAutoreleasedReturnValue();
    shortDescription = v5->_shortDescription;
    v5->_shortDescription = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DetailedDescription"));
    v17 = objc_claimAutoreleasedReturnValue();
    detailedDescription = v5->_detailedDescription;
    v5->_detailedDescription = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("KnowledgeProperties"));
    v24 = objc_claimAutoreleasedReturnValue();
    knowledgeProperties = v5->_knowledgeProperties;
    v5->_knowledgeProperties = (NSDictionary *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ThirdPartyObject"));
    v26 = objc_claimAutoreleasedReturnValue();
    thirdPartyObject = v5->_thirdPartyObject;
    v5->_thirdPartyObject = (MADVIVisualSearchThirdPartyObject *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domain;
  double v5;
  id v6;

  domain = self->_domain;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", domain, CFSTR("Domain"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_knowledgeGraphID, CFSTR("KnowledgeGraphID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_title, CFSTR("Title"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_thumbnailURL, CFSTR("ThumbnailURL"));
  *(float *)&v5 = self->_thumbnailAspectRatio;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("ThumbnailAspectRatio"), v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_shortDescription, CFSTR("ShortDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_detailedDescription, CFSTR("DetailedDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_webURL, CFSTR("WebURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_knowledgeProperties, CFSTR("KnowledgeProperties"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_thirdPartyObject, CFSTR("ThirdPartyObject"));

}

- (void)setThirdPartyObject:(id)a3
{
  objc_storeStrong((id *)&self->_thirdPartyObject, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("domain: '%@', "), self->_domain);
  objc_msgSend(v3, "appendFormat:", CFSTR("knowledgeGraphID: '%@', "), self->_knowledgeGraphID);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@', "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("thumbnailURL: '%@', "), self->_thumbnailURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("thumbnailAspectRatio: %0.2f, "), self->_thumbnailAspectRatio);
  objc_msgSend(v3, "appendFormat:", CFSTR("shortDescription: '%@', "), self->_shortDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("detailedDescription: '%@', "), self->_detailedDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("webURL: '%@', "), self->_webURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("knowledgeProperties: %@"), self->_knowledgeProperties);
  if (self->_thirdPartyObject)
    objc_msgSend(v3, "appendFormat:", CFSTR(", thirdPartyObject: %@"), self->_thirdPartyObject);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)knowledgeGraphID
{
  return self->_knowledgeGraphID;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (float)thumbnailAspectRatio
{
  return self->_thumbnailAspectRatio;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (NSDictionary)knowledgeProperties
{
  return self->_knowledgeProperties;
}

- (MADVIVisualSearchThirdPartyObject)thirdPartyObject
{
  return self->_thirdPartyObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyObject, 0);
  objc_storeStrong((id *)&self->_knowledgeProperties, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_knowledgeGraphID, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
