@implementation MADVIVisualSearchThirdPartyObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchThirdPartyObject)initWithObjectIdentifier:(id)a3 imageURL:(id)a4 thumbnailURL:(id)a5 metadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MADVIVisualSearchThirdPartyObject *v15;
  MADVIVisualSearchThirdPartyObject *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MADVIVisualSearchThirdPartyObject;
  v15 = -[MADVIVisualSearchThirdPartyObject init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objectIdentifier, a3);
    objc_storeStrong((id *)&v16->_imageURL, a4);
    objc_storeStrong((id *)&v16->_thumbnailURL, a5);
    objc_storeStrong((id *)&v16->_metadata, a6);
  }

  return v16;
}

- (MADVIVisualSearchThirdPartyObject)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchThirdPartyObject *v5;
  uint64_t v6;
  NSString *objectIdentifier;
  uint64_t v8;
  NSString *imageURL;
  uint64_t v10;
  NSString *thumbnailURL;
  uint64_t v12;
  NSData *metadata;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADVIVisualSearchThirdPartyObject;
  v5 = -[MADVIVisualSearchThirdPartyObject init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObjectIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ThumbnailURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Metadata"));
    v12 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *objectIdentifier;
  id v5;

  objectIdentifier = self->_objectIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", objectIdentifier, CFSTR("ObjectIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURL, CFSTR("ImageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailURL, CFSTR("ThumbnailURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("objectIdentifier: '%@'"), self->_objectIdentifier);
  if (self->_imageURL)
    objc_msgSend(v3, "appendFormat:", CFSTR(", imageURL: '%@'"), self->_imageURL);
  if (self->_thumbnailURL)
    objc_msgSend(v3, "appendFormat:", CFSTR(", thumbnailURL: '%@'"), self->_thumbnailURL);
  if (self->_metadata)
    objc_msgSend(v3, "appendFormat:", CFSTR(", metadata: '%@'"), self->_metadata);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
