@implementation GEOClientRankingModelFeatureCompositeIdentifier

- (GEOClientRankingModelFeatureCompositeIdentifier)initWithUnitExponentPairs:(id)a3 featureWeight:(float)a4
{
  id v6;
  GEOClientRankingModelFeatureCompositeIdentifier *v7;
  uint64_t v8;
  NSArray *unitExponentPairs;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOClientRankingModelFeatureCompositeIdentifier;
  v7 = -[GEOClientRankingModelFeatureCompositeIdentifier init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    unitExponentPairs = v7->_unitExponentPairs;
    v7->_unitExponentPairs = (NSArray *)v8;

    v7->_featureWeight = a4;
  }

  return v7;
}

- (int64_t)featureIdentifierType
{
  return 3;
}

- (NSArray)unitExponentPairs
{
  return self->_unitExponentPairs;
}

- (void)setUnitExponentPairs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (float)featureWeight
{
  return self->_featureWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitExponentPairs, 0);
}

@end
