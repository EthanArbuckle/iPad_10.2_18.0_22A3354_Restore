@implementation BLRestoreRequestItem

- (BLRestoreRequestItem)initWithDownloadDictionary:(id)a3 assetDictionary:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  BLRestoreRequestItem *v10;
  BLRestoreRequestItem *v11;
  objc_super v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    BLServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "ContentRestore: downloadDictionary cannot be nil. Restore will fail", buf, 2u);
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)BLRestoreRequestItem;
  v10 = -[BLRestoreRequestItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_downloadDictionary, a3);
    objc_storeStrong((id *)&v11->_assetDictionary, a4);
  }

  return v11;
}

- (BLRestoreRequestItem)initWithDownloadMetadataDictionary:(id)a3 additionalDownloadPropertiesDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BLDownloadMetadata *v9;
  void *v10;
  void *v11;
  BLRestoreRequestItem *v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    BLServiceLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "ContentRestore: downloadMetadataDictionary cannot be nil. Restore will fail", v14, 2u);
    }

  }
  v9 = -[BLDownloadMetadata initWithDictionary:]([BLDownloadMetadata alloc], "initWithDictionary:", v6);
  objc_msgSend((id)objc_opt_class(), "_downloadDictionaryWithDownloadMetadata:additionalDownloadPropertiesDictionary:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_assetDictionaryWithDownloadMetadata:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BLRestoreRequestItem initWithDownloadDictionary:assetDictionary:](self, "initWithDownloadDictionary:assetDictionary:", v10, v11);

  return v12;
}

+ (id)_downloadDictionaryWithDownloadMetadata:(id)a3 additionalDownloadPropertiesDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
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
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", objc_msgSend(v5, "collectionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", objc_msgSend(v5, "itemIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("7"));

  objc_msgSend(v5, "valueForMetadataKey:", CFSTR("s"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("T"));

  objc_msgSend(v5, "valueForMetadataKey:", CFSTR("softwareVersionExternalIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("R"));

  objc_msgSend(v5, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("2"));

  objc_msgSend(v5, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("accountInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v17 = 0;
    v18 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DSPersonID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BLGetNSNumberFromValue(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AppleID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("U"));
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v5, "valueForMetadataKey:", CFSTR("appleId"));
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("Z"));
  if (v6)
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  return v7;
}

+ (id)_assetDictionaryWithDownloadMetadata:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "valueForMetadataKey:", CFSTR("asset-info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flavor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("g"));

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLRestoreRequestItem)initWithCoder:(id)a3
{
  id v4;
  BLRestoreRequestItem *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *downloadDictionary;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *assetDictionary;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BLRestoreRequestItem;
  v5 = -[BLRestoreRequestItem init](&v21, sel_init);
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
    v5->_downloadDictionary = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("assetDictionary"));
    v18 = objc_claimAutoreleasedReturnValue();
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = (NSDictionary *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *downloadDictionary;
  id v5;

  downloadDictionary = self->_downloadDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", downloadDictionary, CFSTR("downloadDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetDictionary, CFSTR("assetDictionary"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[BLRestoreRequestItem downloadDictionary](self, "downloadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDownloadDictionary:", v6);

  -[BLRestoreRequestItem assetDictionary](self, "assetDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAssetDictionary:", v8);

  return v4;
}

- (NSDictionary)downloadDictionary
{
  return self->_downloadDictionary;
}

- (void)setDownloadDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDictionary, a3);
}

- (NSDictionary)assetDictionary
{
  return self->_assetDictionary;
}

- (void)setAssetDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_assetDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDictionary, 0);
  objc_storeStrong((id *)&self->_downloadDictionary, 0);
}

@end
