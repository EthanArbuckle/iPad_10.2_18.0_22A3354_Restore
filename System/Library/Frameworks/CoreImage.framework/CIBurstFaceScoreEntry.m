@implementation CIBurstFaceScoreEntry

- (CIBurstFaceScoreEntry)initWithScore:(float)a3
{
  self->maxScore = a3;
  self->minScore = a3;
  self->sumScores = a3;
  self->sumSqScores = a3 * a3;
  self->numScores = 1;
  return self;
}

- (void)addScore:(float)a3
{
  float maxScore;
  float minScore;
  float v5;
  float v6;

  maxScore = self->maxScore;
  minScore = self->minScore;
  if (maxScore <= a3)
    maxScore = a3;
  if (minScore >= a3)
    minScore = a3;
  self->maxScore = maxScore;
  self->minScore = minScore;
  v5 = self->sumScores + a3;
  v6 = self->sumSqScores + (float)(a3 * a3);
  self->sumScores = v5;
  self->sumSqScores = v6;
  ++self->numScores;
}

- (float)computeAverage
{
  return self->sumScores / (float)self->numScores;
}

- (float)computeStandardDeviation
{
  float v3;

  -[CIBurstFaceScoreEntry computeAverage](self, "computeAverage");
  return sqrtf((float)(self->sumSqScores / (float)self->numScores) - (float)(v3 * v3));
}

- (float)maxScore
{
  return self->maxScore;
}

- (void)setMaxScore:(float)a3
{
  self->maxScore = a3;
}

- (float)minScore
{
  return self->minScore;
}

- (void)setMinScore:(float)a3
{
  self->minScore = a3;
}

- (int)numScores
{
  return self->numScores;
}

- (void)setNumScores:(int)a3
{
  self->numScores = a3;
}

@end
