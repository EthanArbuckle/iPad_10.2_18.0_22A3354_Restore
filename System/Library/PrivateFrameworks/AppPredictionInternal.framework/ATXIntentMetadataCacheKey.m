@implementation ATXIntentMetadataCacheKey

- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameters:(BOOL)a4
{
  return -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:includingParameterValues:localeIdentifier:](self, "initWithIntent:includingParameters:includingParameterValues:localeIdentifier:", a3, a4, 0, 0);
}

- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameterValues:(BOOL)a4 localeIdentifier:(id)a5
{
  return -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:includingParameterValues:localeIdentifier:](self, "initWithIntent:includingParameters:includingParameterValues:localeIdentifier:", a3, a4, a4, a5);
}

- (ATXIntentMetadataCacheKey)initWithIntent:(id)a3 includingParameters:(BOOL)a4 includingParameterValues:(BOOL)a5 localeIdentifier:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  ATXIntentMetadataCacheKey *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSSet *nonNilParameters;
  unint64_t v20;
  uint64_t v21;
  ATXIntentMetadataCacheKey *v22;
  objc_super v24;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXIntentMetadataCacheKey;
  v12 = -[ATXIntentMetadataCacheKey init](&v24, sel_init);
  if (v12)
  {
    objc_msgSend(v10, "extensionBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v10, "launchId");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(v10, "_className");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length") || !objc_msgSend(v17, "length"))
    {

      v22 = 0;
      goto LABEL_17;
    }
    objc_storeStrong((id *)&v12->_bundleId, v16);
    objc_storeStrong((id *)&v12->_intentClassName, v17);
    if (v8)
    {
      objc_msgSend(v10, "atx_nonNilParameters");
      v18 = objc_claimAutoreleasedReturnValue();
      nonNilParameters = v12->_nonNilParameters;
      v12->_nonNilParameters = (NSSet *)v18;

    }
    if (v7)
    {
      v20 = objc_msgSend(v10, "atx_backingStoreDataHash");
      if (v20 <= 1)
        v21 = 1;
      else
        v21 = v20;
      v12->_intentHash = v21;
    }
    objc_storeStrong((id *)&v12->_localeIdentifier, a6);

  }
  v22 = v12;
LABEL_17:

  return v22;
}

- (id)stringRepresentationForSerialization
{
  id v3;
  NSString *intentClassName;
  void *v5;
  void *v6;
  void *v7;
  NSSet *nonNilParameters;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *localeIdentifier;
  void *v19;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  intentClassName = self->_intentClassName;
  v22[0] = self->_bundleId;
  v22[1] = intentClassName;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  nonNilParameters = self->_nonNilParameters;
  v21 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet sortedArrayUsingDescriptors:](nonNilParameters, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsJoinedByString:", &stru_1E82FDC98);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E82FDC98;
  v14 = v13;

  objc_msgSend(v6, "addObject:", v14);
  if (self->_intentHash)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_intentHash);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%lld"), objc_msgSend(v16, "longLongValue"));

    objc_msgSend(v6, "addObject:", v17);
    if (self->_localeIdentifier)
      localeIdentifier = (const __CFString *)self->_localeIdentifier;
    else
      localeIdentifier = &stru_1E82FDC98;
    objc_msgSend(v6, "addObject:", localeIdentifier);

  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("-"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (NSSet)nonNilParameters
{
  return self->_nonNilParameters;
}

- (unint64_t)intentHash
{
  return self->_intentHash;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonNilParameters, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
