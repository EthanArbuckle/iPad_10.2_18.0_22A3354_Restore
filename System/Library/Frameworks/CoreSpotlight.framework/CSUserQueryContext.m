@implementation CSUserQueryContext

+ (CSUserQueryContext)userQueryContext
{
  CSUserQueryContext *v2;

  v2 = objc_alloc_init(CSUserQueryContext);
  -[CSSearchQueryContext setGenerateSuggestions:](v2, "setGenerateSuggestions:", 0);
  -[CSSearchQueryContext setEnableSuggestionTokens:](v2, "setEnableSuggestionTokens:", 0);
  -[CSUserQueryContext setMaxResultCount:](v2, "setMaxResultCount:", 0);
  -[CSSearchQueryContext setMaxRankedResultCount:](v2, "setMaxRankedResultCount:", 100);
  -[CSSearchQueryContext setMaxSuggestionCount:](v2, "setMaxSuggestionCount:", 0);
  -[CSSearchQueryContext setEmbeddingGenerationTimeout:](v2, "setEmbeddingGenerationTimeout:", -1);
  -[CSSearchQueryContext setEmbeddingRelevanceThreshold:](v2, "setEmbeddingRelevanceThreshold:", -3.40282347e38);
  return v2;
}

+ (CSUserQueryContext)userQueryContextWithCurrentSuggestion:(CSSuggestion *)currentSuggestion
{
  CSSuggestion *v3;
  CSUserQueryContext *v4;

  v3 = currentSuggestion;
  v4 = objc_alloc_init(CSUserQueryContext);
  -[CSSearchQueryContext setGenerateSuggestions:](v4, "setGenerateSuggestions:", 1);
  -[CSSearchQueryContext setEnableSuggestionTokens:](v4, "setEnableSuggestionTokens:", 0);
  -[CSUserQueryContext setMaxResultCount:](v4, "setMaxResultCount:", 0);
  -[CSSearchQueryContext setMaxRankedResultCount:](v4, "setMaxRankedResultCount:", 100);
  -[CSSearchQueryContext setMaxSuggestionCount:](v4, "setMaxSuggestionCount:", 10);
  -[CSSearchQueryContext setSuggestion:](v4, "setSuggestion:", v3);

  -[CSSearchQueryContext setEmbeddingGenerationTimeout:](v4, "setEmbeddingGenerationTimeout:", -1);
  -[CSSearchQueryContext setEmbeddingRelevanceThreshold:](v4, "setEmbeddingRelevanceThreshold:", -3.40282347e38);
  return v4;
}

- (id)getParserOptions
{
  return self->_queryParserOptions;
}

- (void)updateWithOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *queryParserOptions;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  queryParserOptions = self->_queryParserOptions;
  self->_queryParserOptions = v4;

}

- (BOOL)enableRankedResults
{
  return self->_enableRankedResults;
}

- (void)setEnableRankedResults:(BOOL)enableRankedResults
{
  self->_enableRankedResults = enableRankedResults;
}

- (NSInteger)maxResultCount
{
  return self->_maxResultCount;
}

- (void)setMaxResultCount:(NSInteger)maxResultCount
{
  self->_maxResultCount = maxResultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryParserOptions, 0);
}

@end
