@implementation QLCacheVersionedFileIdentifier

- (QLCacheFileIdentifier)fileIdentifier
{
  return (QLCacheFileIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (QLThumbnailVersion)version
{
  return (QLThumbnailVersion *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (QLCacheVersionedFileIdentifier)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  QLCacheVersionedFileIdentifier *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("i"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("v"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[QLCacheVersionedFileIdentifier initWithFileIdentifier:version:](self, "initWithFileIdentifier:version:", v8, v9);
  return v10;
}

- (QLCacheVersionedFileIdentifier)initWithFileIdentifier:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  QLCacheVersionedFileIdentifier *v9;
  QLCacheVersionedFileIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLCacheVersionedFileIdentifier;
  v9 = -[QLCacheVersionedFileIdentifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileIdentifier, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  QLCacheFileIdentifier *fileIdentifier;
  id v5;

  fileIdentifier = self->_fileIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fileIdentifier, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("v"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)versionedFileIdentifierWithThumbnailRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "fileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "versionedFileIdentifierClass")), "initWithThumbnailRequest:", v3);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFileIdentifier:version:", self->_fileIdentifier, self->_version);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<fi:%@ (version: %@)>"), self->_fileIdentifier, self->_version);
}

- (BOOL)isEqual:(id)a3
{
  QLCacheVersionedFileIdentifier *v4;
  QLCacheVersionedFileIdentifier *v5;
  QLCacheFileIdentifier *fileIdentifier;
  void *v7;
  QLThumbnailVersion *version;
  void *v9;
  char v10;

  v4 = (QLCacheVersionedFileIdentifier *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      fileIdentifier = self->_fileIdentifier;
      -[QLCacheVersionedFileIdentifier fileIdentifier](v5, "fileIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[QLCacheFileIdentifier isEqual:](fileIdentifier, "isEqual:", v7))
      {
        version = self->_version;
        -[QLCacheVersionedFileIdentifier version](v5, "version");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[QLThumbnailVersion isEqual:](version, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return -[QLCacheFileIdentifier hash](self->_fileIdentifier, "hash");
}

@end
