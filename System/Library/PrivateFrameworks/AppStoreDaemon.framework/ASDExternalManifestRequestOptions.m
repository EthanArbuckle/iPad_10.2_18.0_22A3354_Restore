@implementation ASDExternalManifestRequestOptions

- (ASDExternalManifestRequestOptions)initWithURL:(id)a3
{
  id v4;
  ASDExternalManifestRequestOptions *v5;
  uint64_t v6;
  NSURL *manifestURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestRequestOptions;
  v5 = -[ASDExternalManifestRequestOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDExternalManifestRequestOptions *v5;
  uint64_t v6;
  NSURL *manifestURL;

  v5 = -[ASDExternalManifestRequestOptions init](+[ASDExternalManifestRequestOptions allocWithZone:](ASDExternalManifestRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSURL copyWithZone:](self->_manifestURL, "copyWithZone:", a3);
  manifestURL = v5->_manifestURL;
  v5->_manifestURL = (NSURL *)v6;

  v5->_shouldHideUserPrompts = self->_shouldHideUserPrompts;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDExternalManifestRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDExternalManifestRequestOptions *v5;
  uint64_t v6;
  NSURL *manifestURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v6;

    v5->_shouldHideUserPrompts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldHideUserPrompts"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASDExternalManifestRequestOptions manifestURL](self, "manifestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("manifestURL"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ASDExternalManifestRequestOptions shouldHideUserPrompts](self, "shouldHideUserPrompts"), CFSTR("shouldHideUserPrompts"));
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (BOOL)shouldHideUserPrompts
{
  return self->_shouldHideUserPrompts;
}

- (void)setShouldHideUserPrompts:(BOOL)a3
{
  self->_shouldHideUserPrompts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
}

@end
