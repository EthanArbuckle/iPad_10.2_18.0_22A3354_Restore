@implementation DDSMAAsset

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)DDSMAAsset,
        -[DDSAsset isEqual:](&v11, sel_isEqual_, v4)))
  {
    -[DDSMAAsset maAsset](self, "maAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MAAsset)maAsset
{
  return self->_maAsset;
}

- (DDSMAAsset)initWithMAAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DDSMAAsset *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKey:", CFSTR("AssetType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "assetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_5;
    objc_msgSend(v5, "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("AssetType"));
  }

LABEL_5:
  objc_msgSend(v5, "getLocalUrl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)DDSMAAsset;
  v11 = -[DDSAsset initWithAttributes:localURL:](&v13, sel_initWithAttributes_localURL_, v7, v10);

  if (v11)
    objc_storeStrong((id *)&v11->_maAsset, a3);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maAsset, 0);
}

@end
