@implementation MAAbsoluteAssetId

- (id)allAttributesHash
{
  return self->_allAttributesHash;
}

- (id)nonIdHash
{
  return self->_nonAssetIdHash;
}

- (id)contentHash
{
  return self->_downloadContentHash;
}

- (id)urlHash
{
  return self->_downloadUrlHash;
}

- (id)policyHash
{
  return self->_downloadPolicyHash;
}

- (id)assetIdHash
{
  return self->_assetIdHash;
}

- (id)pallasDynamicAssetIdHash
{
  return self->_pallasAssetIdHash;
}

- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4
{
  return -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:](self, "initWithAssetId:forAssetType:attributes:", a3, a4, 0);
}

- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4 attributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  MAAbsoluteAssetId *v12;
  MAAbsoluteAssetId *v13;
  uint64_t v14;
  NSString *allAttributesHash;
  uint64_t v16;
  NSString *assetIdHash;
  uint64_t v18;
  NSString *nonAssetIdHash;
  void *v20;
  uint64_t v21;
  NSString *downloadContentHash;
  void *v23;
  uint64_t v24;
  NSString *downloadUrlHash;
  void *v26;
  uint64_t v27;
  NSString *downloadPolicyHash;
  void *v29;
  uint64_t v30;
  NSString *pallasAssetIdHash;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MAAbsoluteAssetId;
  v12 = -[MAAbsoluteAssetId init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetType, a4);
    objc_storeStrong((id *)&v13->_assetId, a3);
    getHashFromAttributesInSet(v10, v11, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    allAttributesHash = v13->_allAttributesHash;
    v13->_allAttributesHash = (NSString *)v14;

    getHashFromAssetIdAttributes(v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    assetIdHash = v13->_assetIdHash;
    v13->_assetIdHash = (NSString *)v16;

    getHashFromNonAssetIdAttributes(v10, v11);
    v18 = objc_claimAutoreleasedReturnValue();
    nonAssetIdHash = v13->_nonAssetIdHash;
    v13->_nonAssetIdHash = (NSString *)v18;

    attributesInDownloadContent();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    getHashFromAttributesInSet(v10, v11, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    downloadContentHash = v13->_downloadContentHash;
    v13->_downloadContentHash = (NSString *)v21;

    attributesInDownloadUrl();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    getHashFromAttributesInSet(v10, v11, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    downloadUrlHash = v13->_downloadUrlHash;
    v13->_downloadUrlHash = (NSString *)v24;

    attributesInDownloadPolicy();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    getHashFromAttributesInSet(v10, v11, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    downloadPolicyHash = v13->_downloadPolicyHash;
    v13->_downloadPolicyHash = (NSString *)v27;

    attributesInPallasDynamicAssetId();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    getHashFromAttributesInSet(v10, v11, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    pallasAssetIdHash = v13->_pallasAssetIdHash;
    v13->_pallasAssetIdHash = (NSString *)v30;

  }
  return v13;
}

- (MAAbsoluteAssetId)initWithCoder:(id)a3
{
  id v4;
  MAAbsoluteAssetId *v5;
  uint64_t v6;
  NSString *assetId;
  uint64_t v8;
  NSString *assetType;
  uint64_t v10;
  NSString *allAttributesHash;
  uint64_t v12;
  NSString *assetIdHash;
  uint64_t v14;
  NSString *nonAssetIdHash;
  uint64_t v16;
  NSString *downloadContentHash;
  uint64_t v18;
  NSString *downloadUrlHash;
  uint64_t v20;
  NSString *downloadPolicyHash;
  uint64_t v22;
  NSString *pallasAssetIdHash;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MAAbsoluteAssetId;
  v5 = -[MAAbsoluteAssetId init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetId"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributesHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    allAttributesHash = v5->_allAttributesHash;
    v5->_allAttributesHash = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetIdHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetIdHash = v5->_assetIdHash;
    v5->_assetIdHash = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonIdHash"));
    v14 = objc_claimAutoreleasedReturnValue();
    nonAssetIdHash = v5->_nonAssetIdHash;
    v5->_nonAssetIdHash = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentHash"));
    v16 = objc_claimAutoreleasedReturnValue();
    downloadContentHash = v5->_downloadContentHash;
    v5->_downloadContentHash = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlHash"));
    v18 = objc_claimAutoreleasedReturnValue();
    downloadUrlHash = v5->_downloadUrlHash;
    v5->_downloadUrlHash = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("policyHash"));
    v20 = objc_claimAutoreleasedReturnValue();
    downloadPolicyHash = v5->_downloadPolicyHash;
    v5->_downloadPolicyHash = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pallasDynamicAssetIdHash"));
    v22 = objc_claimAutoreleasedReturnValue();
    pallasAssetIdHash = v5->_pallasAssetIdHash;
    v5->_pallasAssetIdHash = (NSString *)v22;

  }
  return v5;
}

- (MAAbsoluteAssetId)initWithPlist:(id)a3
{
  id v4;
  MAAbsoluteAssetId *v5;
  uint64_t v6;
  NSString *assetId;
  uint64_t v8;
  NSString *assetType;
  uint64_t v10;
  NSString *allAttributesHash;
  uint64_t v12;
  NSString *assetIdHash;
  uint64_t v14;
  NSString *nonAssetIdHash;
  uint64_t v16;
  NSString *downloadContentHash;
  uint64_t v18;
  NSString *downloadUrlHash;
  uint64_t v20;
  NSString *downloadPolicyHash;
  uint64_t v22;
  NSString *pallasAssetIdHash;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MAAbsoluteAssetId;
  v5 = -[MAAbsoluteAssetId init](&v25, sel_init);
  if (v5)
  {
    getPlistString(v4, CFSTR("assetId"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    getPlistString(v4, CFSTR("assetType"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    getPlistString(v4, CFSTR("attributesHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    allAttributesHash = v5->_allAttributesHash;
    v5->_allAttributesHash = (NSString *)v10;

    getPlistString(v4, CFSTR("assetIdHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetIdHash = v5->_assetIdHash;
    v5->_assetIdHash = (NSString *)v12;

    getPlistString(v4, CFSTR("nonIdHash"));
    v14 = objc_claimAutoreleasedReturnValue();
    nonAssetIdHash = v5->_nonAssetIdHash;
    v5->_nonAssetIdHash = (NSString *)v14;

    getPlistString(v4, CFSTR("contentHash"));
    v16 = objc_claimAutoreleasedReturnValue();
    downloadContentHash = v5->_downloadContentHash;
    v5->_downloadContentHash = (NSString *)v16;

    getPlistString(v4, CFSTR("urlHash"));
    v18 = objc_claimAutoreleasedReturnValue();
    downloadUrlHash = v5->_downloadUrlHash;
    v5->_downloadUrlHash = (NSString *)v18;

    getPlistString(v4, CFSTR("policyHash"));
    v20 = objc_claimAutoreleasedReturnValue();
    downloadPolicyHash = v5->_downloadPolicyHash;
    v5->_downloadPolicyHash = (NSString *)v20;

    getPlistString(v4, CFSTR("pallasDynamicAssetIdHash"));
    v22 = objc_claimAutoreleasedReturnValue();
    pallasAssetIdHash = v5->_pallasAssetIdHash;
    v5->_pallasAssetIdHash = (NSString *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MAAbsoluteAssetId assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("assetId"));

  -[MAAbsoluteAssetId assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("assetType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_allAttributesHash, CFSTR("attributesHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_assetIdHash, CFSTR("assetIdHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nonAssetIdHash, CFSTR("nonIdHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_downloadContentHash, CFSTR("contentHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_downloadUrlHash, CFSTR("urlHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_downloadPolicyHash, CFSTR("policyHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_pallasAssetIdHash, CFSTR("pallasDynamicAssetIdHash"));

}

- (id)encodeAsPlist
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[MAAbsoluteAssetId assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("assetId"));

  -[MAAbsoluteAssetId assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("assetType"));

  objc_msgSend(v3, "setValue:forKey:", self->_allAttributesHash, CFSTR("attributesHash"));
  objc_msgSend(v3, "setValue:forKey:", self->_assetIdHash, CFSTR("assetIdHash"));
  objc_msgSend(v3, "setValue:forKey:", self->_nonAssetIdHash, CFSTR("nonIdHash"));
  objc_msgSend(v3, "setValue:forKey:", self->_downloadContentHash, CFSTR("contentHash"));
  objc_msgSend(v3, "setValue:forKey:", self->_downloadUrlHash, CFSTR("urlHash"));
  objc_msgSend(v3, "setValue:forKey:", self->_downloadPolicyHash, CFSTR("policyHash"));
  objc_msgSend(v3, "setValue:forKey:", self->_pallasAssetIdHash, CFSTR("pallasDynamicAssetIdHash"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)diffFrom:(id)a3
{
  id v4;
  NSString *assetType;
  void *v6;
  NSString *assetId;
  void *v8;
  NSString *allAttributesHash;
  void *v10;
  uint64_t v11;
  NSString *assetIdHash;
  void *v13;
  uint64_t v14;
  NSString *nonAssetIdHash;
  void *v16;
  uint64_t v17;
  NSString *downloadContentHash;
  void *v19;
  char v20;
  NSString *downloadUrlHash;
  void *v22;
  NSString *downloadPolicyHash;
  void *v24;
  NSString *pallasAssetIdHash;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    assetType = self->_assetType;
    objc_msgSend(v4, "assetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[NSString isEqual:](assetType, "isEqual:", v6) ^ 1;

    assetId = self->_assetId;
    objc_msgSend(v4, "assetId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSString isEqual:](assetId, "isEqual:", v8) ^ 1;

    allAttributesHash = self->_allAttributesHash;
    objc_msgSend(v4, "allAttributesHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](allAttributesHash, "isEqual:", v10) ^ 1;

    assetIdHash = self->_assetIdHash;
    objc_msgSend(v4, "assetIdHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSString isEqual:](assetIdHash, "isEqual:", v13) ^ 1;

    nonAssetIdHash = self->_nonAssetIdHash;
    objc_msgSend(v4, "nonIdHash");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](nonAssetIdHash, "isEqual:", v16) ^ 1;

    downloadContentHash = self->_downloadContentHash;
    objc_msgSend(v4, "contentHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NSString isEqual:](downloadContentHash, "isEqual:", v19) ^ 1;

    downloadUrlHash = self->_downloadUrlHash;
    objc_msgSend(v4, "urlHash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(assetType) = -[NSString isEqual:](downloadUrlHash, "isEqual:", v22) ^ 1;

    downloadPolicyHash = self->_downloadPolicyHash;
    objc_msgSend(v4, "policyHash");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(assetId) = -[NSString isEqual:](downloadPolicyHash, "isEqual:", v24) ^ 1;

    pallasAssetIdHash = self->_pallasAssetIdHash;
    objc_msgSend(v4, "pallasDynamicAssetIdHash");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[NSString isEqual:](pallasAssetIdHash, "isEqual:", v26) ^ 1;

    BYTE2(v31) = (_BYTE)assetId;
    BYTE1(v31) = (_BYTE)assetType;
    LOBYTE(v31) = v20;
    v28 = -[MAAssetDiff initDifferentAssetType:assetId:attributes:assetIdAttributes:dynamicAssetId:nonIdAttributes:content:url:policy:]([MAAssetDiff alloc], "initDifferentAssetType:assetId:attributes:assetIdAttributes:dynamicAssetId:nonIdAttributes:content:url:policy:", v33, v32, v11, v14, v27, v17, v31);
  }
  else
  {
    +[MAAssetDiff allowEverythingDifferent](MAAssetDiff, "allowEverythingDifferent");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  return v29;
}

- (id)diffFromAsset:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "absoluteAssetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAbsoluteAssetId diffFrom:](self, "diffFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)diffFromAssetId:(id)a3 assetType:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  MAAbsoluteAssetId *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:]([MAAbsoluteAssetId alloc], "initWithAssetId:forAssetType:attributes:", v10, v9, v8);

  -[MAAbsoluteAssetId diffFrom:](self, "diffFrom:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  MAAbsoluteAssetId *v4;
  MAAbsoluteAssetId *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MAAbsoluteAssetId *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MAAbsoluteAssetId assetId](v5, "assetId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAbsoluteAssetId assetId](self, "assetId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[MAAbsoluteAssetId assetType](v5, "assetType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAAbsoluteAssetId assetType](self, "assetType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hasOnlyAssetTypeAndId
{
  return !self->_allAttributesHash
      && !self->_assetIdHash
      && !self->_nonAssetIdHash
      && !self->_downloadContentHash
      && !self->_downloadUrlHash
      && !self->_downloadPolicyHash
      && self->_pallasAssetIdHash == 0;
}

- (id)summary
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = -[MAAbsoluteAssetId hasOnlyAssetTypeAndId](self, "hasOnlyAssetTypeAndId");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MAAbsoluteAssetId assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAbsoluteAssetId assetId](self, "assetId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
    v8 = CFSTR("%@:%@");
  else
    v8 = CFSTR("%@:%@(+)");
  objc_msgSend(v4, "stringWithFormat:", v8, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAbsoluteAssetId assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAbsoluteAssetId assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@)"), CFSTR("assetId"), v4, CFSTR("assetType"), v5, CFSTR("attributesHash"), self->_allAttributesHash, CFSTR("assetIdHash"), self->_assetIdHash, CFSTR("nonIdHash"), self->_nonAssetIdHash, CFSTR("pallasDynamicAssetIdHash"), self->_pallasAssetIdHash, CFSTR("contentHash"), self->_downloadContentHash, CFSTR("urlHash"), self->_downloadUrlHash,
    CFSTR("policyHash"),
    self->_downloadPolicyHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (void)setAssetId:(id)a3
{
  objc_storeStrong((id *)&self->_assetId, a3);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_assetType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_pallasAssetIdHash, 0);
  objc_storeStrong((id *)&self->_downloadPolicyHash, 0);
  objc_storeStrong((id *)&self->_downloadUrlHash, 0);
  objc_storeStrong((id *)&self->_downloadContentHash, 0);
  objc_storeStrong((id *)&self->_nonAssetIdHash, 0);
  objc_storeStrong((id *)&self->_assetIdHash, 0);
  objc_storeStrong((id *)&self->_allAttributesHash, 0);
}

@end
