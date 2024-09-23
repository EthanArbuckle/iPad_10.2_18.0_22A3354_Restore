@implementation MPCMRContentItemRemoteArtworkToken

- (MPCMRContentItemRemoteArtworkToken)initWithIdentifier:(id)a3 artworkIdentifier:(id)a4 supportedRemoteArtworkFormats:(id)a5 remoteArtworks:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPCMRContentItemRemoteArtworkToken *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *artworkIdentifier;
  uint64_t v19;
  NSArray *supportedRemoteArtworkFormats;
  NSDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MPArtworkCatalog *v30;
  void *v31;
  void *v32;
  void *v33;
  MPArtworkCatalog *storeArtworkCatalog;
  void *v36;
  objc_super v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)MPCMRContentItemRemoteArtworkToken;
  v14 = -[MPCMRContentItemRemoteArtworkToken init](&v37, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    artworkIdentifier = v14->_artworkIdentifier;
    v14->_artworkIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    supportedRemoteArtworkFormats = v14->_supportedRemoteArtworkFormats;
    v14->_supportedRemoteArtworkFormats = (NSArray *)v19;

    objc_storeStrong((id *)&v14->_remoteArtworks, a6);
    v21 = v14->_remoteArtworks;
    if (!-[NSDictionary count](v21, "count"))
    {
      v30 = 0;
LABEL_14:

      storeArtworkCatalog = v14->_storeArtworkCatalog;
      v14->_storeArtworkCatalog = v30;

      goto LABEL_15;
    }
    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x24BDDC480]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
      goto LABEL_12;
    objc_msgSend(v22, "artworkURLTemplateData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v23, "artworkURLTemplateData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "JSONObjectWithData:options:error:", v26, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C0]), "initWithArtworkResponseDictionary:", v27);

        if (v28)
          goto LABEL_10;
      }
    }
    objc_msgSend(v23, "artworkURLString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (MPArtworkCatalog *)objc_msgSend(v29, "length");

    if (!v30)
      goto LABEL_13;
    v31 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v23, "artworkURLString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLWithString:", v32);
    v30 = (MPArtworkCatalog *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_13;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C0]), "initWithArtworkURL:", v30);

    if (v28)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x24BDDCC08], "tokenWithImageArtworkInfo:", v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (MPArtworkCatalog *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6D8]), "initWithToken:dataSource:", v36, v33);

    }
    else
    {
LABEL_12:
      v30 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  MPCMRContentItemRemoteArtworkToken *v4;
  MPCMRContentItemRemoteArtworkToken *v5;
  NSString *identifier;
  NSString *v7;
  int v8;
  char v9;
  NSString *artworkIdentifier;
  NSString *v11;
  int v12;
  NSArray *supportedRemoteArtworkFormats;
  NSArray *v14;
  int v15;
  NSDictionary *remoteArtworks;
  NSDictionary *v17;

  v4 = (MPCMRContentItemRemoteArtworkToken *)a3;
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
      identifier = self->_identifier;
      -[MPCMRContentItemRemoteArtworkToken identifier](v5, "identifier");
      v7 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (identifier == v7)
      {

      }
      else
      {
        v8 = -[NSString isEqual:](identifier, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      artworkIdentifier = self->_artworkIdentifier;
      -[MPCMRContentItemRemoteArtworkToken artworkIdentifier](v5, "artworkIdentifier");
      v11 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      if (artworkIdentifier == v11)
      {

      }
      else
      {
        v12 = -[NSString isEqual:](artworkIdentifier, "isEqual:", v11);

        if (!v12)
        {
          v9 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      supportedRemoteArtworkFormats = self->_supportedRemoteArtworkFormats;
      -[MPCMRContentItemRemoteArtworkToken supportedRemoteArtworkFormats](v5, "supportedRemoteArtworkFormats");
      v14 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      if (supportedRemoteArtworkFormats == v14)
      {

      }
      else
      {
        v15 = -[NSArray isEqual:](supportedRemoteArtworkFormats, "isEqual:", v14);

        if (!v15)
        {
          v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      remoteArtworks = self->_remoteArtworks;
      -[MPCMRContentItemRemoteArtworkToken remoteArtworks](v5, "remoteArtworks");
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (remoteArtworks == v17)
        v9 = 1;
      else
        v9 = -[NSDictionary isEqual:](remoteArtworks, "isEqual:", v17);

      goto LABEL_21;
    }
    v9 = 0;
  }
LABEL_24:

  return v9;
}

- (id)stringRepresentation
{
  void *v2;
  void *v3;

  -[MPCMRContentItemRemoteArtworkToken artworkIdentifier](self, "artworkIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)setFittingSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[MPCMRContentItemRemoteArtworkToken storeArtworkCatalog](self, "storeArtworkCatalog");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFittingSize:", width, height);

}

- (void)setDestinationScale:(double)a3
{
  id v4;

  -[MPCMRContentItemRemoteArtworkToken storeArtworkCatalog](self, "storeArtworkCatalog");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationScale:", a3);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (NSArray)supportedRemoteArtworkFormats
{
  return self->_supportedRemoteArtworkFormats;
}

- (NSDictionary)remoteArtworks
{
  return self->_remoteArtworks;
}

- (MPArtworkCatalog)storeArtworkCatalog
{
  return self->_storeArtworkCatalog;
}

- (void)setStoreArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_storeArtworkCatalog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeArtworkCatalog, 0);
  objc_storeStrong((id *)&self->_remoteArtworks, 0);
  objc_storeStrong((id *)&self->_supportedRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
