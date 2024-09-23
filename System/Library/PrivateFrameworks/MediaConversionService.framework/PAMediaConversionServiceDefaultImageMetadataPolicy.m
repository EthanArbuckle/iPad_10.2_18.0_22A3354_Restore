@implementation PAMediaConversionServiceDefaultImageMetadataPolicy

- (PAMediaConversionServiceDefaultImageMetadataPolicy)init
{
  double v2;

  LODWORD(v2) = 1062836634;
  return -[PAMediaConversionServiceDefaultImageMetadataPolicy initWithLossyCompressionQuality:](self, "initWithLossyCompressionQuality:", v2);
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3
{
  PAMediaConversionServiceDefaultImageMetadataPolicy *v4;
  double v5;
  PAMediaConversionServiceDefaultImageMetadataPolicy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAMediaConversionServiceDefaultImageMetadataPolicy;
  v4 = -[PAMediaConversionServiceDefaultImageMetadataPolicy init](&v8, sel_init);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = a3;
    -[PAMediaConversionServiceDefaultImageMetadataPolicy setLossyCompressionQuality:](v4, "setLossyCompressionQuality:", v5);
  }
  return v6;
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4;
  PAMediaConversionServiceDefaultImageMetadataPolicy *v5;
  PAMediaConversionServiceDefaultImageMetadataPolicy *v6;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lossyCompressionQuality")))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("lossyCompressionQuality"));
    v5 = -[PAMediaConversionServiceDefaultImageMetadataPolicy initWithLossyCompressionQuality:](self, "initWithLossyCompressionQuality:");
  }
  else
  {
    v5 = -[PAMediaConversionServiceDefaultImageMetadataPolicy init](self, "init");
  }
  v6 = v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[PAMediaConversionServiceDefaultImageMetadataPolicy lossyCompressionQuality](self, "lossyCompressionQuality");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("lossyCompressionQuality"));

}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

- (id)processMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PAMediaConversionServiceDefaultImageMetadataPolicy lossyCompressionQuality](self, "lossyCompressionQuality");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CBC780], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CBCB50], *MEMORY[0x1E0CBCA28], *MEMORY[0x1E0CBCD68], *MEMORY[0x1E0CBCF78], *MEMORY[0x1E0CBCF78], *MEMORY[0x1E0CBCF98], *MEMORY[0x1E0CBCF90], *MEMORY[0x1E0CBCF88], *MEMORY[0x1E0CBCFD0], *MEMORY[0x1E0CBCFD8], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "setObject:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v11);
  }
  v16 = *MEMORY[0x1E0CBCED8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CBCED8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    v19 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v19, "removeObjectForKey:", *MEMORY[0x1E0CBCF08]);
    objc_msgSend(v8, "setObject:forKey:", v19, v16);

  }
  v20 = *MEMORY[0x1E0CBD090];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CBD090]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = v21;
    v23 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v23, "removeObjectForKey:", *MEMORY[0x1E0CBD0C0]);
    objc_msgSend(v8, "setObject:forKey:", v23, v20);
  }
  else
  {
    v23 = 0;
  }
  v24 = *MEMORY[0x1E0CBCF70];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CBCF70]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);

    v27 = *MEMORY[0x1E0C89CA0];
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CA0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v27);

    v29 = *MEMORY[0x1E0C89CA8];
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CA8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v29);

    objc_msgSend(v8, "setObject:forKey:", v26, v24);
    v23 = v26;
  }

  return v8;
}

- (float)lossyCompressionQuality
{
  return self->_lossyCompressionQuality;
}

- (void)setLossyCompressionQuality:(float)a3
{
  self->_lossyCompressionQuality = a3;
}

+ (id)standardPolicy
{
  void *v4;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  if ((objc_msgSend(v4, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImageMetadataPolicy.m"), 82, CFSTR("Subclasses must override %@"), v7);

  }
  if (standardPolicy_onceToken_39 != -1)
    dispatch_once(&standardPolicy_onceToken_39, &__block_literal_global_40);
  return (id)standardPolicy_standardPolicy_38;
}

+ (id)policyWithLossyCompressionQuality:(float)a3
{
  id v4;
  double v5;

  v4 = objc_alloc((Class)a1);
  *(float *)&v5 = a3;
  return (id)objc_msgSend(v4, "initWithLossyCompressionQuality:", v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __68__PAMediaConversionServiceDefaultImageMetadataPolicy_standardPolicy__block_invoke()
{
  PAMediaConversionServiceDefaultImageMetadataPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(PAMediaConversionServiceDefaultImageMetadataPolicy);
  v1 = (void *)standardPolicy_standardPolicy_38;
  standardPolicy_standardPolicy_38 = (uint64_t)v0;

}

@end
