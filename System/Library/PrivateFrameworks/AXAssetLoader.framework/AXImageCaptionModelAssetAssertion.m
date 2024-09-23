@implementation AXImageCaptionModelAssetAssertion

+ (void)partitionAssertionsWithPropertyListRepresentations:(id)a3 intoVersionLockedAssertions:(id)a4 upgradableAssertions:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        +[AXImageCaptionModelAssetAssertion assertionWithPropertyListRepresentation:error:](AXImageCaptionModelAssetAssertion, "assertionWithPropertyListRepresentation:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "assertionType");
          v17 = v8;
          if (!v16 || (v18 = objc_msgSend(v15, "assertionType"), v17 = v9, v18 == 1))
            objc_msgSend(v17, "addObject:", v15);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

+ (id)assertionsWithPropertyListRepresentations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[AXImageCaptionModelAssetAssertion assertionWithPropertyListRepresentation:error:](AXImageCaptionModelAssetAssertion, "assertionWithPropertyListRepresentation:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 0, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)assetType
{
  return (NSString *)CFSTR("com.apple.MobileAsset.ImageCaptionModel");
}

+ (id)assertionWithPropertyListRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  AXImageCaptionModelAssetAssertion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(AXImageCaptionModelAssetAssertion);
  objc_msgSend(v4, "objectForKey:", CFSTR("clientIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setClientIdentifier:](v5, "setClientIdentifier:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("minimumCompatibilityVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setMinimumCompatibilityVersion:](v5, "setMinimumCompatibilityVersion:", v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("maximumCompatibilityVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setMaximumCompatibilityVersion:](v5, "setMaximumCompatibilityVersion:", v8);

  objc_msgSend(v4, "objectForKey:", CFSTR("modelStage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setModelStage:](v5, "setModelStage:", v9);

  objc_msgSend(v4, "objectForKey:", CFSTR("modelVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setModelVersion:](v5, "setModelVersion:", v10);

  objc_msgSend(v4, "objectForKey:", CFSTR("modelLanguage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setModelLanguage:](v5, "setModelLanguage:", v11);

  objc_msgSend(v4, "objectForKey:", CFSTR("assertionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXImageCaptionModelAssetAssertion setAssertionType:](v5, "setAssertionType:", objc_msgSend(v12, "unsignedIntegerValue"));
  return v5;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  NSString *clientIdentifier;
  NSNumber *minimumCompatibilityVersion;
  NSNumber *maximumCompatibilityVersion;
  NSString *modelStage;
  NSString *modelVersion;
  NSString *modelLanguage;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", clientIdentifier, CFSTR("clientIdentifier"));
  minimumCompatibilityVersion = self->_minimumCompatibilityVersion;
  if (minimumCompatibilityVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", minimumCompatibilityVersion, CFSTR("minimumCompatibilityVersion"));
  maximumCompatibilityVersion = self->_maximumCompatibilityVersion;
  if (maximumCompatibilityVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", maximumCompatibilityVersion, CFSTR("maximumCompatibilityVersion"));
  modelStage = self->_modelStage;
  if (modelStage)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", modelStage, CFSTR("modelStage"));
  modelVersion = self->_modelVersion;
  if (modelVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", modelVersion, CFSTR("modelVersion"));
  modelLanguage = self->_modelLanguage;
  if (modelLanguage)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", modelLanguage, CFSTR("modelLanguage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_assertionType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("assertionType"));

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AXImageCaptionModelAssetAssertion;
  -[AXImageCaptionModelAssetAssertion description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Owner:%@ Type:%lu CompatVers:[%@ - %@] Model:[%@ %@ %@]"), v4, self->_clientIdentifier, self->_assertionType, self->_minimumCompatibilityVersion, self->_maximumCompatibilityVersion, self->_modelVersion, self->_modelStage, self->_modelLanguage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)assertionType
{
  return self->_assertionType;
}

- (void)setAssertionType:(unint64_t)a3
{
  self->_assertionType = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSNumber)minimumCompatibilityVersion
{
  return self->_minimumCompatibilityVersion;
}

- (void)setMinimumCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minimumCompatibilityVersion, a3);
}

- (NSNumber)maximumCompatibilityVersion
{
  return self->_maximumCompatibilityVersion;
}

- (void)setMaximumCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_maximumCompatibilityVersion, a3);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (NSString)modelLanguage
{
  return self->_modelLanguage;
}

- (void)setModelLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_modelLanguage, a3);
}

- (NSString)modelStage
{
  return self->_modelStage;
}

- (void)setModelStage:(id)a3
{
  objc_storeStrong((id *)&self->_modelStage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStage, 0);
  objc_storeStrong((id *)&self->_modelLanguage, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_maximumCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_minimumCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
