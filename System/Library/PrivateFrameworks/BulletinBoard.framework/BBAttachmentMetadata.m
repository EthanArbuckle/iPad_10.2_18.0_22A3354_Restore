@implementation BBAttachmentMetadata

- (BBAttachmentMetadata)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return (BBAttachmentMetadata *)-[BBAttachmentMetadata _initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:](self, "_initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:", 0, 0, 0, 0, 0, 0, v3);
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 identifier:(id)a5 uniformType:(id)a6 thumbnailGeneratorUserInfo:(id)a7 thumbnailHidden:(BOOL)a8 hiddenFromDefaultExpandedView:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  BBAttachmentMetadata *v19;
  uint64_t v20;
  NSUUID *UUID;
  uint64_t v22;
  NSURL *URL;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *uniformType;
  uint64_t v28;
  NSDictionary *thumbnailGeneratorUserInfo;
  objc_super v31;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)BBAttachmentMetadata;
  v19 = -[BBAttachmentMetadata init](&v31, sel_init);
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    UUID = v19->_UUID;
    v19->_UUID = (NSUUID *)v20;

    v19->_type = a3;
    v22 = objc_msgSend(v15, "copy");
    URL = v19->_URL;
    v19->_URL = (NSURL *)v22;

    v24 = objc_msgSend(v16, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    uniformType = v19->_uniformType;
    v19->_uniformType = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    thumbnailGeneratorUserInfo = v19->_thumbnailGeneratorUserInfo;
    v19->_thumbnailGeneratorUserInfo = (NSDictionary *)v28;

    v19->_thumbnailHidden = a8;
    v19->_hiddenFromDefaultExpandedView = a9;
  }

  return v19;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[BBAttachmentMetadata type](self, "type");
  -[BBAttachmentMetadata URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BBAttachmentMetadata *v4;
  BBAttachmentMetadata *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (BBAttachmentMetadata *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[BBAttachmentMetadata type](self, "type");
      if (v6 == -[BBAttachmentMetadata type](v5, "type"))
      {
        -[BBAttachmentMetadata URL](self, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBAttachmentMetadata URL](v5, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = BSEqualObjects();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)hasContentModificationsRelativeTo:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  v5 = -[BBAttachmentMetadata type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[BBAttachmentMetadata URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualObjects() ^ 1;

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BBAttachmentMetadata type](self, "type"), CFSTR("type"));
  -[BBAttachmentMetadata URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("URL"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BBMutableAttachmentMetadata *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  uint64_t v13;

  v4 = +[BBMutableAttachmentMetadata allocWithZone:](BBMutableAttachmentMetadata, "allocWithZone:", a3);
  v5 = -[BBAttachmentMetadata type](self, "type");
  -[BBAttachmentMetadata URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAttachmentMetadata identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAttachmentMetadata uniformType](self, "uniformType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAttachmentMetadata thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BBAttachmentMetadata thumbnailHidden](self, "thumbnailHidden");
  LOBYTE(v13) = -[BBAttachmentMetadata hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView");
  v11 = -[BBAttachmentMetadata _initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:](v4, "_initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:", v5, v6, v7, v8, v9, v10, v13);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[BBAttachmentMetadata type](self, "type"), CFSTR("type"));
  -[BBAttachmentMetadata URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("URL"));

  -[BBAttachmentMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[BBAttachmentMetadata uniformType](self, "uniformType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("uniformType"));

  -[BBAttachmentMetadata thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("thumbnailGeneratorUserInfo"));

  objc_msgSend(v8, "encodeBool:forKey:", -[BBAttachmentMetadata thumbnailHidden](self, "thumbnailHidden"), CFSTR("thumbnailHidden"));
  objc_msgSend(v8, "encodeBool:forKey:", -[BBAttachmentMetadata hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"), CFSTR("hiddenFromDefaultExpandedView"));

}

- (BBAttachmentMetadata)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BBAttachmentMetadata *v15;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniformType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("thumbnailGeneratorUserInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("thumbnailHidden"));
  LOBYTE(v8) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("hiddenFromDefaultExpandedView"));

  LOBYTE(v17) = v8;
  v15 = -[BBAttachmentMetadata _initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:](self, "_initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:", v18, v4, v5, v6, v13, v14, v17);

  return v15;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)uniformType
{
  return self->_uniformType;
}

- (NSDictionary)thumbnailGeneratorUserInfo
{
  return self->_thumbnailGeneratorUserInfo;
}

- (BOOL)thumbnailHidden
{
  return self->_thumbnailHidden;
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return self->_hiddenFromDefaultExpandedView;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_thumbnailGeneratorUserInfo, 0);
  objc_storeStrong((id *)&self->_uniformType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
