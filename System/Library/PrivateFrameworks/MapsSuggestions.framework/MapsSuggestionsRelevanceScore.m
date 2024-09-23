@implementation MapsSuggestionsRelevanceScore

- (MapsSuggestionsRelevanceScore)initWithConfidence:(double)a3
{
  MapsSuggestionsRelevanceScore *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsRelevanceScore;
  result = -[MapsSuggestionsRelevanceScore init](&v5, sel_init);
  if (result)
    result->_confidence = a3;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)lastInteractionTime
{
  return self->_lastInteractionTime;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void)setLastInteractionTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastInteractionTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInteractionTime, 0);
}

@end
