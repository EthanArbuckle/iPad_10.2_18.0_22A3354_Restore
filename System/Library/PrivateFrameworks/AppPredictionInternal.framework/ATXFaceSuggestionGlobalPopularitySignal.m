@implementation ATXFaceSuggestionGlobalPopularitySignal

- (ATXFaceSuggestionGlobalPopularitySignal)initWithParameters:(id)a3
{
  id v4;
  ATXFaceSuggestionGlobalPopularitySignal *v5;
  uint64_t v6;
  NSDictionary *globalPopularityScores;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFaceSuggestionGlobalPopularitySignal;
  v5 = -[ATXFaceSuggestionGlobalPopularitySignal init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "globalPopularityScores");
    v6 = objc_claimAutoreleasedReturnValue();
    globalPopularityScores = v5->_globalPopularityScores;
    v5->_globalPopularityScores = (NSDictionary *)v6;

  }
  return v5;
}

- (double)valueForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_globalPopularityScores, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[ATXFaceSuggestionGlobalPopularitySignal valueForDescriptor:]";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "%s: no global popularity score present for descriptor: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0.0;
  }

  return v8;
}

- (double)weight
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalPopularityScores, 0);
}

@end
