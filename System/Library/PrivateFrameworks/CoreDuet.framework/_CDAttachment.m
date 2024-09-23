@implementation _CDAttachment

+ (id)attachmentWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:cloudIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:", v15, v14, v13, v12, v11, 0, 0);

  return v16;
}

+ (id)attachmentWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7 contentURL:(id)a8 contentText:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:cloudIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:", v21, v20, v19, v18, v17, v16, v15);

  return v22;
}

- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7 contentURL:(id)a8 contentText:(id)a9
{
  return -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:](self, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:", a3, a4, 0, a5, a6, a7, a8, a9);
}

- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 photoLocalIdentifier:(id)a5 type:(id)a6 sizeInBytes:(id)a7 creationDate:(id)a8 contentURL:(id)a9 contentText:(id)a10
{
  return -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:](self, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:", a3, a4, 0, a6, a7, a8, a9, a10, 0, 0);
}

- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 photoLocalIdentifier:(id)a5 type:(id)a6 sizeInBytes:(id)a7 creationDate:(id)a8 contentURL:(id)a9 contentText:(id)a10 photoSceneDescriptor:(id)a11 personInPhoto:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _CDAttachment *v23;
  _CDAttachment *v24;
  id obj;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v27 = a5;
  v32 = a5;
  v31 = a6;
  v18 = a8;
  v30 = a7;
  v29 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v35.receiver = self;
  v35.super_class = (Class)_CDAttachment;
  v23 = -[_CDAttachment init](&v35, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_identifier, a3);
    objc_storeStrong((id *)&v24->_cloudIdentifier, obj);
    objc_storeStrong((id *)&v24->_photoLocalIdentifier, v27);
    objc_storeStrong((id *)&v24->_uti, a6);
    objc_storeStrong((id *)&v24->_creationDate, v18);
    objc_storeStrong((id *)&v24->_size, a7);
    objc_storeStrong((id *)&v24->_contentURL, a9);
    -[_CDAttachment setContentText:](v24, "setContentText:", v20);
    objc_storeStrong((id *)&v24->_photoSceneDescriptor, a11);
    objc_storeStrong((id *)&v24->_personInPhoto, a12);
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDAttachment)initWithCoder:(id)a3
{
  id v4;
  _CDAttachment *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSUUID *cloudIdentifier;
  uint64_t v10;
  NSString *photoLocalIdentifier;
  uint64_t v12;
  NSString *uti;
  uint64_t v14;
  NSNumber *size;
  uint64_t v16;
  NSDate *creationDate;
  uint64_t v18;
  NSURL *contentURL;
  void *v20;
  uint64_t v21;
  NSString *personInPhoto;
  uint64_t v23;
  NSString *photoSceneDescriptor;
  _CDAttachment *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_CDAttachment;
  v5 = -[_CDAttachment init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    cloudIdentifier = v5->_cloudIdentifier;
    v5->_cloudIdentifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoLocalIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    photoLocalIdentifier = v5->_photoLocalIdentifier;
    v5->_photoLocalIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uti"));
    v12 = objc_claimAutoreleasedReturnValue();
    uti = v5->_uti;
    v5->_uti = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v14 = objc_claimAutoreleasedReturnValue();
    size = v5->_size;
    v5->_size = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    contentURL = v5->_contentURL;
    v5->_contentURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDAttachment setContentText:](v5, "setContentText:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personInPhoto"));
    v21 = objc_claimAutoreleasedReturnValue();
    personInPhoto = v5->_personInPhoto;
    v5->_personInPhoto = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoSceneDescriptor"));
    v23 = objc_claimAutoreleasedReturnValue();
    photoSceneDescriptor = v5->_photoSceneDescriptor;
    v5->_photoSceneDescriptor = (NSString *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cloudIdentifier, CFSTR("cloudIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_photoLocalIdentifier, CFSTR("photoLocalIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uti, CFSTR("uti"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_size, CFSTR("size"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contentURL, CFSTR("contentURL"));
  -[_CDAttachment contentText](self, "contentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("contentText"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_personInPhoto, CFSTR("personInPhoto"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_photoSceneDescriptor, CFSTR("photoSceneDescriptor"));

}

- (NSString)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
  __CFString *v3;

  if (a3)
    v3 = &stru_1E26E9728;
  else
    v3 = 0;
  objc_storeStrong((id *)&self->_contentText, v3);
}

- (id)description
{
  return -[_CDAttachment descriptionRedacted:](self, "descriptionRedacted:", 0);
}

- (id)redactedDescription
{
  return -[_CDAttachment descriptionRedacted:](self, "descriptionRedacted:", 1);
}

- (id)descriptionRedacted:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("("));
  -[_CDAttachment identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CDAttachment identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("identifier: %@ "), v7);

  }
  -[_CDAttachment cloudIdentifier](self, "cloudIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_CDAttachment cloudIdentifier](self, "cloudIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("cloudIdentifier: %@ "), v9);

  }
  -[_CDAttachment photoLocalIdentifier](self, "photoLocalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_CDAttachment photoLocalIdentifier](self, "photoLocalIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("photoLocalIdentifier: %@ "), v11);

  }
  -[_CDAttachment uti](self, "uti");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_CDAttachment uti](self, "uti");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("UTI: %@ "), v13);

  }
  -[_CDAttachment size](self, "size");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_CDAttachment size](self, "size");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("size: %@ "), v15);

  }
  -[_CDAttachment creationDate](self, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_CDAttachment creationDate](self, "creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("creationDate: %@ "), v17);

  }
  -[_CDAttachment contentURL](self, "contentURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (v3)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("contentURL: %@ "), CFSTR("redacted"));
    }
    else
    {
      -[_CDAttachment contentURL](self, "contentURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("contentURL: %@ "), v19);

    }
  }
  -[_CDAttachment contentText](self, "contentText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (v3)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("contentText: %@ "), CFSTR("redacted"));
    }
    else
    {
      -[_CDAttachment contentText](self, "contentText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("contentText: %@ "), v21);

    }
  }
  -[_CDAttachment personInPhoto](self, "personInPhoto");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (v3)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("personInPhoto: %@ "), CFSTR("redacted"));
    }
    else
    {
      -[_CDAttachment personInPhoto](self, "personInPhoto");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("personInPhoto: %@ "), v23);

    }
  }
  -[_CDAttachment photoSceneDescriptor](self, "photoSceneDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v3)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("photoSceneDescriptor: %@ "), CFSTR("redacted"));
    }
    else
    {
      -[_CDAttachment photoSceneDescriptor](self, "photoSceneDescriptor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("photoSceneDescriptor: %@ "), v25);

    }
  }
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDAttachment *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = -[_CDAttachment init](+[_CDAttachment allocWithZone:](_CDAttachment, "allocWithZone:", a3), "init");
  -[_CDAttachment identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setIdentifier:](v4, "setIdentifier:", v5);

  -[_CDAttachment cloudIdentifier](self, "cloudIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setCloudIdentifier:](v4, "setCloudIdentifier:", v6);

  -[_CDAttachment uti](self, "uti");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setUti:](v4, "setUti:", v7);

  -[_CDAttachment size](self, "size");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setSize:](v4, "setSize:", v8);

  -[_CDAttachment creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setCreationDate:](v4, "setCreationDate:", v9);

  -[_CDAttachment contentURL](self, "contentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setContentURL:](v4, "setContentURL:", v10);

  -[_CDAttachment contentText](self, "contentText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setContentText:](v4, "setContentText:", v11);

  -[_CDAttachment personInPhoto](self, "personInPhoto");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setPersonInPhoto:](v4, "setPersonInPhoto:", v12);

  -[_CDAttachment photoSceneDescriptor](self, "photoSceneDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAttachment setPhotoSceneDescriptor:](v4, "setPhotoSceneDescriptor:", v13);

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = 31 * -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSUUID hash](self->_cloudIdentifier, "hash");
  v5 = v4 ^ -[NSString hash](self->_uti, "hash");
  v6 = v5 ^ -[NSNumber hash](self->_size, "hash") ^ v3;
  v7 = -[NSDate hash](self->_creationDate, "hash");
  -[_CDAttachment personInPhoto](self, "personInPhoto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[_CDAttachment photoSceneDescriptor](self, "photoSceneDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6 ^ v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _CDAttachment *v4;
  _CDAttachment *v5;
  NSUUID *identifier;
  NSUUID *v7;
  NSUUID *v8;
  NSUUID *v9;
  char v10;
  char v11;
  NSUUID *cloudIdentifier;
  NSUUID *v13;
  NSUUID *v14;
  NSUUID *v15;
  char v16;
  NSString *uti;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSNumber *size;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  char v26;
  NSDate *creationDate;
  NSDate *v28;
  NSDate *v29;
  NSDate *v30;
  char v31;
  NSURL *contentURL;
  NSURL *v33;
  NSURL *v34;
  NSURL *v35;
  char v36;
  NSString *contentText;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  NSString *photoSceneDescriptor;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  char v46;
  NSString *v48;
  NSString *v49;

  v4 = (_CDAttachment *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSUUID isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_35;
      }
      cloudIdentifier = self->_cloudIdentifier;
      v13 = v5->_cloudIdentifier;
      if (cloudIdentifier == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = cloudIdentifier;
        v16 = -[NSUUID isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_35;
      }
      uti = self->_uti;
      v18 = v5->_uti;
      if (uti == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = uti;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_35;
      }
      size = self->_size;
      v23 = v5->_size;
      if (size == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = size;
        v26 = -[NSNumber isEqual:](v25, "isEqual:", v24);

        if ((v26 & 1) == 0)
          goto LABEL_35;
      }
      creationDate = self->_creationDate;
      v28 = v5->_creationDate;
      if (creationDate == v28)
      {

      }
      else
      {
        v29 = v28;
        v30 = creationDate;
        v31 = -[NSDate isEqual:](v30, "isEqual:", v29);

        if ((v31 & 1) == 0)
          goto LABEL_35;
      }
      contentURL = self->_contentURL;
      v33 = v5->_contentURL;
      if (contentURL == v33)
      {

      }
      else
      {
        v34 = v33;
        v35 = contentURL;
        v36 = -[NSURL isEqual:](v35, "isEqual:", v34);

        if ((v36 & 1) == 0)
          goto LABEL_35;
      }
      contentText = self->_contentText;
      v38 = v5->_contentText;
      if (contentText == v38)
      {

      }
      else
      {
        v39 = v38;
        v40 = contentText;
        v41 = -[NSString isEqual:](v40, "isEqual:", v39);

        if ((v41 & 1) == 0)
          goto LABEL_35;
      }
      photoSceneDescriptor = self->_photoSceneDescriptor;
      v43 = v5->_photoSceneDescriptor;
      if (photoSceneDescriptor == v43)
      {

      }
      else
      {
        v44 = v43;
        v45 = photoSceneDescriptor;
        v46 = -[NSString isEqual:](v45, "isEqual:", v44);

        if ((v46 & 1) == 0)
        {
LABEL_35:
          v11 = 0;
LABEL_36:

          goto LABEL_37;
        }
      }
      v48 = self->_personInPhoto;
      v49 = v48;
      if (v48 == v5->_personInPhoto)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v48, "isEqual:");

      goto LABEL_36;
    }
    v11 = 0;
  }
LABEL_37:

  return v11;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)uti
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUti:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)cloudIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)photoLocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPhotoLocalIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)size
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSURL)contentURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContentURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)photoSceneDescriptor
{
  return self->_photoSceneDescriptor;
}

- (void)setPhotoSceneDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)personInPhoto
{
  return self->_personInPhoto;
}

- (void)setPersonInPhoto:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personInPhoto, 0);
  objc_storeStrong((id *)&self->_photoSceneDescriptor, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_photoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
}

@end
