@implementation _CNAutocompleteUserSessionDisplayedResults

- (_CNAutocompleteUserSessionDisplayedResults)initWithRequest:(id)a3
{
  id v5;
  _CNAutocompleteUserSessionDisplayedResults *v6;
  _CNAutocompleteUserSessionDisplayedResults *v7;
  uint64_t v8;
  NSMutableDictionary *datesByBatchIndexes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAutocompleteUserSessionDisplayedResults;
  v6 = -[_CNAutocompleteUserSessionDisplayedResults init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    datesByBatchIndexes = v7->_datesByBatchIndexes;
    v7->_datesByBatchIndexes = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)didReceiveBatch:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_CNAutocompleteUserSessionDisplayedResults datesByBatchIndexes](self, "datesByBatchIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[_CNAutocompleteUserSessionDisplayedResults datesByBatchIndexes](self, "datesByBatchIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (BOOL)relevantForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[_CNAutocompleteUserSessionDisplayedResults request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  objc_msgSend(v5, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 <= objc_msgSend(v8, "length"))
  {
    v11 = 0;
  }
  else
  {
    v9 = *MEMORY[0x1E0D13848];
    objc_msgSend(v5, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v4, "searchString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "hasPrefix:", v13);

    }
  }

  return v11;
}

- (CNAutocompleteFetchRequest)request
{
  return self->_request;
}

- (NSMutableDictionary)datesByBatchIndexes
{
  return self->_datesByBatchIndexes;
}

- (void)setDatesByBatchIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_datesByBatchIndexes, a3);
}

- (BOOL)ignored
{
  return self->_ignored;
}

- (void)setIgnored:(BOOL)a3
{
  self->_ignored = a3;
}

- (BOOL)containsDuetResults
{
  return self->_containsDuetResults;
}

- (void)setContainsDuetResults:(BOOL)a3
{
  self->_containsDuetResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datesByBatchIndexes, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
