@implementation BLPurchaseResponseItem

- (BLPurchaseResponseItem)init
{
  BLPurchaseResponseItem *v2;
  BLPurchaseResponseItem *v3;
  NSDictionary *item;
  NSDictionary *metadata;
  NSString *downloadID;
  NSString *purchaseParameters;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLPurchaseResponseItem;
  v2 = -[BLPurchaseResponseItem init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    item = v2->_item;
    v2->_item = 0;

    metadata = v3->_metadata;
    v3->_metadata = 0;

    downloadID = v3->_downloadID;
    v3->_downloadID = 0;

    purchaseParameters = v3->_purchaseParameters;
    v3->_purchaseParameters = 0;

    *(_WORD *)&v3->_isPurchaseRedownload = 0;
    v3->_isPDF = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLPurchaseResponseItem)initWithCoder:(id)a3
{
  id v4;
  BLPurchaseResponseItem *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *item;
  uint64_t v14;
  NSString *downloadID;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *metadata;
  uint64_t v24;
  NSString *purchaseParameters;

  v4 = a3;
  v5 = -[BLPurchaseResponseItem init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("item"));
    v12 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadID"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadID = v5->_downloadID;
    v5->_downloadID = (NSString *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("metadata"));
    v22 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseParameters"));
    v24 = objc_claimAutoreleasedReturnValue();
    purchaseParameters = v5->_purchaseParameters;
    v5->_purchaseParameters = (NSString *)v24;

    v5->_isPurchaseRedownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPurchaseRedownload"));
    v5->_isAudiobook = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAudiobook"));
    v5->_isPDF = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPDF"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[BLPurchaseResponseItem item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("item"));

  -[BLPurchaseResponseItem downloadID](self, "downloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("downloadID"));

  -[BLPurchaseResponseItem metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("metadata"));

  -[BLPurchaseResponseItem purchaseParameters](self, "purchaseParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("purchaseParameters"));

  objc_msgSend(v8, "encodeBool:forKey:", -[BLPurchaseResponseItem isPurchaseRedownload](self, "isPurchaseRedownload"), CFSTR("isPurchaseRedownload"));
  objc_msgSend(v8, "encodeBool:forKey:", -[BLPurchaseResponseItem isAudiobook](self, "isAudiobook"), CFSTR("isAudiobook"));
  objc_msgSend(v8, "encodeBool:forKey:", -[BLPurchaseResponseItem isPDF](self, "isPDF"), CFSTR("isPDF"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[BLPurchaseResponseItem item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItem:", v5);

    -[BLPurchaseResponseItem downloadID](self, "downloadID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDownloadID:", v6);

    -[BLPurchaseResponseItem metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMetadata:", v7);

    -[BLPurchaseResponseItem purchaseParameters](self, "purchaseParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPurchaseParameters:", v8);

    objc_msgSend(v4, "setIsPurchaseRedownload:", -[BLPurchaseResponseItem isPurchaseRedownload](self, "isPurchaseRedownload"));
    objc_msgSend(v4, "setIsAudiobook:", -[BLPurchaseResponseItem isAudiobook](self, "isAudiobook"));
    objc_msgSend(v4, "setIsPDF:", -[BLPurchaseResponseItem isPDF](self, "isPDF"));
  }
  return v4;
}

- (NSDictionary)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)purchaseParameters
{
  return self->_purchaseParameters;
}

- (void)setPurchaseParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isPurchaseRedownload
{
  return self->_isPurchaseRedownload;
}

- (void)setIsPurchaseRedownload:(BOOL)a3
{
  self->_isPurchaseRedownload = a3;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (BOOL)isPDF
{
  return self->_isPDF;
}

- (void)setIsPDF:(BOOL)a3
{
  self->_isPDF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseParameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
