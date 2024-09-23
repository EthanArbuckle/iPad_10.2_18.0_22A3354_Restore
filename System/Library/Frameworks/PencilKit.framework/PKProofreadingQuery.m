@implementation PKProofreadingQuery

- (PKProofreadingQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4;
  PKProofreadingQuery *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKProofreadingQuery;
  v5 = -[PKQuery initWithRecognitionSessionManager:](&v11, sel_initWithRecognitionSessionManager_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D16870]);
    -[PKRecognitionSessionManager session](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithRecognitionSession:", v7);
    -[PKDetectionQuery setQuery:](v5, "setQuery:", v8);

    -[PKDetectionQuery query](v5, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v5);

  }
  return v5;
}

- (void)queryDidUpdateResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKProofreadingQueryItem *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "foundItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "foundItems", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
            objc_enumerationMutation(v9);
          v14 = -[PKProofreadingQueryItem initWithCoreHandwritingTextCheckingQueryItem:]([PKProofreadingQueryItem alloc], "initWithCoreHandwritingTextCheckingQueryItem:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    -[PKQuery delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[PKQuery delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v17, "proofreadingQuery:foundItems:", self, v18);

    }
  }

}

@end
