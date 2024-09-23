@implementation ASDAppReviewAppMetadata

- (ASDAppReviewAppMetadata)initWithStoreMetadata:(id)a3
{
  id v5;
  ASDAppReviewAppMetadata *v6;
  ASDAppReviewAppMetadata *v7;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSNumber *initialODRSize;
  uint64_t v12;
  NSNumber *itemID;
  uint64_t v14;
  NSString *itemName;
  uint64_t v16;
  NSString *vendorName;
  uint64_t v18;
  NSNumber *externalVersionIdentifier;
  uint64_t v20;
  NSNumber *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDAppReviewAppMetadata;
  v6 = -[ASDAppReviewAppMetadata init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeMetadata, a3);
    objc_msgSend(v5, "softwareVersionBundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v8;

    v7->_hasMessagesExtension = objc_msgSend(v5, "hasMessagesExtension");
    objc_msgSend(v5, "initialODRSize");
    v10 = objc_claimAutoreleasedReturnValue();
    initialODRSize = v7->_initialODRSize;
    v7->_initialODRSize = (NSNumber *)v10;

    objc_msgSend(v5, "itemID");
    v12 = objc_claimAutoreleasedReturnValue();
    itemID = v7->_itemID;
    v7->_itemID = (NSNumber *)v12;

    objc_msgSend(v5, "itemName");
    v14 = objc_claimAutoreleasedReturnValue();
    itemName = v7->_itemName;
    v7->_itemName = (NSString *)v14;

    v7->_launchProhibited = objc_msgSend(v5, "isLaunchProhibited");
    objc_msgSend(v5, "artistName");
    v16 = objc_claimAutoreleasedReturnValue();
    vendorName = v7->_vendorName;
    v7->_vendorName = (NSString *)v16;

    objc_msgSend(v5, "softwareVersionExternalIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v7->_externalVersionIdentifier;
    v7->_externalVersionIdentifier = (NSNumber *)v18;

    if (!v7->_externalVersionIdentifier)
    {
      v7->_beta = 1;
      objc_msgSend(v5, "betaExternalVersionIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v7->_externalVersionIdentifier;
      v7->_externalVersionIdentifier = (NSNumber *)v20;

    }
  }

  return v7;
}

- (int64_t)metadataType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDAppReviewAppMetadata *v5;
  uint64_t v6;
  NSURL *artworkURL;
  uint64_t v8;
  NSDictionary *backgroundAssetMetadata;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSNumber *externalVersionIdentifier;
  uint64_t v14;
  NSNumber *initialODRSize;
  uint64_t v16;
  NSNumber *itemID;
  uint64_t v18;
  NSString *itemName;
  uint64_t v20;
  NSURL *messagesArtworkURL;
  uint64_t v22;
  NSData *packageDPInfo;
  uint64_t v24;
  NSData *packageSINF;
  uint64_t v26;
  NSURL *packageURL;
  uint64_t v28;
  NSString *vendorName;
  uint64_t v30;
  NSData *onDemandResourceManifest;
  uint64_t v32;
  MIStoreMetadata *storeMetadata;

  v5 = -[ASDAppReviewAppMetadata init](+[ASDAppReviewAppMetadata allocWithZone:](ASDAppReviewAppMetadata, "allocWithZone:"), "init");
  v6 = -[NSURL copyWithZone:](self->_artworkURL, "copyWithZone:", a3);
  artworkURL = v5->_artworkURL;
  v5->_artworkURL = (NSURL *)v6;

  v8 = -[NSDictionary copyWithZone:](self->_backgroundAssetMetadata, "copyWithZone:", a3);
  backgroundAssetMetadata = v5->_backgroundAssetMetadata;
  v5->_backgroundAssetMetadata = (NSDictionary *)v8;

  v10 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v10;

  v12 = -[NSNumber copyWithZone:](self->_externalVersionIdentifier, "copyWithZone:", a3);
  externalVersionIdentifier = v5->_externalVersionIdentifier;
  v5->_externalVersionIdentifier = (NSNumber *)v12;

  v5->_hasMessagesExtension = self->_hasMessagesExtension;
  v14 = -[NSNumber copyWithZone:](self->_initialODRSize, "copyWithZone:", a3);
  initialODRSize = v5->_initialODRSize;
  v5->_initialODRSize = (NSNumber *)v14;

  v16 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v16;

  v18 = -[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  itemName = v5->_itemName;
  v5->_itemName = (NSString *)v18;

  v5->_launchProhibited = self->_launchProhibited;
  v20 = -[NSURL copyWithZone:](self->_messagesArtworkURL, "copyWithZone:", a3);
  messagesArtworkURL = v5->_messagesArtworkURL;
  v5->_messagesArtworkURL = (NSURL *)v20;

  v22 = -[NSData copyWithZone:](self->_packageDPInfo, "copyWithZone:", a3);
  packageDPInfo = v5->_packageDPInfo;
  v5->_packageDPInfo = (NSData *)v22;

  v24 = -[NSData copyWithZone:](self->_packageSINF, "copyWithZone:", a3);
  packageSINF = v5->_packageSINF;
  v5->_packageSINF = (NSData *)v24;

  v26 = -[NSURL copyWithZone:](self->_packageURL, "copyWithZone:", a3);
  packageURL = v5->_packageURL;
  v5->_packageURL = (NSURL *)v26;

  v28 = -[NSString copyWithZone:](self->_vendorName, "copyWithZone:", a3);
  vendorName = v5->_vendorName;
  v5->_vendorName = (NSString *)v28;

  v30 = -[NSData copyWithZone:](self->_onDemandResourceManifest, "copyWithZone:", a3);
  onDemandResourceManifest = v5->_onDemandResourceManifest;
  v5->_onDemandResourceManifest = (NSData *)v30;

  v32 = -[MIStoreMetadata copyWithZone:](self->_storeMetadata, "copyWithZone:", a3);
  storeMetadata = v5->_storeMetadata;
  v5->_storeMetadata = (MIStoreMetadata *)v32;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAppReviewAppMetadata)initWithCoder:(id)a3
{
  id v4;
  ASDAppReviewAppMetadata *v5;
  uint64_t v6;
  NSURL *artworkURL;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *backgroundAssetMetadata;
  uint64_t v13;
  NSString *bundleID;
  uint64_t v15;
  NSNumber *externalVersionIdentifier;
  uint64_t v17;
  NSNumber *initialODRSize;
  uint64_t v19;
  NSNumber *itemID;
  uint64_t v21;
  NSString *itemName;
  uint64_t v23;
  NSURL *messagesArtworkURL;
  uint64_t v25;
  NSData *packageDPInfo;
  uint64_t v27;
  NSData *packageSINF;
  uint64_t v29;
  NSURL *packageURL;
  uint64_t v31;
  NSString *variantID;
  uint64_t v33;
  NSString *vendorName;
  uint64_t v35;
  NSData *onDemandResourceManifest;
  uint64_t v37;
  MIStoreMetadata *storeMetadata;
  objc_super v40;
  _QWORD v41[7];

  v41[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ASDAppReviewAppMetadata;
  v5 = -[ASDAppReviewAppMetadata init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AU"));
    v6 = objc_claimAutoreleasedReturnValue();
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v41[3] = objc_opt_class();
    v41[4] = objc_opt_class();
    v41[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("BA"));
    v11 = objc_claimAutoreleasedReturnValue();
    backgroundAssetMetadata = v5->_backgroundAssetMetadata;
    v5->_backgroundAssetMetadata = (NSDictionary *)v11;

    v5->_beta = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BE"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BI"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EV"));
    v15 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v15;

    v5->_hasMessagesExtension = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IO"));
    v17 = objc_claimAutoreleasedReturnValue();
    initialODRSize = v5->_initialODRSize;
    v5->_initialODRSize = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ID"));
    v19 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IN"));
    v21 = objc_claimAutoreleasedReturnValue();
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v21;

    v5->_launchProhibited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MU"));
    v23 = objc_claimAutoreleasedReturnValue();
    messagesArtworkURL = v5->_messagesArtworkURL;
    v5->_messagesArtworkURL = (NSURL *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PD"));
    v25 = objc_claimAutoreleasedReturnValue();
    packageDPInfo = v5->_packageDPInfo;
    v5->_packageDPInfo = (NSData *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PS"));
    v27 = objc_claimAutoreleasedReturnValue();
    packageSINF = v5->_packageSINF;
    v5->_packageSINF = (NSData *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PU"));
    v29 = objc_claimAutoreleasedReturnValue();
    packageURL = v5->_packageURL;
    v5->_packageURL = (NSURL *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VA"));
    v31 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VN"));
    v33 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OM"));
    v35 = objc_claimAutoreleasedReturnValue();
    onDemandResourceManifest = v5->_onDemandResourceManifest;
    v5->_onDemandResourceManifest = (NSData *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SM"));
    v37 = objc_claimAutoreleasedReturnValue();
    storeMetadata = v5->_storeMetadata;
    v5->_storeMetadata = (MIStoreMetadata *)v37;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *artworkURL;
  id v5;

  artworkURL = self->_artworkURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", artworkURL, CFSTR("AU"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundAssetMetadata, CFSTR("BA"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_beta, CFSTR("BE"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("BI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVersionIdentifier, CFSTR("EV"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMessagesExtension, CFSTR("HM"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialODRSize, CFSTR("IO"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("ID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemName, CFSTR("IN"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_launchProhibited, CFSTR("LP"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagesArtworkURL, CFSTR("MU"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageDPInfo, CFSTR("PD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageSINF, CFSTR("PS"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageURL, CFSTR("PU"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variantID, CFSTR("VA"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("VN"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_onDemandResourceManifest, CFSTR("OM"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeMetadata, CFSTR("SM"));

}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)backgroundAssetMetadata
{
  return self->_backgroundAssetMetadata;
}

- (void)setBackgroundAssetMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSURL)messagesArtworkURL
{
  return self->_messagesArtworkURL;
}

- (void)setMessagesArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)onDemandResourceManifest
{
  return self->_onDemandResourceManifest;
}

- (void)setOnDemandResourceManifest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)packageDPInfo
{
  return self->_packageDPInfo;
}

- (void)setPackageDPInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)packageSINF
{
  return self->_packageSINF;
}

- (void)setPackageSINF:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (MIStoreMetadata)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_packageSINF, 0);
  objc_storeStrong((id *)&self->_packageDPInfo, 0);
  objc_storeStrong((id *)&self->_onDemandResourceManifest, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_backgroundAssetMetadata, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end
