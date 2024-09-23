@implementation _CNAPeopleSuggesterFacade

- (_CNAPeopleSuggesterFacade)init
{
  id v3;
  _CNAPeopleSuggesterFacade *v4;

  v3 = objc_alloc_init(get_PSSuggesterClass());
  v4 = -[_CNAPeopleSuggesterFacade initWithPeopleSuggester:](self, "initWithPeopleSuggester:", v3);

  return v4;
}

- (_CNAPeopleSuggesterFacade)initWithPeopleSuggester:(id)a3
{
  id v5;
  _CNAPeopleSuggesterFacade *v6;
  _CNAPeopleSuggesterFacade *v7;
  _CNAPeopleSuggesterFacade *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAPeopleSuggesterFacade;
  v6 = -[_CNAPeopleSuggesterFacade init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggester, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("suggester"), self->_suggester);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4;
  _PSSuggester *v5;
  void *v6;
  void *v7;
  void *v8;
  _PSSuggester *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  _PSSuggester *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v5 = self->_suggester;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "immediateScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76___CNAPeopleSuggesterFacade_autocompleteSearchResultsWithPredictionContext___block_invoke;
  v14[3] = &unk_1E70DED50;
  v9 = v5;
  v15 = v9;
  v17 = &v18;
  v10 = v4;
  v16 = v10;
  objc_msgSend(v8, "performBlock:qualityOfService:", v14, 4);

  v11 = (void *)v19[5];
  if (!v11)
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v11;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (_PSSuggester)suggester
{
  return (_PSSuggester *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggester, 0);
}

@end
