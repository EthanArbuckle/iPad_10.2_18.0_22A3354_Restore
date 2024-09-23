@implementation UARPAccessoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAccessoryMetadata)initWithProductGroup:(id)a3 productNumber:(id)a4
{
  id v7;
  id v8;
  UARPAccessoryMetadata *v9;
  UARPAccessoryMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPAccessoryMetadata;
  v9 = -[UARPAccessoryMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_productGroup, a3);
    objc_storeStrong((id *)&v10->_productNumber, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPAccessoryMetadata *v4;

  v4 = -[UARPAccessoryMetadata initWithProductGroup:productNumber:]([UARPAccessoryMetadata alloc], "initWithProductGroup:productNumber:", self->_productGroup, self->_productNumber);
  -[UARPAccessoryMetadata setVendorName:](v4, "setVendorName:", self->_vendorName);
  -[UARPAccessoryMetadata setCompanyLegalName:](v4, "setCompanyLegalName:", self->_companyLegalName);
  -[UARPAccessoryMetadata setCompanyPreferredName:](v4, "setCompanyPreferredName:", self->_companyPreferredName);
  -[UARPAccessoryMetadata setAccessoryMarketingName:](v4, "setAccessoryMarketingName:", self->_accessoryMarketingName);
  -[UARPAccessoryMetadata setAccessoryProductLabel:](v4, "setAccessoryProductLabel:", self->_accessoryProductLabel);
  -[UARPAccessoryMetadata setAccessoryInstallationGuideURL:](v4, "setAccessoryInstallationGuideURL:", self->_accessoryInstallationGuideURL);
  -[UARPAccessoryMetadata setAccessoryCategoryNumber:](v4, "setAccessoryCategoryNumber:", self->_accessoryCategoryNumber);
  -[UARPAccessoryMetadata setAccessoryCapability:](v4, "setAccessoryCapability:", self->_accessoryCapability);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *productGroup;
  id v5;

  productGroup = self->_productGroup;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", productGroup, CFSTR("productGroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productNumber, CFSTR("productNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("vendorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companyLegalName, CFSTR("companyLegalName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companyPreferredName, CFSTR("companyPreferredName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryMarketingName, CFSTR("accessoryMarketingName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryProductLabel, CFSTR("accessoryProductLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryInstallationGuideURL, CFSTR("accessoryInstallationGuideURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessoryCategoryNumber, CFSTR("accessoryCategoryNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessoryCapability, CFSTR("accessoryCapability"));

}

- (UARPAccessoryMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UARPAccessoryMetadata *v7;
  uint64_t v8;
  NSString *vendorName;
  uint64_t v10;
  NSString *companyLegalName;
  uint64_t v12;
  NSString *companyPreferredName;
  uint64_t v14;
  NSString *accessoryMarketingName;
  uint64_t v16;
  NSString *accessoryProductLabel;
  uint64_t v18;
  NSURL *accessoryInstallationGuideURL;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPAccessoryMetadata initWithProductGroup:productNumber:](self, "initWithProductGroup:productNumber:", v5, v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
    v8 = objc_claimAutoreleasedReturnValue();
    vendorName = v7->_vendorName;
    v7->_vendorName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companyLegalName"));
    v10 = objc_claimAutoreleasedReturnValue();
    companyLegalName = v7->_companyLegalName;
    v7->_companyLegalName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companyPreferredName"));
    v12 = objc_claimAutoreleasedReturnValue();
    companyPreferredName = v7->_companyPreferredName;
    v7->_companyPreferredName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryMarketingName"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessoryMarketingName = v7->_accessoryMarketingName;
    v7->_accessoryMarketingName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryProductLabel"));
    v16 = objc_claimAutoreleasedReturnValue();
    accessoryProductLabel = v7->_accessoryProductLabel;
    v7->_accessoryProductLabel = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryInstallationGuideURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    accessoryInstallationGuideURL = v7->_accessoryInstallationGuideURL;
    v7->_accessoryInstallationGuideURL = (NSURL *)v18;

    v7->_accessoryCategoryNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accessoryCategoryNumber"));
    v7->_accessoryCapability = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accessoryCapability"));
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("productGroup=%@, productNumber=%@, vendorName=%@, companyLegalName=%@, companyPreferredName=%@, accessoryMarketingName=%@, productLabel=%@, accessoryCategoryNumber=%llu, accessoryInstallationGuideURL=%@"), self->_productGroup, self->_productNumber, self->_vendorName, self->_companyLegalName, self->_companyPreferredName, self->_accessoryMarketingName, self->_accessoryProductLabel, self->_accessoryCategoryNumber, self->_accessoryInstallationGuideURL);
}

- (unint64_t)accessoryCategoryNumber
{
  return self->_accessoryCategoryNumber;
}

- (void)setAccessoryCategoryNumber:(unint64_t)a3
{
  self->_accessoryCategoryNumber = a3;
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)manufacturerAppBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManufacturerAppBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)manufacturerAppStoreID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setManufacturerAppStoreID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)accessoryModel
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAccessoryModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)companyLegalName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCompanyLegalName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)companyPreferredName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCompanyPreferredName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)accessoryMarketingName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAccessoryMarketingName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)accessoryProductLabel
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAccessoryProductLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSURL)accessoryInstallationGuideURL
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAccessoryInstallationGuideURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (unint64_t)accessoryCapability
{
  return self->_accessoryCapability;
}

- (void)setAccessoryCapability:(unint64_t)a3
{
  self->_accessoryCapability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInstallationGuideURL, 0);
  objc_storeStrong((id *)&self->_accessoryProductLabel, 0);
  objc_storeStrong((id *)&self->_accessoryMarketingName, 0);
  objc_storeStrong((id *)&self->_companyPreferredName, 0);
  objc_storeStrong((id *)&self->_companyLegalName, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_manufacturerAppStoreID, 0);
  objc_storeStrong((id *)&self->_manufacturerAppBundleID, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
}

@end
