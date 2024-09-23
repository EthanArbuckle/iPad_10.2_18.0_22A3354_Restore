@implementation JFXEffectAsset

- (JFXEffectAsset)initWithAssetID:(id)a3 URL:(id)a4 copyOfAttributes:(id)a5 contentUpdateAvailable:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  JFXEffectAsset *v14;
  JFXEffectAsset *v15;
  uint64_t v16;
  JFXEffectAssetAttributes *attributes;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)JFXEffectAsset;
  v14 = -[JFXEffectAsset init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetID, a3);
    objc_storeStrong((id *)&v15->_localURL, a4);
    v16 = objc_msgSend(v13, "copy");
    attributes = v15->_attributes;
    v15->_attributes = (JFXEffectAssetAttributes *)v16;

    v15->_contentUpdateAvailable = a6;
  }

  return v15;
}

- (JFXEffectAsset)initWithAssetID:(id)a3 URL:(id)a4 copyOfAttributes:(id)a5
{
  return -[JFXEffectAsset initWithAssetID:URL:copyOfAttributes:contentUpdateAvailable:](self, "initWithAssetID:URL:copyOfAttributes:contentUpdateAvailable:", a3, a4, a5, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[JFXEffectAsset assetID](self, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectAsset localURL](self, "localURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("Remote");
  -[JFXEffectAsset attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("assetID %@ URL %@ attributes %@"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  JFXEffectAsset *v4;
  JFXEffectAsset *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (JFXEffectAsset *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[JFXEffectAsset assetID](v5, "assetID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectAsset assetID](self, "assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[JFXEffectAsset assetID](self, "assetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (JFXEffectAssetAttributes)attributes
{
  return self->_attributes;
}

- (BOOL)contentUpdateAvailable
{
  return self->_contentUpdateAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

+ (id)firstAssetInAssets:(id)a3 matchingFilterAttributes:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "attributes", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isMatchingFilterAttributes:", v6);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

@end
