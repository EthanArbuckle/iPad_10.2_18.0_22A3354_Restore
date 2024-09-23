@implementation ATXAnchorModelClassificationResult

- (ATXAnchorModelClassificationResult)initWithShouldPredictCandidate:(BOOL)a3 score:(double)a4
{
  ATXAnchorModelClassificationResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXAnchorModelClassificationResult;
  result = -[ATXAnchorModelClassificationResult init](&v7, sel_init);
  if (result)
  {
    result->_shouldPredictCandidate = a3;
    result->_score = a4;
  }
  return result;
}

- (BOOL)shouldPredictCandidate
{
  return self->_shouldPredictCandidate;
}

- (double)score
{
  return self->_score;
}

@end
