@implementation PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy

- (BOOL)metadataNeedsProcessing:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCED8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)processMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy;
  -[PAMediaConversionServiceDefaultImageMetadataPolicy processMetadata:](&v12, sel_processMetadata_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy metadataNeedsProcessing:](self, "metadataNeedsProcessing:", v4))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0CBCED8]);
    v6 = (void *)objc_opt_class();
    v7 = *MEMORY[0x1E0CBD090];
    v8 = *MEMORY[0x1E0CBD0B8];
    v13[0] = *MEMORY[0x1E0CBD0B0];
    v13[1] = v8;
    v9 = *MEMORY[0x1E0CBD088];
    v13[2] = *MEMORY[0x1E0CBD080];
    v13[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_filterImageProperties:metadataWithKey:preserveProperties:", v5, v7, v10);

    v4 = v5;
  }
  return v4;
}

+ (id)policyWithAllowLocation:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v3)
  {
    v6 = v4;
  }
  else
  {
    v10[0] = v4;
    +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:](PAMediaConversionServiceSetLocationImageMetadataPolicy, "policyWithLocation:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:](PAMediaConversionServiceCompositeImageMetadataPolicy, "policyWithPolicies:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_filterImageProperties:(id)a3 metadataWithKey:(id)a4 preserveProperties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v19 = v9;
      v20 = v7;
      v14 = 0;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", v17, v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (!v14)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v14, "setObject:forKey:", v18, v17);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);

      v9 = v19;
      v7 = v20;
      if (v14)
      {
        objc_msgSend(v20, "setObject:forKey:", v14, v8);

        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "removeObjectForKey:", v8);
  }
LABEL_17:

}

@end
