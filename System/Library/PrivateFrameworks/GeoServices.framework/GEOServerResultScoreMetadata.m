@implementation GEOServerResultScoreMetadata

- (GEOServerResultScoreMetadata)initWithGEOServerResultScoreMetadata:(id)a3
{
  float *v4;
  GEOServerResultScoreMetadata *v5;
  GEOServerResultScoreMetadata *v6;
  float v7;
  objc_super v9;

  v4 = (float *)a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOServerResultScoreMetadata;
  v5 = -[GEOServerResultScoreMetadata init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4[4];
    else
      v7 = 0.0;
    v5->_normalizedScore = v7;
  }

  return v6;
}

- (float)normalizedScore
{
  return self->_normalizedScore;
}

- (void)setNormalizedScore:(float)a3
{
  self->_normalizedScore = a3;
}

@end
