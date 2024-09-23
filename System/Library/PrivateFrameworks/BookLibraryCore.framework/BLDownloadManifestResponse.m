@implementation BLDownloadManifestResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLDownloadManifestResponse)initWithCoder:(id)a3
{
  id v4;
  BLDownloadManifestResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *validDownloadIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLDownloadManifestResponse;
  v5 = -[BLDownloadManifestResponse init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("validDownloadIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    validDownloadIDs = v5->_validDownloadIDs;
    v5->_validDownloadIDs = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BLDownloadManifestResponse validDownloadIDs](self, "validDownloadIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("validDownloadIDs"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[BLDownloadManifestResponse validDownloadIDs](self, "validDownloadIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Valid Download Ids: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)validDownloadIDs
{
  return self->_validDownloadIDs;
}

- (void)setValidDownloadIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDownloadIDs, 0);
}

@end
