@implementation FindOnPageCompletionProvider

- (id)completionsForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  FindOnPageCompletionItem *v8;
  void *v9;
  FindOnPageCompletionItem *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FindOnPageCompletionProvider;
  -[CompletionProvider completionsForQuery:](&v12, sel_completionsForQuery_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = [FindOnPageCompletionItem alloc];
    objc_msgSend(v4, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FindOnPageCompletionItem initWithString:numberOfMatches:forQueryID:](v8, "initWithString:numberOfMatches:forQueryID:", v9, 0x7FFFFFFFFFFFFFFFLL, self->_parsecQueryID);

    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setQueryToComplete:(id)a3
{
  FindOnPageCompletionProviderDataSource **p_dataSource;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "tabDocumentForFindOnPageCompletionProvider:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  self->_parsecQueryID = objc_msgSend(v5, "queryID");
  objc_msgSend(v5, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "findOnPageCompletionProvider:setStringToComplete:", self, v7);
}

- (FindOnPageCompletionProviderDataSource)dataSource
{
  return (FindOnPageCompletionProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
