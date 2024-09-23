@implementation HMMTRMutableVendorMetadata

- (void)addVendor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v6);

  -[HMMTRVendorMetadata setVendorsByVendorID:](self, "setVendorsByVendorID:", v7);
}

- (void)removeVendorWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);
  -[HMMTRVendorMetadata setVendorsByVendorID:](self, "setVendorsByVendorID:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMMTRVendorMetadata *v4;
  void *v5;
  void *v6;
  HMMTRVendorMetadata *v7;
  void *v8;

  v4 = +[HMMTRVendorMetadata allocWithZone:](HMMTRVendorMetadata, "allocWithZone:", a3);
  -[HMMTRVendorMetadata version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadata schemaVersion](self, "schemaVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRVendorMetadata initWithVersion:schemaVersion:](v4, "initWithVersion:schemaVersion:", v5, v6);

  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadata setVendorsByVendorID:](v7, "setVendorsByVendorID:", v8);

  return v7;
}

@end
