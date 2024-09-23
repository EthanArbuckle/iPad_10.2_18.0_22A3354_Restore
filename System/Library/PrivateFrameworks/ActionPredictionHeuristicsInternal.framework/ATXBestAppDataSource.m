@implementation ATXBestAppDataSource

- (ATXBestAppDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXBestAppDataSource *v6;
  ATXBestAppDataSource *v7;
  uint64_t v8;
  UABestAppSuggestionManager *bestAppSuggestionManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBestAppDataSource;
  v6 = -[ATXBestAppDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_opt_new();
    bestAppSuggestionManager = v7->_bestAppSuggestionManager;
    v7->_bestAppSuggestionManager = (UABestAppSuggestionManager *)v8;

  }
  return v7;
}

- (void)bestAppSuggestionWithCallback:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[UABestAppSuggestionManager bestAppSuggestion](self->_bestAppSuggestionManager, "bestAppSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    __atxlog_handle_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "bestAppSuggestionWithCallback: no bestApp suggestion (nil)", v7, 2u);
    }

  }
  v4[2](v4, v5, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAppSuggestionManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
