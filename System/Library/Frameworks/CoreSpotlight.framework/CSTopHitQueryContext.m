@implementation CSTopHitQueryContext

+ (id)topHitQueryContext
{
  CSTopHitQueryContext *v2;

  v2 = objc_alloc_init(CSTopHitQueryContext);
  -[CSSearchQueryContext setLowPriority:](v2, "setLowPriority:", 0);
  -[CSSearchQueryContext setRankingType:](v2, "setRankingType:", 1);
  -[CSTopHitQueryContext setMaxItemCount:](v2, "setMaxItemCount:", 0);
  -[CSUserQueryContext setMaxResultCount:](v2, "setMaxResultCount:", 0);
  -[CSSearchQueryContext setMaxSuggestionCount:](v2, "setMaxSuggestionCount:", 0);
  -[CSSearchQueryContext setGenerateSuggestions:](v2, "setGenerateSuggestions:", 0);
  -[CSSearchQueryContext setEnableSuggestionTokens:](v2, "setEnableSuggestionTokens:", 0);
  return v2;
}

+ (id)topHitQueryContextWithCurrentSuggestion:(id)a3
{
  id v3;
  CSTopHitQueryContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(CSTopHitQueryContext);
  -[CSSearchQueryContext setLowPriority:](v4, "setLowPriority:", 0);
  -[CSSearchQueryContext setRankingType:](v4, "setRankingType:", 1);
  -[CSTopHitQueryContext setMaxItemCount:](v4, "setMaxItemCount:", 0);
  -[CSUserQueryContext setMaxResultCount:](v4, "setMaxResultCount:", 0);
  -[CSSearchQueryContext setMaxSuggestionCount:](v4, "setMaxSuggestionCount:", 10);
  -[CSSearchQueryContext setGenerateSuggestions:](v4, "setGenerateSuggestions:", 1);
  -[CSSearchQueryContext setEnableSuggestionTokens:](v4, "setEnableSuggestionTokens:", 0);
  -[CSSearchQueryContext setSuggestion:](v4, "setSuggestion:", v3);

  return v4;
}

- (int64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxItemCount = a3;
}

@end
