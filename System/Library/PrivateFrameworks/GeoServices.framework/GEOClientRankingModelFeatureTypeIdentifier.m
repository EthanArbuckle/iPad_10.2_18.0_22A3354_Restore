@implementation GEOClientRankingModelFeatureTypeIdentifier

- (GEOClientRankingModelFeatureTypeIdentifier)init
{
  GEOClientRankingModelFeatureTypeIdentifier *result;

  result = (GEOClientRankingModelFeatureTypeIdentifier *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureTypeIdentifier)initWithFeatureType:(int64_t)a3
{
  GEOClientRankingModelFeatureTypeIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOClientRankingModelFeatureTypeIdentifier;
  result = -[GEOClientRankingModelFeatureTypeIdentifier init](&v5, sel_init);
  if (result)
    result->_featureType = a3;
  return result;
}

- (int64_t)featureIdentifierType
{
  return 2;
}

- (int64_t)featureType
{
  return self->_featureType;
}

@end
