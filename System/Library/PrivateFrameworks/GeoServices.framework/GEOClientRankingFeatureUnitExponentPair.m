@implementation GEOClientRankingFeatureUnitExponentPair

- (GEOClientRankingFeatureUnitExponentPair)initWithUnit:(id)a3 exponent:(unsigned int)a4
{
  id v7;
  GEOClientRankingFeatureUnitExponentPair *v8;
  GEOClientRankingFeatureUnitExponentPair *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOClientRankingFeatureUnitExponentPair;
  v8 = -[GEOClientRankingFeatureUnitExponentPair init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_unit, a3);
    v9->_exponent = a4;
  }

  return v9;
}

- (GEOClientRankingFeatureUnit)unit
{
  return self->_unit;
}

- (unsigned)exponent
{
  return self->_exponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
