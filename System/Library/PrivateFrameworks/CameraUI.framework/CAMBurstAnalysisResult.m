@implementation CAMBurstAnalysisResult

- (CAMBurstAnalysisResult)init
{
  return -[CAMBurstAnalysisResult initWithIdentifier:allAssetIdentifiers:goodAssetIdentifiers:bestAssetIdentifier:](self, "initWithIdentifier:allAssetIdentifiers:goodAssetIdentifiers:bestAssetIdentifier:", 0, 0, 0, 0);
}

- (CAMBurstAnalysisResult)initWithIdentifier:(id)a3 allAssetIdentifiers:(id)a4 goodAssetIdentifiers:(id)a5 bestAssetIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CAMBurstAnalysisResult *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSArray *allAssetIdentifiers;
  uint64_t v19;
  NSArray *goodAssetIdentifiers;
  uint64_t v21;
  NSString *bestAssetIdentifier;
  CAMBurstAnalysisResult *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CAMBurstAnalysisResult;
  v14 = -[CAMBurstAnalysisResult init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    allAssetIdentifiers = v14->_allAssetIdentifiers;
    v14->_allAssetIdentifiers = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    goodAssetIdentifiers = v14->_goodAssetIdentifiers;
    v14->_goodAssetIdentifiers = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    bestAssetIdentifier = v14->_bestAssetIdentifier;
    v14->_bestAssetIdentifier = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMBurstAnalysisResult identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBurstAnalysisResult allAssetIdentifiers](self, "allAssetIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBurstAnalysisResult goodAssetIdentifiers](self, "goodAssetIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBurstAnalysisResult bestAssetIdentifier](self, "bestAssetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ identifier:%@, allAssetIidentifiers:%@, goodAssetIdentifiers:%@, bestAssetIdentifiers:%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)allAssetIdentifiers
{
  return self->_allAssetIdentifiers;
}

- (NSArray)goodAssetIdentifiers
{
  return self->_goodAssetIdentifiers;
}

- (NSString)bestAssetIdentifier
{
  return self->_bestAssetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_goodAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_allAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
