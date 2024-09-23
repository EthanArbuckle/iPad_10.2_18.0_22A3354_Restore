@implementation ASDApplicationMetadata

- (ASDApplicationMetadata)initWithBundleID:(id)a3
{
  id v5;
  ASDApplicationMetadata *v6;
  ASDApplicationMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDApplicationMetadata;
  v6 = -[ASDApplicationMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleID, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDApplicationMetadata *v5;
  uint64_t v6;
  NSString *accountName;
  uint64_t v8;
  NSNumber *accountID;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSString *artworkPath;
  uint64_t v14;
  NSString *bundleID;
  uint64_t v16;
  NSString *bundleVersion;
  uint64_t v18;
  NSString *cohort;
  uint64_t v20;
  NSString *deviceVendorID;
  uint64_t v22;
  NSNumber *downloaderID;
  uint64_t v24;
  NSNumber *externalVersionIdentifier;
  uint64_t v26;
  NSNumber *familyID;
  uint64_t v28;
  NSNumber *installOrder;
  uint64_t v30;
  NSNumber *itemID;
  uint64_t v32;
  NSString *itemName;
  uint64_t v34;
  NSNumber *purchaserDSID;
  uint64_t v36;
  NSString *shortVersion;
  uint64_t v38;
  NSNumber *storeFront;
  uint64_t v40;
  NSString *vendorName;

  v5 = -[ASDApplicationMetadata init](+[ASDApplicationMetadata allocWithZone:](ASDApplicationMetadata, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountName, "copyWithZone:", a3);
  accountName = v5->_accountName;
  v5->_accountName = (NSString *)v6;

  v8 = -[NSNumber copyWithZone:](self->_accountID, "copyWithZone:", a3);
  accountID = v5->_accountID;
  v5->_accountID = (NSNumber *)v8;

  v10 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_artworkPath, "copyWithZone:", a3);
  artworkPath = v5->_artworkPath;
  v5->_artworkPath = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_cohort, "copyWithZone:", a3);
  cohort = v5->_cohort;
  v5->_cohort = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_deviceVendorID, "copyWithZone:", a3);
  deviceVendorID = v5->_deviceVendorID;
  v5->_deviceVendorID = (NSString *)v20;

  v5->_deviceBasedVPP = self->_deviceBasedVPP;
  v22 = -[NSNumber copyWithZone:](self->_downloaderID, "copyWithZone:", a3);
  downloaderID = v5->_downloaderID;
  v5->_downloaderID = (NSNumber *)v22;

  v24 = -[NSNumber copyWithZone:](self->_externalVersionIdentifier, "copyWithZone:", a3);
  externalVersionIdentifier = v5->_externalVersionIdentifier;
  v5->_externalVersionIdentifier = (NSNumber *)v24;

  v26 = -[NSNumber copyWithZone:](self->_familyID, "copyWithZone:", a3);
  familyID = v5->_familyID;
  v5->_familyID = (NSNumber *)v26;

  v5->_isBeta = self->_isBeta;
  v5->_isClip = self->_isClip;
  v28 = -[NSNumber copyWithZone:](self->_installOrder, "copyWithZone:", a3);
  installOrder = v5->_installOrder;
  v5->_installOrder = (NSNumber *)v28;

  v30 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v30;

  v32 = -[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  itemName = v5->_itemName;
  v5->_itemName = (NSString *)v32;

  v34 = -[NSNumber copyWithZone:](self->_purchaserDSID, "copyWithZone:", a3);
  purchaserDSID = v5->_purchaserDSID;
  v5->_purchaserDSID = (NSNumber *)v34;

  v36 = -[NSString copyWithZone:](self->_shortVersion, "copyWithZone:", a3);
  shortVersion = v5->_shortVersion;
  v5->_shortVersion = (NSString *)v36;

  v38 = -[NSNumber copyWithZone:](self->_storeFront, "copyWithZone:", a3);
  storeFront = v5->_storeFront;
  v5->_storeFront = (NSNumber *)v38;

  v40 = -[NSString copyWithZone:](self->_vendorName, "copyWithZone:", a3);
  vendorName = v5->_vendorName;
  v5->_vendorName = (NSString *)v40;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDApplicationMetadata)initWithCoder:(id)a3
{
  id v4;
  ASDApplicationMetadata *v5;
  uint64_t v6;
  NSString *accountName;
  uint64_t v8;
  NSNumber *accountID;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSString *artworkPath;
  uint64_t v14;
  NSString *bundleID;
  uint64_t v16;
  NSString *bundleVersion;
  uint64_t v18;
  NSString *cohort;
  uint64_t v20;
  NSString *deviceVendorID;
  uint64_t v22;
  NSNumber *downloaderID;
  uint64_t v24;
  NSNumber *externalVersionIdentifier;
  uint64_t v26;
  NSNumber *familyID;
  uint64_t v28;
  NSNumber *itemID;
  uint64_t v30;
  NSNumber *installOrder;
  uint64_t v32;
  NSString *itemName;
  uint64_t v34;
  NSNumber *purchaserDSID;
  uint64_t v36;
  NSString *shortVersion;
  uint64_t v38;
  NSNumber *storeFront;
  uint64_t v40;
  NSString *vendorName;

  v4 = a3;
  v5 = -[ASDApplicationMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountName"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    artworkPath = v5->_artworkPath;
    v5->_artworkPath = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cohort"));
    v18 = objc_claimAutoreleasedReturnValue();
    cohort = v5->_cohort;
    v5->_cohort = (NSString *)v18;

    v5->_deviceBasedVPP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceBasedVPP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceVendorID"));
    v20 = objc_claimAutoreleasedReturnValue();
    deviceVendorID = v5->_deviceVendorID;
    v5->_deviceVendorID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloaderID"));
    v22 = objc_claimAutoreleasedReturnValue();
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalVersionIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyID"));
    v26 = objc_claimAutoreleasedReturnValue();
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v28 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installOrder"));
    v30 = objc_claimAutoreleasedReturnValue();
    installOrder = v5->_installOrder;
    v5->_installOrder = (NSNumber *)v30;

    v5->_isBeta = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBeta"));
    v5->_isClip = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isClip"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
    v32 = objc_claimAutoreleasedReturnValue();
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaserDSID"));
    v34 = objc_claimAutoreleasedReturnValue();
    purchaserDSID = v5->_purchaserDSID;
    v5->_purchaserDSID = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortVersion"));
    v36 = objc_claimAutoreleasedReturnValue();
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeFront"));
    v38 = objc_claimAutoreleasedReturnValue();
    storeFront = v5->_storeFront;
    v5->_storeFront = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
    v40 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v40;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountName;
  id v5;

  accountName = self->_accountName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountName, CFSTR("accountName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountID, CFSTR("accountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkPath, CFSTR("artworkPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cohort, CFSTR("cohort"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceVendorID, CFSTR("deviceVendorID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deviceBasedVPP, CFSTR("deviceBasedVPP"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloaderID, CFSTR("downloaderID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVersionIdentifier, CFSTR("externalVersionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyID, CFSTR("familyID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installOrder, CFSTR("installOrder"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBeta, CFSTR("isBeta"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isClip, CFSTR("isClip"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemName, CFSTR("itemName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaserDSID, CFSTR("purchaserDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortVersion, CFSTR("shortVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeFront, CFSTR("storeFront"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("vendorName"));

}

- (id)description
{
  NSNumber *downloaderID;
  NSString *bundleID;
  NSString *itemName;
  NSNumber *itemID;
  uint64_t v7;

  downloaderID = self->_downloaderID;
  bundleID = self->_bundleID;
  itemID = self->_itemID;
  itemName = self->_itemName;
  if (downloaderID)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ bundleID: %@ itemName: %@ itemID: %@ downloaderID %@ familyID: %@ }"), bundleID, itemName, itemID, downloaderID, self->_familyID);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ bundleID: %@ itemName: %@ itemID: %@ installOrder: %@ }"), bundleID, itemName, itemID, self->_installOrder, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artworkPath
{
  return self->_artworkPath;
}

- (void)setArtworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)cohort
{
  return self->_cohort;
}

- (void)setCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)deviceVendorID
{
  return self->_deviceVendorID;
}

- (void)setDeviceVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)deviceBasedVPP
{
  return self->_deviceBasedVPP;
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  self->_deviceBasedVPP = a3;
}

- (NSNumber)downloaderID
{
  return self->_downloaderID;
}

- (void)setDownloaderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (void)setIsClip:(BOOL)a3
{
  self->_isClip = a3;
}

- (NSNumber)installOrder
{
  return self->_installOrder;
}

- (void)setInstallOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)purchaserDSID
{
  return self->_purchaserDSID;
}

- (void)setPurchaserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_installOrder, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_downloaderID, 0);
  objc_storeStrong((id *)&self->_deviceVendorID, 0);
  objc_storeStrong((id *)&self->_cohort, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artworkPath, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
