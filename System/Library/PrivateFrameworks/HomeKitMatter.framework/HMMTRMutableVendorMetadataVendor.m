@implementation HMMTRMutableVendorMetadataVendor

- (void)addProduct:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v6);

  -[HMMTRVendorMetadataVendor setProductsByProductID:](self, "setProductsByProductID:", v7);
}

- (void)removeProductWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);
  -[HMMTRVendorMetadataVendor setProductsByProductID:](self, "setProductsByProductID:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMMTRVendorMetadataVendor *v4;
  void *v5;
  HMMTRVendorMetadataVendor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[HMMTRVendorMetadataVendor allocWithZone:](HMMTRVendorMetadataVendor, "allocWithZone:", a3);
  -[HMMTRVendorMetadataVendor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMMTRVendorMetadataVendor initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setProductsByProductID:](v6, "setProductsByProductID:", v7);

  -[HMMTRVendorMetadataVendor name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setName:](v6, "setName:", v8);

  -[HMMTRVendorMetadataVendor appStoreID](self, "appStoreID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setAppStoreID:](v6, "setAppStoreID:", v9);

  -[HMMTRVendorMetadataVendor appBundleID](self, "appBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setAppBundleID:](v6, "setAppBundleID:", v10);

  return v6;
}

@end
