@implementation PKProofreadingItem

+ (id)proofreadingItemWithQueryItem:(id)a3 sessionManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int valid;
  PKProofreadingItem *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "strokeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  valid = HasValidInkForDetectionItem(v7, v8);

  if (valid)
  {
    v10 = -[PKDetectionItem initWithSessionManager:]([PKProofreadingItem alloc], "initWithSessionManager:", v6);
    -[PKDetectionItem setQueryItem:](v10, "setQueryItem:", v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)drawing
{
  void *v2;
  void *v3;

  -[PKDetectionItem sessionManager](self, "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_baselinePath
{
  void *v2;
  void *v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baselinePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)strokeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
}

- (NSArray)chStrokeIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)replacementStrings
{
  void *v2;
  void *v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replacementStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int)resultType
{
  void *v2;
  int v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resultType");

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKProofreadingItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PKProofreadingItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKDetectionItem queryItem](self, "queryItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDetectionItem queryItem](v4, "queryItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)invalidateUUID
{
  -[PKDetectionItem setValidCachedUUID:](self, "setValidCachedUUID:", 0);
}

@end
