@implementation _IncrementalSearchOperation

- (_IncrementalSearchOperation)initWithSearchString:(id)a3 searchBody:(id)a4 resultsBlock:(id)a5 finishedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _IncrementalSearchOperation *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSRegularExpression *regularExpression;
  void *v19;
  id searchResultsBlock;
  void *v21;
  id searchFinishedBlock;
  id v24;
  unsigned __int8 v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_IncrementalSearchOperation;
  v14 = -[_IncrementalSearchOperation init](&v26, sel_init);
  if (v14)
  {
    v25 = 0;
    +[HKIncrementalSearchBar regularExpressionFromString:quoteForJavascript:caseless:](HKIncrementalSearchBar, "regularExpressionFromString:quoteForJavascript:caseless:", v10, 0, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v15, v25, &v24);
    v17 = v24;
    regularExpression = v14->_regularExpression;
    v14->_regularExpression = (NSRegularExpression *)v16;

    objc_storeStrong((id *)&v14->_searchBody, a4);
    v19 = _Block_copy(v12);
    searchResultsBlock = v14->_searchResultsBlock;
    v14->_searchResultsBlock = v19;

    v21 = _Block_copy(v13);
    searchFinishedBlock = v14->_searchFinishedBlock;
    v14->_searchFinishedBlock = v21;

  }
  return v14;
}

- (void)main
{
  NSRegularExpression *regularExpression;
  NSString *searchBody;
  uint64_t v5;
  _QWORD *searchResultsBlock;
  id v7;
  void (*v8)(_QWORD *, id, _BYTE *);
  void (**searchFinishedBlock)(id, id);
  id v10;
  _BYTE __dst[1032];
  _QWORD v12[7];
  id v13;
  id location;
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v16 = 0;
  v17 = &v16;
  v18 = 0x42810000000;
  v19 = &unk_1D7BC951A;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  if ((-[_IncrementalSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v17[4] = 0;
    objc_initWeak(&location, self);
    regularExpression = self->_regularExpression;
    searchBody = self->_searchBody;
    v5 = -[NSString length](searchBody, "length");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35___IncrementalSearchOperation_main__block_invoke;
    v12[3] = &unk_1E9C458F0;
    v12[4] = self;
    v12[5] = &v16;
    objc_copyWeak(&v13, &location);
    v12[6] = v15;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](regularExpression, "enumerateMatchesInString:options:range:usingBlock:", searchBody, 0, 0, v5, v12);
    if ((-[_IncrementalSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      if (v17[4])
      {
        searchResultsBlock = self->_searchResultsBlock;
        v7 = objc_loadWeakRetained(&location);
        v8 = (void (*)(_QWORD *, id, _BYTE *))searchResultsBlock[2];
        memcpy(__dst, v17 + 4, sizeof(__dst));
        v8(searchResultsBlock, v7, __dst);

      }
      searchFinishedBlock = (void (**)(id, id))self->_searchFinishedBlock;
      v10 = objc_loadWeakRetained(&location);
      searchFinishedBlock[2](searchFinishedBlock, v10);

    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);
}

- (NSRegularExpression)regularExpression
{
  return (NSRegularExpression *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)searchBody
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (id)searchResultsBlock
{
  return objc_getProperty(self, a2, 264, 1);
}

- (id)searchFinishedBlock
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_searchFinishedBlock, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchBody, 0);
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

@end
