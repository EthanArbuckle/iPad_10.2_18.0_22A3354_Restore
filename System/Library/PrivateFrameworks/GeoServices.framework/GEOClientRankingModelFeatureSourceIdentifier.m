@implementation GEOClientRankingModelFeatureSourceIdentifier

- (GEOClientRankingModelFeatureSourceIdentifier)init
{
  GEOClientRankingModelFeatureSourceIdentifier *result;

  result = (GEOClientRankingModelFeatureSourceIdentifier *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureSourceIdentifier)initWithSuggestionType:(int)a3 serverEntryType:(int)a4 sourceType:(int64_t)a5
{
  GEOClientRankingModelFeatureSourceIdentifier *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOClientRankingModelFeatureSourceIdentifier;
  result = -[GEOClientRankingModelFeatureSourceIdentifier init](&v9, sel_init);
  if (result)
  {
    result->_sourceType = a5;
    result->_suggestionType = a3;
    result->_serverEntryType = a4;
  }
  return result;
}

- (int64_t)featureIdentifierType
{
  return 1;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (int)serverEntryType
{
  return self->_serverEntryType;
}

@end
