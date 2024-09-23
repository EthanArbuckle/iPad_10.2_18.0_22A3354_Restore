@implementation BKSTouchStreamPolicy

- (BOOL)shouldSendAmbiguityRecommendations
{
  return self->_shouldSendAmbiguityRecommendations;
}

- (void)setShouldSendAmbiguityRecommendations:(BOOL)a3
{
  self->_shouldSendAmbiguityRecommendations = a3;
}

@end
