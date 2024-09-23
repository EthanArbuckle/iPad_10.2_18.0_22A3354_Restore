@implementation IXOwnedDataPromiseSeed

- (IXOwnedDataPromiseSeed)initWithCoder:(id)a3
{
  id v4;
  IXOwnedDataPromiseSeed *v5;
  uint64_t v6;
  NSURL *stagingBaseDir;
  uint64_t v8;
  NSString *sandboxExtensionToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXOwnedDataPromiseSeed;
  v5 = -[IXDataPromiseSeed initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagingBaseDir"));
    v6 = objc_claimAutoreleasedReturnValue();
    stagingBaseDir = v5->_stagingBaseDir;
    v5->_stagingBaseDir = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtensionToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionToken = v5->_sandboxExtensionToken;
    v5->_sandboxExtensionToken = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IXOwnedDataPromiseSeed;
  v4 = a3;
  -[IXDataPromiseSeed encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[IXOwnedDataPromiseSeed stagingBaseDir](self, "stagingBaseDir", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stagingBaseDir"));

  -[IXOwnedDataPromiseSeed sandboxExtensionToken](self, "sandboxExtensionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sandboxExtensionToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IXOwnedDataPromiseSeed;
  v4 = -[IXDataPromiseSeed copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[IXOwnedDataPromiseSeed stagingBaseDir](self, "stagingBaseDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStagingBaseDir:", v5);

  -[IXOwnedDataPromiseSeed sandboxExtensionToken](self, "sandboxExtensionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSandboxExtensionToken:", v6);

  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (NSURL)stagingBaseDir
{
  return self->_stagingBaseDir;
}

- (void)setStagingBaseDir:(id)a3
{
  objc_storeStrong((id *)&self->_stagingBaseDir, a3);
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_stagingBaseDir, 0);
}

@end
