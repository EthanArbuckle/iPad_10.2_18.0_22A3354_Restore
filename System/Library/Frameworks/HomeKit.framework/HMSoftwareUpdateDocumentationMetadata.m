@implementation HMSoftwareUpdateDocumentationMetadata

- (HMSoftwareUpdateDocumentationMetadata)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMSoftwareUpdateDocumentationMetadata)initWithURL:(id)a3 digest:(id)a4
{
  id v6;
  id v7;
  HMSoftwareUpdateDocumentationMetadata *v8;
  uint64_t v9;
  NSURL *URL;
  uint64_t v11;
  HMFDigest *digest;
  id v13;
  id v14;
  uint64_t v15;
  NSUUID *metadataDigestUUID;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMSoftwareUpdateDocumentationMetadata;
  v8 = -[HMSoftwareUpdateDocumentationMetadata init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    URL = v8->_URL;
    v8->_URL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    digest = v8->_digest;
    v8->_digest = (HMFDigest *)v11;

    v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "value");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v13, "initWithUUIDBytes:", objc_msgSend(v14, "bytes"));
    metadataDigestUUID = v8->_metadataDigestUUID;
    v8->_metadataDigestUUID = (NSUUID *)v15;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMSoftwareUpdateDocumentationMetadata URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdateDocumentationMetadata *v4;
  HMSoftwareUpdateDocumentationMetadata *v5;
  HMSoftwareUpdateDocumentationMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMSoftwareUpdateDocumentationMetadata *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_8;
    -[HMSoftwareUpdateDocumentationMetadata URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentationMetadata URL](v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[HMSoftwareUpdateDocumentationMetadata digest](self, "digest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentationMetadata digest](v6, "digest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
LABEL_8:
      v14 = 0;
    }

  }
  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMSoftwareUpdateDocumentationMetadata URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateDocumentationMetadata digest](self, "digest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, URL = %@, Digest = %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HMSoftwareUpdateDocumentationMetadata URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[HMSoftwareUpdateDocumentationMetadata digest](self, "digest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)objc_msgSend(v5, "initWithURL:digest:", v7, v9);

  return v10;
}

- (HMSoftwareUpdateDocumentationMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMSoftwareUpdateDocumentationMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.digest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMSoftwareUpdateDocumentationMetadata initWithURL:digest:](self, "initWithURL:digest:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMSoftwareUpdateDocumentationMetadata URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.url"));

  -[HMSoftwareUpdateDocumentationMetadata digest](self, "digest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.digest"));

}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (HMFDigest)digest
{
  return (HMFDigest *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)metadataDigestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDigestUUID, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
