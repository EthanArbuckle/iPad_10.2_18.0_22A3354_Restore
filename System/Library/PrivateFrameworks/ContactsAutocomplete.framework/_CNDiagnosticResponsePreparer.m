@implementation _CNDiagnosticResponsePreparer

- (_CNDiagnosticResponsePreparer)initWithResponsePreparer:(id)a3 delegate:(id)a4 log:(id)a5
{
  id v8;
  _CNDiagnosticResponsePreparer *v9;
  uint64_t v10;
  CNFuture *logFuture;
  _CNDiagnosticResponsePreparer *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CNDiagnosticResponsePreparer;
  v9 = -[_CNAutocompleteResponsePreparerDecorator initWithResponsePreparer:delegate:](&v14, sel_initWithResponsePreparer_delegate_, a3, a4);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "lazyFutureWithBlock:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    logFuture = v9->_logFuture;
    v9->_logFuture = (CNFuture *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        -[_CNDiagnosticResponsePreparer logFuture](self, "logFuture");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDiagnosticLogFuture:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prepareResults:forFetch:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CNFuture)logFuture
{
  return (CNFuture *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFuture, 0);
}

@end
