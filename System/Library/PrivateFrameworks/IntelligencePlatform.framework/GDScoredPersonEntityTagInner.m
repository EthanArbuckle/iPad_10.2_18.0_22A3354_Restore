@implementation GDScoredPersonEntityTagInner

- (GDScoredPersonEntityTagInner)initWithGdTag:(int64_t)a3 score:(double)a4 inferenceEventIdValue:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return (GDScoredPersonEntityTagInner *)PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.init(gdTag:score:inferenceEventIdValue:)(a3, a5, a3, a5, v5, v6, v7, v8, a4);
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.inferenceEventId.getter();
}

- (int64_t)gdTag
{
  int64_t result;

  sub_1AE6306C8();
  return result;
}

- (double)score
{
  return PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.score.getter();
}

- (GDScoredPersonEntityTagInner)init
{
  PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag.init()();
}

@end
