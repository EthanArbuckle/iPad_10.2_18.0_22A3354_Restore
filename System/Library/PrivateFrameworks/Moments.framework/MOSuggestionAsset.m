@implementation MOSuggestionAsset

- (id)init:(id)a3 type:(id)a4 contentClassType:(Class)a5
{
  id v9;
  id v10;
  MOSuggestionAsset *v11;
  MOSuggestionAsset *v12;
  NSString *identifier;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MOSuggestionAsset;
  v11 = -[MOSuggestionAsset init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_content, a3);
    objc_storeStrong((id *)&v12->_assetType, a4);
    objc_storeStrong((id *)&v12->_contentClassType, a5);
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)&stru_1E854A388;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id content;
  id v5;

  content = self->_content;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", content, CFSTR("coderKeyMOSuggestionAssetContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetType, CFSTR("coderKeyMOSuggestionAssetType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("coderKeyMOSuggestionAssetMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("coderKeyMOSuggestionAssetIdentifier"));

}

- (MOSuggestionAsset)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAsset *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id content;
  uint64_t v17;
  NSString *assetType;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *metadata;
  uint64_t v31;
  NSString *identifier;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MOSuggestionAsset;
  v5 = -[MOSuggestionAsset init](&v45, sel_init);
  if (v5)
  {
    v42 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    v38 = objc_opt_class();
    v36 = objc_opt_class();
    v35 = objc_opt_class();
    v34 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v44 = v4;
    v13 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v40, v38, v36, v35, v34, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("coderKeyMOSuggestionAssetContent"));
    v15 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (id)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetType"));
    v17 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v17;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    v39 = objc_opt_class();
    v37 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v41, v39, v37, v19, v20, v21, v22, v23, v24, v25, v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "decodeObjectOfClasses:forKey:", v28, CFSTR("coderKeyMOSuggestionAssetMetadata"));
    v29 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v29;

    v4 = v44;
    objc_msgSend(v44, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v31;

  }
  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSDictionary allKeys](self->_metadata, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("%@: %p \n"), v8, 0);
        }
        else
        {
          -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@: %p \n"), v8, v10);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ content: %p, contentType: %@, identifier: %@, metadata: \n%@"), self, self->_content, self->_assetType, self->_identifier, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)addMetadata:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[MOSuggestionAsset setMetadata:](self, "setMetadata:", v4);

}

- (void)addIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[MOSuggestionAsset setIdentifier:](self, "setIdentifier:", v4);

}

- (id)content
{
  return self->_content;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (Class)contentClassType
{
  return self->_contentClassType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentClassType, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_content, 0);
}

@end
