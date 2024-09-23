@implementation ATXUserEducationSuggestionClientRequestHandler

- (ATXUserEducationSuggestionClientRequestHandler)initWithClient:(id)a3
{
  id v4;
  ATXUserEducationSuggestionClientRequestHandler *v5;
  ATXUserEducationSuggestionClientRequestHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXUserEducationSuggestionClientRequestHandler;
  v5 = -[ATXUserEducationSuggestionClientRequestHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_client, v4);

  return v6;
}

- (void)didReceiveUserEducationSuggestionEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_context_user_education_suggestions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ATXUserEducationSuggestionClientRequestHandler didReceiveUserEducationSuggestionEvent:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s: received suggestion event: %@", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  objc_msgSend(WeakRetained, "notifyObserversOfSuggestionEvent:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
}

@end
