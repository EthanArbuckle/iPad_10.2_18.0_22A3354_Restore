@implementation ASDSystemAppMetadata

- (ASDSystemAppMetadata)initWithBundleID:(id)a3
{
  id v4;
  ASDSystemAppMetadata *v5;
  uint64_t v6;
  NSString *bundleID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSystemAppMetadata;
  v5 = -[ASDSystemAppMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

  }
  return v5;
}

- (int64_t)metadataType
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDSystemAppMetadata *v4;

  v4 = -[ASDSystemAppMetadata initWithBundleID:](+[ASDSystemAppMetadata allocWithZone:](ASDSystemAppMetadata, "allocWithZone:", a3), "initWithBundleID:", self->_bundleID);
  -[ASDSystemAppMetadata setUserInitiated:](v4, "setUserInitiated:", self->_userInitiated);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDSystemAppMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDSystemAppMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDSystemAppMetadata initWithBundleID:](self, "initWithBundleID:", v5);
  if (v6)
    v6->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UI"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("BI"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userInitiated, CFSTR("UI"));

}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
