@implementation IMCollaborationNoticeMetadata

+ (id)metadataWithType:(int64_t)a3 bundleIdentifier:(id)a4 contentURL:(id)a5 contentTitle:(id)a6 contentType:(id)a7 messageGUID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  IMCollaborationNoticeMetadata *v18;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = -[IMCollaborationNoticeMetadata initWithNoticeType:bundleIdentifier:contentURL:contentTitle:contentType:messageGUID:]([IMCollaborationNoticeMetadata alloc], "initWithNoticeType:bundleIdentifier:contentURL:contentTitle:contentType:messageGUID:", a3, v17, v16, v15, v14, v13);

  return v18;
}

- (IMCollaborationNoticeMetadata)initWithNoticeType:(int64_t)a3 bundleIdentifier:(id)a4 contentURL:(id)a5 contentTitle:(id)a6 contentType:(id)a7 messageGUID:(id)a8
{
  id v15;
  id v16;
  id v17;
  IMCollaborationNoticeMetadata *v18;
  IMCollaborationNoticeMetadata *v19;
  int64_t v20;
  uint64_t v21;
  NSNumber *typeNumber;
  id v24;
  id v25;
  objc_super v26;

  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)IMCollaborationNoticeMetadata;
  v18 = -[IMCollaborationNoticeMetadata init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    if ((unint64_t)a3 >= 0xA)
      v20 = -1;
    else
      v20 = a3;
    v18->_type = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24, v25);
    v21 = objc_claimAutoreleasedReturnValue();
    typeNumber = v19->_typeNumber;
    v19->_typeNumber = (NSNumber *)v21;

    objc_storeStrong((id *)&v19->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v19->_contentURL, a5);
    objc_storeStrong((id *)&v19->_contentTitle, a6);
    objc_storeStrong((id *)&v19->_contentType, a7);
    objc_storeStrong((id *)&v19->_messageGUID, a8);
  }

  return v19;
}

- (void)setType:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *typeNumber;

  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    typeNumber = self->_typeNumber;
    self->_typeNumber = v4;

  }
}

- (BOOL)isEqual:(id)a3
{
  IMCollaborationNoticeMetadata *v4;
  IMCollaborationNoticeMetadata *v5;
  int64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (IMCollaborationNoticeMetadata *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[IMCollaborationNoticeMetadata type](self, "type");
      if (v6 != -[IMCollaborationNoticeMetadata type](v5, "type"))
        goto LABEL_11;
      -[IMCollaborationNoticeMetadata bundleIdentifier](self, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNoticeMetadata bundleIdentifier](v5, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v9)
        goto LABEL_11;
      -[IMCollaborationNoticeMetadata contentURL](self, "contentURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNoticeMetadata contentURL](v5, "contentURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_11;
      -[IMCollaborationNoticeMetadata contentTitle](self, "contentTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNoticeMetadata contentTitle](v5, "contentTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_11;
      -[IMCollaborationNoticeMetadata contentType](self, "contentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNoticeMetadata contentType](v5, "contentType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (v18)
      {
        -[IMCollaborationNoticeMetadata messageGUID](self, "messageGUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCollaborationNoticeMetadata messageGUID](v5, "messageGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

      }
      else
      {
LABEL_11:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[IMCollaborationNoticeMetadata typeNumber](self, "typeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IMCollaborationNoticeMetadata bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[IMCollaborationNoticeMetadata contentURL](self, "contentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[IMCollaborationNoticeMetadata contentTitle](self, "contentTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[IMCollaborationNoticeMetadata contentType](self, "contentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[IMCollaborationNoticeMetadata messageGUID](self, "messageGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMCollaborationNoticeMetadata type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeMetadata bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeMetadata contentURL](self, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeMetadata contentTitle](self, "contentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeMetadata contentType](self, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeMetadata messageGUID](self, "messageGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@, bundleIdentifier: %@, contentURL: %@, contentTitle: %@, contentType: %@, messageGUID: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMCollaborationNoticeMetadata type](self, "type"), CFSTR("t"));
  -[IMCollaborationNoticeMetadata bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("b"));

  -[IMCollaborationNoticeMetadata contentURL](self, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("u"));

  -[IMCollaborationNoticeMetadata contentTitle](self, "contentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("c"));

  -[IMCollaborationNoticeMetadata contentType](self, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("y"));

  -[IMCollaborationNoticeMetadata messageGUID](self, "messageGUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("m"));

}

- (IMCollaborationNoticeMetadata)initWithCoder:(id)a3
{
  id v4;
  IMCollaborationNoticeMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMCollaborationNoticeMetadata;
  v5 = -[IMCollaborationNoticeMetadata init](&v12, sel_init);
  if (v5)
  {
    -[IMCollaborationNoticeMetadata setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNoticeMetadata setBundleIdentifier:](v5, "setBundleIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("u"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNoticeMetadata setContentURL:](v5, "setContentURL:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNoticeMetadata setContentTitle:](v5, "setContentTitle:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("y"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNoticeMetadata setContentType:](v5, "setContentType:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNoticeMetadata setMessageGUID:](v5, "setMessageGUID:", v10);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setType:", -[IMCollaborationNoticeMetadata type](self, "type"));
  -[IMCollaborationNoticeMetadata bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v5);

  -[IMCollaborationNoticeMetadata contentURL](self, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentURL:", v6);

  -[IMCollaborationNoticeMetadata contentTitle](self, "contentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentTitle:", v7);

  -[IMCollaborationNoticeMetadata contentType](self, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentType:", v8);

  -[IMCollaborationNoticeMetadata messageGUID](self, "messageGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageGUID:", v9);

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentURL, a3);
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_contentTitle, a3);
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageGUID, a3);
}

- (NSNumber)typeNumber
{
  return self->_typeNumber;
}

- (void)setTypeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_typeNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeNumber, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
