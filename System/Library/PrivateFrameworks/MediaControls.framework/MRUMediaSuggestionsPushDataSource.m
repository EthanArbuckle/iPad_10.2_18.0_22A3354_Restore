@implementation MRUMediaSuggestionsPushDataSource

- (MRUMediaSuggestionsPushDataSource)init
{
  MRUMediaSuggestionsPushDataSource *v2;
  id v3;
  void *v4;
  uint64_t v5;
  MRMediaSuggestionController *mediaSuggestionsController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUMediaSuggestionsPushDataSource;
  v2 = -[MRUMediaSuggestionsPushDataSource init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D4C580]);
    objc_msgSend(MEMORY[0x1E0D4C590], "defaultRequestWithArtwork");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithRequest:", v4);
    mediaSuggestionsController = v2->_mediaSuggestionsController;
    v2->_mediaSuggestionsController = (MRMediaSuggestionController *)v5;

    -[MRMediaSuggestionController setDelegate:](v2->_mediaSuggestionsController, "setDelegate:", v2);
  }
  return v2;
}

- (void)refreshMediaSuggestions
{
  -[MRMediaSuggestionController start](self->_mediaSuggestionsController, "start");
}

- (void)controller:(id)a3 didUpdateSuggestions:(id)a4
{
  MRUMediaSuggestionsDataSourceDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "mediaSuggestionsDataSource:didChangeMediaSuggestions:", self, v6);

}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    -[MRMediaSuggestionController request](self->_mediaSuggestionsController, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%@ error retrieving media suggestions: %@, error: %@", (uint8_t *)&v9, 0x20u);

  }
}

- (NSDictionary)mediaSuggestions
{
  return self->_mediaSuggestions;
}

- (MRUMediaSuggestionsDataSourceDelegate)delegate
{
  return (MRUMediaSuggestionsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRMediaSuggestionController)mediaSuggestionsController
{
  return self->_mediaSuggestionsController;
}

- (void)setMediaSuggestionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSuggestionsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSuggestionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
}

@end
