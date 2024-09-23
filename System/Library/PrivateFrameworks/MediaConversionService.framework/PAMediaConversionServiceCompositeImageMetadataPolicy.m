@implementation PAMediaConversionServiceCompositeImageMetadataPolicy

- (PAMediaConversionServiceCompositeImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("policyList")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("policyList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceCompositeImageMetadataPolicy setPolicies:](self, "setPolicies:", v5);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PAMediaConversionServiceCompositeImageMetadataPolicy policies](self, "policies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("policyList"));

}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PAMediaConversionServiceCompositeImageMetadataPolicy policies](self, "policies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "metadataNeedsProcessing:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)processMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PAMediaConversionServiceCompositeImageMetadataPolicy policies](self, "policies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "metadataNeedsProcessing:", v4))
        {
          objc_msgSend(v10, "processMetadata:", v4);
          v11 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolicies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

+ (id)policyWithPolicies:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImageMetadataPolicy.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("policies"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setPolicies:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
