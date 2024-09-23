@implementation MIBundleContainerToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIBundleContainerToken)initWithContainer:(id)a3
{
  id v4;
  MIBundleContainerToken *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *bundleURL;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBundleContainerToken;
  v5 = -[MIContainerToken initWithContainer:](&v12, sel_initWithContainer_, v4);
  if (v5)
  {
    objc_msgSend(v4, "rawContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v5->_hasIdentifiedBundle = 1;
    }
    else
    {
      v5->_hasIdentifiedBundle = 1;
      objc_msgSend(v4, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleURL");
      v9 = objc_claimAutoreleasedReturnValue();
      bundleURL = v5->_bundleURL;
      v5->_bundleURL = (NSURL *)v9;

    }
  }

  return v5;
}

- (MIBundleContainerToken)initWithCoder:(id)a3
{
  id v4;
  MIBundleContainerToken *v5;
  uint64_t v6;
  NSURL *bundleURL;
  void *v8;
  void *v9;
  MIBundleContainerToken *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIBundleContainerToken;
  v5 = -[MIContainerToken initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_hasIdentifiedBundle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasIdentifiedBundle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v6;

    -[MIContainerToken containerURL](v5, "containerURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && !v5->_bundleURL)
    {
      objc_msgSend(v8, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundleContainerToken initWithCoder:]", 52, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Serialized container did not encode bundleURL for bundle in container %@"), v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "failWithError:", v14);
      v10 = 0;
      goto LABEL_6;
    }

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIBundleContainerToken;
  v4 = a3;
  -[MIContainerToken encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[MIBundleContainerToken hasIdentifiedBundle](self, "hasIdentifiedBundle", v6.receiver, v6.super_class), CFSTR("hasIdentifiedBundle"));
  -[MIBundleContainerToken bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleURL"));

}

- (BOOL)hasIdentifiedBundle
{
  return self->_hasIdentifiedBundle;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
