@implementation MADEmbeddingSearchOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingSearchOptions)init
{
  MADEmbeddingSearchOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADEmbeddingSearchOptions;
  result = -[MADEmbeddingSearchOptions init](&v3, sel_init);
  if (result)
  {
    result->_resultLimit = 10;
    *(_WORD *)&result->_fullScan = 0;
  }
  return result;
}

+ (id)defaultOptions
{
  return objc_alloc_init((Class)a1);
}

- (MADEmbeddingSearchOptions)initWithCoder:(id)a3
{
  id v4;
  MADEmbeddingSearchOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *assetUUIDs;
  uint64_t v11;
  NSNumber *numberOfProbes;
  uint64_t v13;
  NSNumber *batchSize;
  uint64_t v15;
  NSNumber *numConcurrentReaders;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MADEmbeddingSearchOptions;
  v5 = -[MADEmbeddingSearchOptions init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AssetUUIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = (NSArray *)v9;

    v5->_resultLimit = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ResultLimit"));
    v5->_fullScan = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FullScan"));
    v5->_includePayload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludePayload"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NumberOfProbes"));
    v11 = objc_claimAutoreleasedReturnValue();
    numberOfProbes = v5->_numberOfProbes;
    v5->_numberOfProbes = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BatchSize"));
    v13 = objc_claimAutoreleasedReturnValue();
    batchSize = v5->_batchSize;
    v5->_batchSize = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NumConcurrentReaders"));
    v15 = objc_claimAutoreleasedReturnValue();
    numConcurrentReaders = v5->_numConcurrentReaders;
    v5->_numConcurrentReaders = (NSNumber *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *assetUUIDs;
  id v5;

  assetUUIDs = self->_assetUUIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetUUIDs, CFSTR("AssetUUIDs"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_resultLimit, CFSTR("ResultLimit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fullScan, CFSTR("FullScan"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includePayload, CFSTR("IncludePayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfProbes, CFSTR("NumberOfProbes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_batchSize, CFSTR("BatchSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numConcurrentReaders, CFSTR("NumConcurrentReaders"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("AssetUUIDs"), self->_assetUUIDs);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %d, "), CFSTR("ResultLimit"), self->_resultLimit);
  if (self->_fullScan)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("FullScan"), v6);
  if (self->_includePayload)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("IncludePayload"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("NumberOfProbes"), self->_numberOfProbes);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("BatchSize"), self->_batchSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@>"), CFSTR("NumConcurrentReaders"), self->_numConcurrentReaders);
  return v3;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDs, a3);
}

- (int)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(int)a3
{
  self->_resultLimit = a3;
}

- (BOOL)fullScan
{
  return self->_fullScan;
}

- (void)setFullScan:(BOOL)a3
{
  self->_fullScan = a3;
}

- (BOOL)includePayload
{
  return self->_includePayload;
}

- (void)setIncludePayload:(BOOL)a3
{
  self->_includePayload = a3;
}

- (NSNumber)numberOfProbes
{
  return self->_numberOfProbes;
}

- (void)setNumberOfProbes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfProbes, a3);
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
  objc_storeStrong((id *)&self->_batchSize, a3);
}

- (NSNumber)numConcurrentReaders
{
  return self->_numConcurrentReaders;
}

- (void)setNumConcurrentReaders:(id)a3
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_numberOfProbes, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end
