@implementation ATXInfoEngineCachedSuggestionsEntry

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionId, a3);
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void)setSourceId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
