@implementation PKHashtagItem

+ (id)hashtagItemWithQueryItem:(id)a3 sessionManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int valid;
  PKHashtagItem *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "strokeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  valid = HasValidInkForDetectionItem(v7, v8);

  if (valid)
  {
    v10 = -[PKDetectionItem initWithSessionManager:]([PKHashtagItem alloc], "initWithSessionManager:", v6);
    -[PKDetectionItem setQueryItem:](v10, "setQueryItem:", v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
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

- (NSString)hashtagResult
{
  void *v2;
  void *v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hashtagResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)setActive:(BOOL)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionItem setUUID:](self, "setUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKDetectionItem setUUID:](self, "setUUID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)active
{
  void *v2;
  BOOL v3;

  -[PKDetectionItem UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)clearActiveInDrawing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PKDetectionItem queryItem](self, "queryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "strokesForCHStrokeIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStrokes:groupID:", v7, 0);

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
  PKHashtagItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PKHashtagItem *)a3;
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

- (id)_actionNameForActivation:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Activate Hashtag"), CFSTR("Activate Hashtag"), CFSTR("Localizable"));
  else
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Deactivate Hashtag"), CFSTR("Deactivate Hashtag"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidateUUID
{
  -[PKDetectionItem setValidCachedUUID:](self, "setValidCachedUUID:", 0);
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
  -[PKHashtagItem hashtagResult](self, "hashtagResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHashtagItem hashtagUUID](self, "hashtagUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDetectionItem queryItem](self, "queryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "strokeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p, \"%@\", %@, strokes:%lu"), v4, self, v5, v6, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
