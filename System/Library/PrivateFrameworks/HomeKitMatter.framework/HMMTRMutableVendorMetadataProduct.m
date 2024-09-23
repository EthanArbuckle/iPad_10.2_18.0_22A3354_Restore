@implementation HMMTRMutableVendorMetadataProduct

- (id)copyWithZone:(_NSZone *)a3
{
  HMMTRVendorMetadataProduct *v4;
  void *v5;
  void *v6;
  HMMTRVendorMetadataProduct *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[HMMTRVendorMetadataProduct allocWithZone:](HMMTRVendorMetadataProduct, "allocWithZone:", a3);
  -[HMMTRVendorMetadataProduct identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct categoryNumber](self, "categoryNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRVendorMetadataProduct initWithIdentifier:categoryNumber:](v4, "initWithIdentifier:categoryNumber:", v5, v6);

  -[HMMTRVendorMetadataProduct name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct setName:](v7, "setName:", v8);

  -[HMMTRVendorMetadataProduct model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct setModel:](v7, "setModel:", v9);

  -[HMMTRVendorMetadataProduct installationGuideURL](self, "installationGuideURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataProduct setInstallationGuideURL:](v7, "setInstallationGuideURL:", v10);

  return v7;
}

@end
