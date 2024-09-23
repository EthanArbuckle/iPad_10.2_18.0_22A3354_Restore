@implementation AAIdentity

- (AAIdentity)initWithID:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 identityImage:(id)a7 identityImageThumb:(id)a8 identityImageCropRect:(id)a9 memojiData:(id)a10 serviceID:(id)a11
{
  id v18;
  AAIdentity *v19;
  AAIdentity *v20;
  id v22;
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
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)AAIdentity;
  v19 = -[AAIdentity init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identityID, a3);
    objc_storeStrong((id *)&v20->_givenName, a4);
    objc_storeStrong((id *)&v20->_middleName, a5);
    objc_storeStrong((id *)&v20->_familyName, a6);
    objc_storeStrong((id *)&v20->_identityImage, a7);
    objc_storeStrong((id *)&v20->_identityImageThumb, a8);
    objc_storeStrong((id *)&v20->_identityImageCropRect, a9);
    objc_storeStrong((id *)&v20->_memojiData, a10);
    objc_storeStrong((id *)&v20->_serviceID, a11);
  }

  return v20;
}

- (AAIdentity)initWithCoder:(id)a3
{
  id v4;
  AAIdentity *v5;
  uint64_t v6;
  NSUUID *identityID;
  uint64_t v8;
  NSString *givenName;
  uint64_t v10;
  NSString *middleName;
  uint64_t v12;
  NSString *familyName;
  uint64_t v14;
  NSData *identityImage;
  uint64_t v16;
  NSData *identityImageThumb;
  uint64_t v18;
  NSValue *identityImageCropRect;
  uint64_t v20;
  NSData *memojiData;
  uint64_t v22;
  NSString *serviceID;

  v4 = a3;
  v5 = -[AAIdentity init](self, "init");
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityImage"));
    v14 = objc_claimAutoreleasedReturnValue();
    identityImage = v5->_identityImage;
    v5->_identityImage = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityImageThumb"));
    v16 = objc_claimAutoreleasedReturnValue();
    identityImageThumb = v5->_identityImageThumb;
    v5->_identityImageThumb = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityImageCropRect"));
    v18 = objc_claimAutoreleasedReturnValue();
    identityImageCropRect = v5->_identityImageCropRect;
    v5->_identityImageCropRect = (NSValue *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_memojiMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    memojiData = v5->_memojiData;
    v5->_memojiData = (NSData *)v20;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityImage, CFSTR("_identityImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityImageThumb, CFSTR("_identityImageThumb"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityImageCropRect, CFSTR("_identityImageCropRect"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memojiData, CFSTR("_memojiMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceID, CFSTR("_serviceID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAIdentity *v4;
  uint64_t v5;
  NSUUID *identityID;
  uint64_t v7;
  NSString *givenName;
  uint64_t v9;
  NSString *middleName;
  uint64_t v11;
  NSString *familyName;
  uint64_t v13;
  NSData *identityImage;
  uint64_t v15;
  NSData *identityImageThumb;
  uint64_t v17;
  NSValue *identityImageCropRect;
  uint64_t v19;
  NSData *memojiData;
  uint64_t v21;
  NSString *serviceID;

  v4 = -[AAIdentity init](+[AAIdentity allocWithZone:](AAIdentity, "allocWithZone:", a3), "init");
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

  v13 = -[NSData copy](self->_identityImage, "copy");
  identityImage = v4->_identityImage;
  v4->_identityImage = (NSData *)v13;

  v15 = -[NSData copy](self->_identityImageThumb, "copy");
  identityImageThumb = v4->_identityImageThumb;
  v4->_identityImageThumb = (NSData *)v15;

  v17 = -[NSValue copy](self->_identityImageCropRect, "copy");
  identityImageCropRect = v4->_identityImageCropRect;
  v4->_identityImageCropRect = (NSValue *)v17;

  v19 = -[NSData copy](self->_memojiData, "copy");
  memojiData = v4->_memojiData;
  v4->_memojiData = (NSData *)v19;

  v21 = -[NSString copy](self->_serviceID, "copy");
  serviceID = v4->_serviceID;
  v4->_serviceID = (NSString *)v21;

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AAIdentity with identityID: %@ \ngivenName: %@ \nmiddleName: %@ \nfamilyName: %@ \nidentityImage: %@ \nidentityImageThumb: %@ \n identityImageCropRect: %@ \nmemojiData: %@ \nserviceID: %@"), self->_identityID, self->_givenName, self->_middleName, self->_familyName, self->_identityImage, self->_identityImageThumb, self->_identityImageCropRect, self->_memojiData, self->_serviceID);
}

- (BOOL)isEqual:(id)a3
{
  AAIdentity *v4;
  AAIdentity *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  char v32;

  v4 = (AAIdentity *)a3;
  if (self == v4)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AAIdentity givenName](self, "givenName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity givenName](v5, "givenName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_14;
      -[AAIdentity middleName](self, "middleName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity middleName](v5, "middleName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_14;
      -[AAIdentity familyName](self, "familyName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity familyName](v5, "familyName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v14)
        goto LABEL_14;
      -[AAIdentity identityImage](self, "identityImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity identityImage](v5, "identityImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17)
        goto LABEL_14;
      -[AAIdentity identityImageThumb](self, "identityImageThumb");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity identityImageThumb](v5, "identityImageThumb");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_14;
      -[AAIdentity identityImageCropRect](self, "identityImageCropRect");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity identityImageCropRect](v5, "identityImageCropRect");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (!v23)
        goto LABEL_14;
      -[AAIdentity memojiData](self, "memojiData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity memojiData](v5, "memojiData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_14;
      -[AAIdentity serviceID](self, "serviceID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAIdentity serviceID](v5, "serviceID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      if (v29)
      {
        -[AAIdentity identityID](self, "identityID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAIdentity identityID](v5, "identityID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

      }
      else
      {
LABEL_14:
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (NSUUID)identityID
{
  return self->_identityID;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSData)identityImage
{
  return self->_identityImage;
}

- (NSData)identityImageThumb
{
  return self->_identityImageThumb;
}

- (NSValue)identityImageCropRect
{
  return self->_identityImageCropRect;
}

- (NSData)memojiData
{
  return self->_memojiData;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_memojiData, 0);
  objc_storeStrong((id *)&self->_identityImageCropRect, 0);
  objc_storeStrong((id *)&self->_identityImageThumb, 0);
  objc_storeStrong((id *)&self->_identityImage, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_identityID, 0);
}

@end
