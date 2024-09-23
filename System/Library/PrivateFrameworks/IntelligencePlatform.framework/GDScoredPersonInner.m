@implementation GDScoredPersonInner

- (unint64_t)idValue
{
  return sub_1AE63095C();
}

- (int64_t)inferenceEventIdValue
{
  return PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.inferenceEventId.getter();
}

- (double)score
{
  return PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.score.getter();
}

- (GDScoredPersonInner)initWithIdValue:(unint64_t)a3 score:(double)a4 inferenceEventIdValue:(int64_t)a5
{
  GDScoredPersonInner *result;

  PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.init(idValue:score:inferenceEventIdValue:)(a3, a5, a4);
  return result;
}

- (GDScoredPersonInner)init
{
  PersonEntityTaggingService.ScoreRankedEntityTagPersons.ScoredPerson.init()();
}

@end
