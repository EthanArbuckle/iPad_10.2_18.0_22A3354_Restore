@implementation ATStoreInfo

- (void)setAdamID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2410]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2410]);
}

- (NSNumber)adamID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2410]);
}

- (void)setDSID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB23F0]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB23F0]);
}

- (NSNumber)DSID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB23F0]);
}

- (void)setCollectionID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2400]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2400]);
}

- (NSNumber)collectionID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2400]);
}

- (void)setSyncID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, CFSTR("ATLegacyAssetSyncID"));
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", CFSTR("ATLegacyAssetSyncID"));
}

- (NSString)syncID
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", CFSTR("ATLegacyAssetSyncID"));
}

- (void)setSubscriptionID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, CFSTR("ATAssetStoreInfoSubscriptionItemID"));
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", CFSTR("ATAssetStoreInfoSubscriptionItemID"));
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", CFSTR("ATAssetStoreInfoSubscriptionItemID"));
}

- (void)setCloudDSID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, CFSTR("ATAssetStoreInfoCloudDSID"));
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", CFSTR("ATAssetStoreInfoCloudDSID"));
}

- (NSNumber)cloudDSID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", CFSTR("ATAssetStoreInfoCloudDSID"));
}

- (void)setVersionID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2440]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2440]);
}

- (NSNumber)versionID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2440]);
}

- (void)setStorefrontID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2408]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2408]);
}

- (NSString)storefrontID
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2408]);
}

- (void)setXID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2450]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2450]);
}

- (NSString)XID
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2450]);
}

- (void)setAppleID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB23E8]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB23E8]);
}

- (NSString)appleID
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB23E8]);
}

- (void)setSagaID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2438]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2438]);
}

- (NSNumber)sagaID
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2438]);
}

- (void)setMatchStatus:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2418]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2418]);
}

- (NSNumber)matchStatus
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2418]);
}

- (void)setRedownloadStatus:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2430]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2430]);
}

- (NSNumber)redownloadStatus
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2430]);
}

- (void)setPodcastEpisodeGUID:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB23B0]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB23B0]);
}

- (NSString)podcastEpisodeGUID
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB23B0]);
}

- (void)setRedownloadParams:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2428]);
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2428]);
}

- (NSString)redownloadParams
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", *MEMORY[0x24BEB2428]);
}

- (void)setEndpointType:(id)a3
{
  NSMutableDictionary *downloadDictionary;

  downloadDictionary = self->_downloadDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](downloadDictionary, "setObject:forKey:", a3, CFSTR("ATAssetStoreInfoEndpointType"));
  else
    -[NSMutableDictionary removeObjectForKey:](downloadDictionary, "removeObjectForKey:", CFSTR("ATAssetStoreInfoEndpointType"));
}

- (NSNumber)endpointType
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_downloadDictionary, "objectForKey:", CFSTR("ATAssetStoreInfoEndpointType"));
}

- (void)setFlavor:(id)a3
{
  NSMutableDictionary *assetDictionary;

  assetDictionary = self->_assetDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](assetDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2230]);
  else
    -[NSMutableDictionary removeObjectForKey:](assetDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2230]);
}

- (NSString)flavor
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_assetDictionary, "objectForKey:", *MEMORY[0x24BEB2230]);
}

- (void)setDimensions:(id)a3
{
  NSMutableDictionary *assetDictionary;

  assetDictionary = self->_assetDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](assetDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2238]);
  else
    -[NSMutableDictionary removeObjectForKey:](assetDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2238]);
}

- (NSString)dimensions
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_assetDictionary, "objectForKey:", *MEMORY[0x24BEB2238]);
}

- (void)setDrmFree:(id)a3
{
  NSMutableDictionary *assetDictionary;

  assetDictionary = self->_assetDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](assetDictionary, "setObject:forKey:", a3, *MEMORY[0x24BEB2228]);
  else
    -[NSMutableDictionary removeObjectForKey:](assetDictionary, "removeObjectForKey:", *MEMORY[0x24BEB2228]);
}

- (NSNumber)drmFree
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_assetDictionary, "objectForKey:", *MEMORY[0x24BEB2228]);
}

- (ATStoreInfo)init
{
  ATStoreInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *downloadDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *assetDictionary;
  ICStoreMediaResponseItem *storeMediaResponseItem;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATStoreInfo;
  v2 = -[ATStoreInfo init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    downloadDictionary = v2->_downloadDictionary;
    v2->_downloadDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetDictionary = v2->_assetDictionary;
    v2->_assetDictionary = v5;

    storeMediaResponseItem = v2->_storeMediaResponseItem;
    v2->_storeMediaResponseItem = 0;

  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *downloadDictionary;
  id v5;

  downloadDictionary = self->_downloadDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", downloadDictionary, CFSTR("downloadDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetDictionary, CFSTR("assetDictionary"));

}

- (ATStoreInfo)initWithCoder:(id)a3
{
  id v4;
  ATStoreInfo *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *downloadDictionary;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *assetDictionary;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ATStoreInfo;
  v5 = -[ATStoreInfo init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("downloadDictionary"));
    v11 = objc_claimAutoreleasedReturnValue();
    downloadDictionary = v5->_downloadDictionary;
    v5->_downloadDictionary = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("assetDictionary"));
    v18 = objc_claimAutoreleasedReturnValue();
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = (NSMutableDictionary *)v18;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATStoreInfo adamID](self, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdamID:", v5);

  -[ATStoreInfo DSID](self, "DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDSID:", v6);

  -[ATStoreInfo cloudDSID](self, "cloudDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudDSID:", v7);

  -[ATStoreInfo collectionID](self, "collectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionID:", v8);

  -[ATStoreInfo versionID](self, "versionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVersionID:", v9);

  -[ATStoreInfo drmFree](self, "drmFree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDrmFree:", v10);

  -[ATStoreInfo sagaID](self, "sagaID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSagaID:", v11);

  -[ATStoreInfo subscriptionID](self, "subscriptionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscriptionID:", v12);

  -[ATStoreInfo matchStatus](self, "matchStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchStatus:", v13);

  -[ATStoreInfo redownloadStatus](self, "redownloadStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRedownloadStatus:", v14);

  -[ATStoreInfo endpointType](self, "endpointType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndpointType:", v15);

  -[ATStoreInfo appleID](self, "appleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppleID:", v16);

  -[ATStoreInfo syncID](self, "syncID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyncID:", v17);

  -[ATStoreInfo storefrontID](self, "storefrontID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStorefrontID:", v18);

  -[ATStoreInfo XID](self, "XID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setXID:", v19);

  -[ATStoreInfo flavor](self, "flavor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlavor:", v20);

  -[ATStoreInfo dimensions](self, "dimensions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimensions:", v21);

  -[ATStoreInfo podcastEpisodeGUID](self, "podcastEpisodeGUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPodcastEpisodeGUID:", v22);

  -[ATStoreInfo redownloadParams](self, "redownloadParams");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRedownloadParams:", v23);

  return v4;
}

- (NSDictionary)downloadDictionary
{
  return &self->_downloadDictionary->super;
}

- (NSDictionary)assetDictionary
{
  return &self->_assetDictionary->super;
}

- (ICStoreMediaResponseItem)storeMediaResponseItem
{
  return self->_storeMediaResponseItem;
}

- (void)setStoreMediaResponseItem:(id)a3
{
  objc_storeStrong((id *)&self->_storeMediaResponseItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMediaResponseItem, 0);
  objc_storeStrong((id *)&self->_assetDictionary, 0);
  objc_storeStrong((id *)&self->_downloadDictionary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
