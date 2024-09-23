@implementation GDScoreRankedEntityTagPersonsInner

- (GDScoreRankedEntityTagPersonsInner)initWithGdTag:(int64_t)a3 scoredEntities:(id)a4 inferenceEventIdValue:(int64_t)a5
{
  GDScoreRankedEntityTagPersonsInner *result;

  sub_1AE630C3C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson, (void (*)(uint64_t, uint64_t, uint64_t))PersonEntityTaggingService.ScoreRankedEntityTagPersons.init(gdTag:scoredEntities:inferenceEventIdValue:));
  return result;
}

- (int64_t)gdTag
{
  int64_t result;

  sub_1AE630CCC();
  return result;
}

- (NSArray)scoredEntities
{
  return (NSArray *)sub_1AE630D04((uint64_t)self, (uint64_t)a2, (void (*)(void))PersonEntityTaggingService.ScoreRankedEntityTagPersons.scoredEntities.getter, (void (*)(void))type metadata accessor for PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson);
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedEntityTagPersons.inferenceEventId.getter();
}

- (GDScoreRankedEntityTagPersonsInner)init
{
  PersonEntityTaggingService.ScoreRankedEntityTagPersons.init()();
}

- (void).cxx_destruct
{
  sub_1AE640730();
}

@end
