@implementation AAIdentityContext

- (AAIdentityContext)initWithCoder:(id)a3
{
  id v4;
  AAIdentityContext *v5;
  uint64_t v6;
  NSUUID *identityID;
  uint64_t v8;
  NSString *givenName;
  uint64_t v10;
  NSString *middleName;
  uint64_t v12;
  NSString *familyName;
  uint64_t v14;
  NSData *imageData;
  uint64_t v16;
  NSData *thumbImageData;
  uint64_t v18;
  NSValue *imageCropRect;
  uint64_t v20;
  NSData *memojiMetadata;
  uint64_t v22;
  NSString *serviceID;

  v4 = a3;
  v5 = -[AAIdentityContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityID"));
    v6 = objc_claimAutoreleasedReturnValue();
    identityID = v5->_identityID;
    v5->_identityID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_givenName"));
    v8 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_middleName"));
    v10 = objc_claimAutoreleasedReturnValue();
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyName"));
    v12 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_thumbImageData"));
    v16 = objc_claimAutoreleasedReturnValue();
    thumbImageData = v5->_thumbImageData;
    v5->_thumbImageData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageCropRect"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageCropRect = v5->_imageCropRect;
    v5->_imageCropRect = (NSValue *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_memojiMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    memojiMetadata = v5->_memojiMetadata;
    v5->_memojiMetadata = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceID"));
    v22 = objc_claimAutoreleasedReturnValue();
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identityID;
  id v5;

  identityID = self->_identityID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identityID, CFSTR("_identityID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_givenName, CFSTR("_givenName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_middleName, CFSTR("_middleName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyName, CFSTR("_familyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("_imageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbImageData, CFSTR("_thumbImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageCropRect, CFSTR("_imageCropRect"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memojiMetadata, CFSTR("_memojiMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceID, CFSTR("_serviceID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAIdentityContext *v4;
  uint64_t v5;
  NSUUID *identityID;
  uint64_t v7;
  NSString *givenName;
  uint64_t v9;
  NSString *middleName;
  uint64_t v11;
  NSString *familyName;
  uint64_t v13;
  NSData *imageData;
  uint64_t v15;
  NSData *thumbImageData;
  uint64_t v17;
  NSValue *imageCropRect;
  uint64_t v19;
  NSData *memojiMetadata;
  uint64_t v21;
  NSString *serviceID;

  v4 = -[AAIdentityContext init](+[AAIdentityContext allocWithZone:](AAIdentityContext, "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_identityID, "copy");
  identityID = v4->_identityID;
  v4->_identityID = (NSUUID *)v5;

  v7 = -[NSString copy](self->_givenName, "copy");
  givenName = v4->_givenName;
  v4->_givenName = (NSString *)v7;

  v9 = -[NSString copy](self->_middleName, "copy");
  middleName = v4->_middleName;
  v4->_middleName = (NSString *)v9;

  v11 = -[NSString copy](self->_familyName, "copy");
  familyName = v4->_familyName;
  v4->_familyName = (NSString *)v11;

  v13 = -[NSData copy](self->_imageData, "copy");
  imageData = v4->_imageData;
  v4->_imageData = (NSData *)v13;

  v15 = -[NSData copy](self->_thumbImageData, "copy");
  thumbImageData = v4->_thumbImageData;
  v4->_thumbImageData = (NSData *)v15;

  v17 = -[NSValue copy](self->_imageCropRect, "copy");
  imageCropRect = v4->_imageCropRect;
  v4->_imageCropRect = (NSValue *)v17;

  v19 = -[NSData copy](self->_memojiMetadata, "copy");
  memojiMetadata = v4->_memojiMetadata;
  v4->_memojiMetadata = (NSData *)v19;

  v21 = -[NSString copy](self->_serviceID, "copy");
  serviceID = v4->_serviceID;
  v4->_serviceID = (NSString *)v21;

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AAIdentityContext with identityID: %@ \ngivenName: %@ \nmiddleName: %@ \nfamilyName: %@ \nimageData: %@ \nthumbImageData: %@ \nimageCropRect: %@ \nmemojiMetadata: %@ \nserviceID: %@"), self->_identityID, self->_givenName, self->_middleName, self->_familyName, self->_imageData, self->_thumbImageData, self->_imageCropRect, self->_memojiMetadata, self->_serviceID);
}

- (NSUUID)identityID
{
  return self->_identityID;
}

- (void)setIdentityID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)thumbImageData
{
  return self->_thumbImageData;
}

- (void)setThumbImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSValue)imageCropRect
{
  return self->_imageCropRect;
}

- (void)setImageCropRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setMemojiMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_imageCropRect, 0);
  objc_storeStrong((id *)&self->_thumbImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_identityID, 0);
}

@end
