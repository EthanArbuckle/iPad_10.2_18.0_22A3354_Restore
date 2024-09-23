@implementation ASDEnterpriseAppMetadata

- (ASDEnterpriseAppMetadata)initWithManifestURL:(id)a3
{
  id v4;
  ASDEnterpriseAppMetadata *v5;
  uint64_t v6;
  NSURL *manifestURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDEnterpriseAppMetadata;
  v5 = -[ASDEnterpriseAppMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v6;

  }
  return v5;
}

- (int64_t)metadataType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[ASDEnterpriseAppMetadata initWithManifestURL:]([ASDEnterpriseAppMetadata alloc], "initWithManifestURL:", self->_manifestURL);
  *((_BYTE *)result + 8) = self->_hideUserPrompts;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDEnterpriseAppMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDEnterpriseAppMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MU"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDEnterpriseAppMetadata initWithManifestURL:](self, "initWithManifestURL:", v5);
  if (v6)
    v6->_hideUserPrompts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HP"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *manifestURL;
  id v5;

  manifestURL = self->_manifestURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", manifestURL, CFSTR("MU"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hideUserPrompts, CFSTR("HP"));

}

- (BOOL)hideUserPrompts
{
  return self->_hideUserPrompts;
}

- (void)setHideUserPrompts:(BOOL)a3
{
  self->_hideUserPrompts = a3;
}

- (NSURL)manifestURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
}

@end
