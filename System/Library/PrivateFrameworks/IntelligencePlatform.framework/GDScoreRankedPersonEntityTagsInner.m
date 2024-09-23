@implementation GDScoreRankedPersonEntityTagsInner

- (GDScoreRankedPersonEntityTagsInner)initWithIdValue:(int64_t)a3 scoredPersonEntityTags:(id)a4 inferenceEventIdValue:(int64_t)a5
{
  GDScoreRankedPersonEntityTagsInner *result;

  sub_1AE630C3C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag, (void (*)(uint64_t, uint64_t, uint64_t))PersonEntityTaggingService.ScoreRankedPersonEntityTags.init(idValue:scoredPersonEntityTags:inferenceEventIdValue:));
  return result;
}

- (unint64_t)idValue
{
  return sub_1AE63088C();
}

- (NSArray)scoredPersonEntityTags
{
  return (NSArray *)sub_1AE630D04((uint64_t)self, (uint64_t)a2, (void (*)(void))PersonEntityTaggingService.ScoreRankedPersonEntityTags.scoredPersonEntityTags.getter, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedPersonEntityTags.ScoredPersonEntityTag);
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedPersonEntityTags.inferenceEventId.getter();
}

- (GDScoreRankedPersonEntityTagsInner)init
{
  PersonEntityTaggingService.ScoreRankedPersonEntityTags.init()();
}

- (void).cxx_destruct
{
  sub_1AE640730();
}

@end
