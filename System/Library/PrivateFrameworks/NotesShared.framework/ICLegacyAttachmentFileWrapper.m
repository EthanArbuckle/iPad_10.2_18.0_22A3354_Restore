@implementation ICLegacyAttachmentFileWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLegacyAttachmentFileWrapper)initWithCIDURL:(id)a3
{
  id v4;
  ICLegacyAttachmentFileWrapper *v5;
  ICLegacyAttachmentFileWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICLegacyAttachmentFileWrapper;
  v5 = -[ICLegacyAttachmentFileWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICLegacyAttachmentFileWrapper setCidURL:](v5, "setCidURL:", v4);

  return v6;
}

- (ICLegacyAttachmentFileWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICLegacyAttachmentFileWrapper *v6;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cidURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[ICLegacyAttachmentFileWrapper initWithCIDURL:](self, "initWithCIDURL:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    -[ICLegacyAttachmentFileWrapper cidURL](self, "cidURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("cidURL"));

  }
}

- (NSString)attachmentIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICLegacyAttachmentFileWrapper cidURL](self, "cidURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_md5");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSURL)cidURL
{
  return self->_cidURL;
}

- (void)setCidURL:(id)a3
{
  objc_storeStrong((id *)&self->_cidURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cidURL, 0);
}

@end
