@implementation _CNAutocompleteCachingSearchProvider

- (_CNAutocompleteCachingSearchProvider)initWithSearchProvider:(id)a3
{
  id v4;
  _CNAutocompleteCachingSearchProvider *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  CNFuture *localSearchFuture;
  void *v11;
  id v12;
  uint64_t v13;
  CNFuture *recentsSearchFuture;
  void *v15;
  id v16;
  uint64_t v17;
  CNFuture *stewieSearchFuture;
  void *v19;
  id v20;
  uint64_t v21;
  CNFuture *suggestionsSearchFuture;
  void *v23;
  id v24;
  uint64_t v25;
  CNFuture *predictionSearchFuture;
  void *v27;
  id v28;
  uint64_t v29;
  CNFuture *localExtensionSearchesFuture;
  void *v31;
  id v32;
  uint64_t v33;
  CNFuture *directoryServerSearchFuture;
  void *v35;
  uint64_t v36;
  CNFuture *calendarServerSearchFuture;
  _CNAutocompleteCachingSearchProvider *v38;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)_CNAutocompleteCachingSearchProvider;
  v5 = -[_CNAutocompleteCachingSearchProvider init](&v56, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D13A68];
    v7 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke;
    v54[3] = &unk_1E70DF6F0;
    v8 = v4;
    v55 = v8;
    objc_msgSend(v6, "lazyFutureWithBlock:", v54);
    v9 = objc_claimAutoreleasedReturnValue();
    localSearchFuture = v5->_localSearchFuture;
    v5->_localSearchFuture = (CNFuture *)v9;

    v11 = (void *)MEMORY[0x1E0D13A68];
    v52[0] = v7;
    v52[1] = 3221225472;
    v52[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_2;
    v52[3] = &unk_1E70DF6F0;
    v12 = v8;
    v53 = v12;
    objc_msgSend(v11, "lazyFutureWithBlock:", v52);
    v13 = objc_claimAutoreleasedReturnValue();
    recentsSearchFuture = v5->_recentsSearchFuture;
    v5->_recentsSearchFuture = (CNFuture *)v13;

    v15 = (void *)MEMORY[0x1E0D13A68];
    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_3;
    v50[3] = &unk_1E70DF6F0;
    v16 = v12;
    v51 = v16;
    objc_msgSend(v15, "lazyFutureWithBlock:", v50);
    v17 = objc_claimAutoreleasedReturnValue();
    stewieSearchFuture = v5->_stewieSearchFuture;
    v5->_stewieSearchFuture = (CNFuture *)v17;

    v19 = (void *)MEMORY[0x1E0D13A68];
    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_4;
    v48[3] = &unk_1E70DF6F0;
    v20 = v16;
    v49 = v20;
    objc_msgSend(v19, "lazyFutureWithBlock:", v48);
    v21 = objc_claimAutoreleasedReturnValue();
    suggestionsSearchFuture = v5->_suggestionsSearchFuture;
    v5->_suggestionsSearchFuture = (CNFuture *)v21;

    v23 = (void *)MEMORY[0x1E0D13A68];
    v46[0] = v7;
    v46[1] = 3221225472;
    v46[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_5;
    v46[3] = &unk_1E70DF6F0;
    v24 = v20;
    v47 = v24;
    objc_msgSend(v23, "lazyFutureWithBlock:", v46);
    v25 = objc_claimAutoreleasedReturnValue();
    predictionSearchFuture = v5->_predictionSearchFuture;
    v5->_predictionSearchFuture = (CNFuture *)v25;

    v27 = (void *)MEMORY[0x1E0D13A68];
    v44[0] = v7;
    v44[1] = 3221225472;
    v44[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_6;
    v44[3] = &unk_1E70DF718;
    v28 = v24;
    v45 = v28;
    objc_msgSend(v27, "lazyFutureWithBlock:", v44);
    v29 = objc_claimAutoreleasedReturnValue();
    localExtensionSearchesFuture = v5->_localExtensionSearchesFuture;
    v5->_localExtensionSearchesFuture = (CNFuture *)v29;

    v31 = (void *)MEMORY[0x1E0D13A68];
    v42[0] = v7;
    v42[1] = 3221225472;
    v42[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_7;
    v42[3] = &unk_1E70DF6F0;
    v32 = v28;
    v43 = v32;
    objc_msgSend(v31, "lazyFutureWithBlock:", v42);
    v33 = objc_claimAutoreleasedReturnValue();
    directoryServerSearchFuture = v5->_directoryServerSearchFuture;
    v5->_directoryServerSearchFuture = (CNFuture *)v33;

    v35 = (void *)MEMORY[0x1E0D13A68];
    v40[0] = v7;
    v40[1] = 3221225472;
    v40[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_8;
    v40[3] = &unk_1E70DF6F0;
    v41 = v32;
    objc_msgSend(v35, "lazyFutureWithBlock:", v40);
    v36 = objc_claimAutoreleasedReturnValue();
    calendarServerSearchFuture = v5->_calendarServerSearchFuture;
    v5->_calendarServerSearchFuture = (CNFuture *)v36;

    v38 = v5;
  }

  return v5;
}

- (id)localSearch
{
  return (id)-[CNFuture result:](self->_localSearchFuture, "result:", 0);
}

- (id)recentsSearch
{
  return (id)-[CNFuture result:](self->_recentsSearchFuture, "result:", 0);
}

- (id)stewieSearch
{
  return (id)-[CNFuture result:](self->_stewieSearchFuture, "result:", 0);
}

- (id)suggestionsSearch
{
  return (id)-[CNFuture result:](self->_suggestionsSearchFuture, "result:", 0);
}

- (id)predictionSearch
{
  return (id)-[CNFuture result:](self->_predictionSearchFuture, "result:", 0);
}

- (id)localExtensionSearches
{
  return (id)-[CNFuture result:](self->_localExtensionSearchesFuture, "result:", 0);
}

- (id)directoryServerSearch
{
  return (id)-[CNFuture result:](self->_directoryServerSearchFuture, "result:", 0);
}

- (id)calendarServerSearch
{
  return (id)-[CNFuture result:](self->_calendarServerSearchFuture, "result:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarServerSearchFuture, 0);
  objc_storeStrong((id *)&self->_directoryServerSearchFuture, 0);
  objc_storeStrong((id *)&self->_localExtensionSearchesFuture, 0);
  objc_storeStrong((id *)&self->_predictionSearchFuture, 0);
  objc_storeStrong((id *)&self->_suggestionsSearchFuture, 0);
  objc_storeStrong((id *)&self->_stewieSearchFuture, 0);
  objc_storeStrong((id *)&self->_recentsSearchFuture, 0);
  objc_storeStrong((id *)&self->_localSearchFuture, 0);
}

@end
