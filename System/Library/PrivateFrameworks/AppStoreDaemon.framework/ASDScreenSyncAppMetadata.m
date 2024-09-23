@implementation ASDScreenSyncAppMetadata

- (ASDScreenSyncAppMetadata)initWithBundleID:(id)a3
{
  id v5;
  ASDScreenSyncAppMetadata *v6;
  ASDScreenSyncAppMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDScreenSyncAppMetadata;
  v6 = -[ASDScreenSyncAppMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleID, a3);

  return v7;
}

- (int64_t)metadataType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDScreenSyncAppMetadata *v5;
  void *v6;
  ASDScreenSyncAppMetadata *v7;
  uint64_t v8;
  NSString *accountName;
  uint64_t v10;
  NSNumber *externalVersionIdentifier;
  uint64_t v12;
  NSNumber *itemID;
  uint64_t v14;
  NSString *itemName;
  uint64_t v16;
  NSNumber *purchaserDSID;
  uint64_t v18;
  NSNumber *storeFront;
  uint64_t v20;
  NSString *vendorName;

  v5 = +[ASDScreenSyncAppMetadata allocWithZone:](ASDScreenSyncAppMetadata, "allocWithZone:");
  v6 = (void *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v7 = -[ASDScreenSyncAppMetadata initWithBundleID:](v5, "initWithBundleID:", v6);

  v8 = -[NSString copyWithZone:](self->_accountName, "copyWithZone:", a3);
  accountName = v7->_accountName;
  v7->_accountName = (NSString *)v8;

  v10 = -[NSNumber copyWithZone:](self->_externalVersionIdentifier, "copyWithZone:", a3);
  externalVersionIdentifier = v7->_externalVersionIdentifier;
  v7->_externalVersionIdentifier = (NSNumber *)v10;

  v12 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v7->_itemID;
  v7->_itemID = (NSNumber *)v12;

  v14 = -[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  itemName = v7->_itemName;
  v7->_itemName = (NSString *)v14;

  v16 = -[NSNumber copyWithZone:](self->_purchaserDSID, "copyWithZone:", a3);
  purchaserDSID = v7->_purchaserDSID;
  v7->_purchaserDSID = (NSNumber *)v16;

  v18 = -[NSNumber copyWithZone:](self->_storeFront, "copyWithZone:", a3);
  storeFront = v7->_storeFront;
  v7->_storeFront = (NSNumber *)v18;

  v20 = -[NSString copyWithZone:](self->_vendorName, "copyWithZone:", a3);
  vendorName = v7->_vendorName;
  v7->_vendorName = (NSString *)v20;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDScreenSyncAppMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDScreenSyncAppMetadata *v6;
  uint64_t v7;
  NSString *accountName;
  uint64_t v9;
  NSNumber *externalVersionIdentifier;
  uint64_t v11;
  NSNumber *itemID;
  uint64_t v13;
  NSString *itemName;
  uint64_t v15;
  NSNumber *storeFront;
  uint64_t v17;
  NSString *vendorName;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDScreenSyncAppMetadata initWithBundleID:](self, "initWithBundleID:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AN"));
    v7 = objc_claimAutoreleasedReturnValue();
    accountName = v6->_accountName;
    v6->_accountName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EV"));
    v9 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v6->_externalVersionIdentifier;
    v6->_externalVersionIdentifier = (NSNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ID"));
    v11 = objc_claimAutoreleasedReturnValue();
    itemID = v6->_itemID;
    v6->_itemID = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IN"));
    v13 = objc_claimAutoreleasedReturnValue();
    itemName = v6->_itemName;
    v6->_itemName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SF"));
    v15 = objc_claimAutoreleasedReturnValue();
    storeFront = v6->_storeFront;
    v6->_storeFront = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VN"));
    v17 = objc_claimAutoreleasedReturnValue();
    vendorName = v6->_vendorName;
    v6->_vendorName = (NSString *)v17;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountName;
  id v5;

  accountName = self->_accountName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountName, CFSTR("AN"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("BI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVersionIdentifier, CFSTR("EV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("ID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemName, CFSTR("IN"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaserDSID, CFSTR("PD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeFront, CFSTR("SF"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("VN"));

}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)externalVersionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)itemName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setItemName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPurchaserDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)storeFront
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStoreFront:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
