@implementation ASDWatchAppMetadata

+ (id)metadataFromStoreMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStoreMetadata:", v4);

  return v5;
}

- (ASDWatchAppMetadata)initWithItemID:(id)a3
{
  return -[ASDWatchAppMetadata initWithItemID:externalVersionID:](self, "initWithItemID:externalVersionID:", a3, 0);
}

- (ASDWatchAppMetadata)initWithItemID:(id)a3 externalVersionID:(id)a4
{
  id v6;
  id v7;
  ASDWatchAppMetadata *v8;
  uint64_t v9;
  NSNumber *itemID;
  uint64_t v11;
  NSNumber *externalVersionID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDWatchAppMetadata;
  v8 = -[ASDWatchAppMetadata init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    itemID = v8->_itemID;
    v8->_itemID = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    externalVersionID = v8->_externalVersionID;
    v8->_externalVersionID = (NSNumber *)v11;

  }
  return v8;
}

- (ASDWatchAppMetadata)initWithStoreMetadata:(id)a3
{
  id v4;
  ASDWatchAppMetadata *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSNumber *downloaderID;
  uint64_t v14;
  NSNumber *externalVersionID;
  uint64_t v16;
  NSNumber *itemID;
  uint64_t v18;
  NSNumber *purchaserID;
  uint64_t v20;
  NSString *redownloadParams;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDWatchAppMetadata;
  v5 = -[ASDWatchAppMetadata init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "altDSID");
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "appleID");
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    objc_msgSend(v4, "softwareVersionBundleID");
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "downloaderID");
    v12 = objc_claimAutoreleasedReturnValue();
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v12;

    objc_msgSend(v4, "softwareVersionExternalIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    externalVersionID = v5->_externalVersionID;
    v5->_externalVersionID = (NSNumber *)v14;

    objc_msgSend(v4, "itemID");
    v16 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v16;

    objc_msgSend(v4, "purchaserID");
    v18 = objc_claimAutoreleasedReturnValue();
    purchaserID = v5->_purchaserID;
    v5->_purchaserID = (NSNumber *)v18;

    objc_msgSend(v4, "redownloadParams");
    v20 = objc_claimAutoreleasedReturnValue();
    redownloadParams = v5->_redownloadParams;
    v5->_redownloadParams = (NSString *)v20;

  }
  return v5;
}

- (int64_t)metadataType
{
  return 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDWatchAppMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = -[ASDWatchAppMetadata init](+[ASDWatchAppMetadata allocWithZone:](ASDWatchAppMetadata, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setAltDSID:](v5, "setAltDSID:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_appleID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setAppleID:](v5, "setAppleID:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setBundleID:](v5, "setBundleID:", v8);

  v9 = (void *)-[NSNumber copyWithZone:](self->_downloaderID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setDownloaderID:](v5, "setDownloaderID:", v9);

  v10 = (void *)-[NSNumber copyWithZone:](self->_externalVersionID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setExternalVersionID:](v5, "setExternalVersionID:", v10);

  v11 = (void *)-[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setItemID:](v5, "setItemID:", v11);

  v12 = (void *)-[NSNumber copyWithZone:](self->_previousExternalVersionID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setPreviousExternalVersionID:](v5, "setPreviousExternalVersionID:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_previousVariantID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setPreviousVariantID:](v5, "setPreviousVariantID:", v13);

  v14 = (void *)-[NSNumber copyWithZone:](self->_purchaserID, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setPurchaserID:](v5, "setPurchaserID:", v14);

  v15 = (void *)-[NSString copyWithZone:](self->_redownloadParams, "copyWithZone:", a3);
  -[ASDWatchAppMetadata setRedownloadParams:](v5, "setRedownloadParams:", v15);

  -[ASDWatchAppMetadata setSkipIfInstalled:](v5, "setSkipIfInstalled:", self->_skipIfInstalled);
  -[ASDWatchAppMetadata setUserInitiated:](v5, "setUserInitiated:", self->_userInitiated);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDWatchAppMetadata)initWithCoder:(id)a3
{
  id v4;
  ASDWatchAppMetadata *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSNumber *downloaderID;
  uint64_t v14;
  NSNumber *externalVersionID;
  uint64_t v16;
  NSNumber *itemID;
  uint64_t v18;
  NSNumber *previousExternalVersionID;
  uint64_t v20;
  NSString *previousVariantID;
  uint64_t v22;
  NSNumber *purchaserID;
  uint64_t v24;
  NSString *redownloadParams;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ASDWatchAppMetadata;
  v5 = -[ASDWatchAppMetadata init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AD"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AI"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BI"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DI"));
    v12 = objc_claimAutoreleasedReturnValue();
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EV"));
    v14 = objc_claimAutoreleasedReturnValue();
    externalVersionID = v5->_externalVersionID;
    v5->_externalVersionID = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ID"));
    v16 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PE"));
    v18 = objc_claimAutoreleasedReturnValue();
    previousExternalVersionID = v5->_previousExternalVersionID;
    v5->_previousExternalVersionID = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PV"));
    v20 = objc_claimAutoreleasedReturnValue();
    previousVariantID = v5->_previousVariantID;
    v5->_previousVariantID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PI"));
    v22 = objc_claimAutoreleasedReturnValue();
    purchaserID = v5->_purchaserID;
    v5->_purchaserID = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BP"));
    v24 = objc_claimAutoreleasedReturnValue();
    redownloadParams = v5->_redownloadParams;
    v5->_redownloadParams = (NSString *)v24;

    v5->_skipIfInstalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SK"));
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UI"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("AD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("AI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("BI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloaderID, CFSTR("DI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVersionID, CFSTR("EV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("ID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousExternalVersionID, CFSTR("PE"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousVariantID, CFSTR("PV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaserID, CFSTR("PI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redownloadParams, CFSTR("BP"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_skipIfInstalled, CFSTR("SK"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userInitiated, CFSTR("UI"));

}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)downloaderID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownloaderID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)externalVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExternalVersionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setItemID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)previousExternalVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousExternalVersionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)previousVariantID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPreviousVariantID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)purchaserID
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPurchaserID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)redownloadParams
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRedownloadParams:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)skipIfInstalled
{
  return self->_skipIfInstalled;
}

- (void)setSkipIfInstalled:(BOOL)a3
{
  self->_skipIfInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_purchaserID, 0);
  objc_storeStrong((id *)&self->_previousVariantID, 0);
  objc_storeStrong((id *)&self->_previousExternalVersionID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_downloaderID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
