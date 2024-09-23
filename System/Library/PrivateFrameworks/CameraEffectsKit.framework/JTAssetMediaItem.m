@implementation JTAssetMediaItem

- (JTAssetMediaItem)init
{
  JTAssetMediaItem *v2;
  JTAssetMediaItem *v3;
  NSURL *assetLocalURL;
  NSString *assetIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JTAssetMediaItem;
  v2 = -[JFXMediaItem init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    assetLocalURL = v2->_assetLocalURL;
    v2->_assetLocalURL = 0;

    assetIdentifier = v3->_assetIdentifier;
    v3->_assetIdentifier = 0;

  }
  return v3;
}

- (JTAssetMediaItem)initWithAssetIdentifier:(id)a3
{
  id v4;
  JTAssetMediaItem *v5;
  JTAssetMediaItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JTAssetMediaItem;
  v5 = -[JFXMediaItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[JTAssetMediaItem setAssetIdentifier:](v5, "setAssetIdentifier:", v4);
    -[JTAssetMediaItem setAssetLocalURL:](v6, "setAssetLocalURL:", 0);
    -[JTAssetMediaItem fetchAssetForce:](v6, "fetchAssetForce:", 0);
  }

  return v6;
}

- (void)fetchAssetForce:(BOOL)a3
{
  _BOOL4 v3;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[2];

  v3 = a3;
  v35[1] = *MEMORY[0x24BDAC8D0];
  -[JTAssetMediaItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || v3)
  {
    v6 = (void *)MEMORY[0x24BDE3488];
    -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetsWithLocalIdentifiers:options:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[JTAssetMediaItem setAsset:](self, "setAsset:", v10);

      v11 = (void *)MEMORY[0x24BDE3488];
      -[JTAssetMediaItem asset](self, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __36__JTAssetMediaItem_fetchAssetForce___block_invoke;
      v34[3] = &unk_24EE5B8B0;
      v34[4] = self;
      objc_msgSend(v11, "_computeFingerPrintsOfAsset:completionHandler:", v12, v34);

LABEL_22:
      return;
    }
    objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDE3488];
    -[JTAssetMediaItem adjustedFingerprint](self, "adjustedFingerprint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetsMatchingAdjustedFingerPrint:photoLibrary:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[JTAssetMediaItem adjustedFingerprint](self, "adjustedFingerprint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && v16)
    {
      v19 = objc_msgSend(v16, "count");

      if (v19)
      {
        objc_msgSend(v16, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[JTAssetMediaItem setAsset:](self, "setAsset:", v20);
LABEL_21:

        v9 = v16;
        goto LABEL_22;
      }
    }
    else
    {

    }
    v21 = (void *)MEMORY[0x24BDE3488];
    -[JTAssetMediaItem masterFingerprint](self, "masterFingerprint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fetchAssetsMatchingMasterFingerPrint:photoLibrary:", v22, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[JTAssetMediaItem masterFingerprint](self, "masterFingerprint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && v23)
    {
      v26 = objc_msgSend(v23, "count");

      if (v26)
      {
        objc_msgSend(v23, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[JTAssetMediaItem setAsset:](self, "setAsset:", v20);
LABEL_20:
        v16 = v23;
        goto LABEL_21;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000201, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(MEMORY[0x24BDE3570]);
      objc_msgSend(v28, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(v28, "setIncludeHiddenAssets:", 1);
      v29 = (void *)MEMORY[0x24BDD1758];
      -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "predicateWithFormat:", CFSTR("localIdentifier = %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPredicate:", v31);

      objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsInAssetCollection:options:", v27, v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[JTAssetMediaItem setAsset:](self, "setAsset:", v32);

      -[JTAssetMediaItem asset](self, "asset");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        -[JFXMediaItem setMediaState:](self, "setMediaState:", 3);

      goto LABEL_21;
    }
    goto LABEL_20;
  }
}

void __36__JTAssetMediaItem_fetchAssetForce___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setMasterFingerprint:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setAdjustedFingerprint:", v6);

}

- (void)checkIfAssetIsMissing
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[JFXMediaItem mediaState](self, "mediaState"), v4, v5 != 3))
  {
    -[JTAssetMediaItem asset](self, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[JFXMediaItem setMediaState:](self, "setMediaState:", 2);
  }
  else
  {
    -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDD1580]);
      -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "fileExistsAtPath:", v8);

      if ((v9 & 1) == 0)
        -[JFXMediaItem setMediaState:](self, "setMediaState:", 2);

    }
  }
}

- (void)reloadAsset
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXMediaItem setMediaState:](self, "setMediaState:", 1);
    -[JTAssetMediaItem fetchAssetForce:](self, "fetchAssetForce:", 1);
    -[JTAssetMediaItem checkIfAssetIsMissing](self, "checkIfAssetIsMissing");
    -[JTAssetMediaItem asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__JTAssetMediaItem_reloadAsset__block_invoke;
    v5[3] = &unk_24EE5B8D8;
    v5[4] = self;
    objc_msgSend(v4, "isAssetLocalWithCompletion:requiresDerivative:", v5, 0);

  }
}

void __31__JTAssetMediaItem_reloadAsset__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  char v4;
  id v5;

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "mediaState") != 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMediaState:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMediaItemRequiresDownload:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)dealloc
{
  NSURL *assetLocalURL;
  PHAsset *asset;
  objc_super v5;

  assetLocalURL = self->_assetLocalURL;
  self->_assetLocalURL = 0;

  asset = self->_asset;
  self->_asset = 0;

  v5.receiver = self;
  v5.super_class = (Class)JTAssetMediaItem;
  -[JTLocalAssetMediaItem dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (self->_assetLocalURL)
  {
    v8.receiver = self;
    v8.super_class = (Class)JTAssetMediaItem;
    -[JTLocalAssetMediaItem description](&v8, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\turl: %@"), self->_assetLocalURL);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)JTAssetMediaItem;
    -[JTLocalAssetMediaItem description](&v7, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\tasset: %@"), self->_asset);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSString *assetIdentifier;
  uint64_t v7;
  void *v8;
  NSString *adjustedFingerprint;
  uint64_t v10;
  void *v11;
  NSString *masterFingerprint;
  uint64_t v13;
  void *v14;
  PHAsset *asset;
  uint64_t v16;
  void *v17;
  NSURL *assetLocalURL;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)JTAssetMediaItem;
  v5 = -[JTLocalAssetMediaItem copyWithZone:](&v22, sel_copyWithZone_);
  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier)
  {
    v7 = -[NSString copyWithZone:](assetIdentifier, "copyWithZone:", a3);
    v8 = (void *)v5[10];
    v5[10] = v7;
  }
  else
  {
    v8 = (void *)v5[10];
    v5[10] = 0;
  }

  adjustedFingerprint = self->_adjustedFingerprint;
  if (adjustedFingerprint)
  {
    v10 = -[NSString copyWithZone:](adjustedFingerprint, "copyWithZone:", a3);
    v11 = (void *)v5[12];
    v5[12] = v10;
  }
  else
  {
    v11 = (void *)v5[12];
    v5[12] = 0;
  }

  masterFingerprint = self->_masterFingerprint;
  if (masterFingerprint)
  {
    v13 = -[NSString copyWithZone:](masterFingerprint, "copyWithZone:", a3);
    v14 = (void *)v5[11];
    v5[11] = v13;
  }
  else
  {
    v14 = (void *)v5[11];
    v5[11] = 0;
  }

  asset = self->_asset;
  if (asset)
  {
    v16 = -[PHAsset copyWithZone:](asset, "copyWithZone:", a3);
    v17 = (void *)v5[9];
    v5[9] = v16;
  }
  else
  {
    v17 = (void *)v5[9];
    v5[9] = 0;
  }

  assetLocalURL = self->_assetLocalURL;
  if (assetLocalURL)
  {
    v19 = -[NSURL copyWithZone:](assetLocalURL, "copyWithZone:", a3);
    v20 = (void *)v5[13];
    v5[13] = v19;
  }
  else
  {
    v20 = (void *)v5[13];
    v5[13] = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  JTAssetMediaItem *v4;
  JTAssetMediaItem *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v11;

  v4 = (JTAssetMediaItem *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[JTAssetMediaItem asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[JTAssetMediaItem asset](self, "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[JTAssetMediaItem asset](v5, "asset");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)JTAssetMediaItem;
        v9 = -[JTLocalAssetMediaItem isEqual:](&v11, sel_isEqual_, v5);
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
  else
    -[JTAssetMediaItem assetLocalURL](self, "assetLocalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (JTAssetMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  id v5;
  JTAssetMediaItem *v6;
  uint64_t v7;
  NSString *assetIdentifier;
  uint64_t v9;
  NSString *masterFingerprint;
  uint64_t v11;
  NSString *adjustedFingerprint;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)JTAssetMediaItem;
  v5 = a3;
  v6 = -[JTLocalAssetMediaItem initWithInfo:delegate:](&v14, sel_initWithInfo_delegate_, v5, a4);
  objc_msgSend(v5, "objectForKey:", kAssetIdentiferKey, v14.receiver, v14.super_class);
  v7 = objc_claimAutoreleasedReturnValue();
  assetIdentifier = v6->_assetIdentifier;
  v6->_assetIdentifier = (NSString *)v7;

  objc_msgSend(v5, "objectForKey:", kAssetMasterFingerprintKey);
  v9 = objc_claimAutoreleasedReturnValue();
  masterFingerprint = v6->_masterFingerprint;
  v6->_masterFingerprint = (NSString *)v9;

  objc_msgSend(v5, "objectForKey:", kAssetAdjustedFingerprintKey);
  v11 = objc_claimAutoreleasedReturnValue();

  adjustedFingerprint = v6->_adjustedFingerprint;
  v6->_adjustedFingerprint = (NSString *)v11;

  return v6;
}

- (id)info
{
  void *v3;
  void *v4;
  void *v5;
  NSString *assetIdentifier;
  NSString *masterFingerprint;
  NSString *adjustedFingerprint;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = self;
  v10.super_class = (Class)JTAssetMediaItem;
  -[JTLocalAssetMediaItem info](&v10, sel_info);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier)
    objc_msgSend(v5, "setObject:forKey:", assetIdentifier, kAssetIdentiferKey);
  masterFingerprint = self->_masterFingerprint;
  if (masterFingerprint)
    objc_msgSend(v5, "setObject:forKey:", masterFingerprint, kAssetMasterFingerprintKey);
  adjustedFingerprint = self->_adjustedFingerprint;
  if (adjustedFingerprint)
    objc_msgSend(v5, "setObject:forKey:", adjustedFingerprint, kAssetAdjustedFingerprintKey);
  return v5;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)masterFingerprint
{
  return self->_masterFingerprint;
}

- (void)setMasterFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)adjustedFingerprint
{
  return self->_adjustedFingerprint;
}

- (void)setAdjustedFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)assetLocalURL
{
  return self->_assetLocalURL;
}

- (void)setAssetLocalURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetLocalURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocalURL, 0);
  objc_storeStrong((id *)&self->_adjustedFingerprint, 0);
  objc_storeStrong((id *)&self->_masterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
