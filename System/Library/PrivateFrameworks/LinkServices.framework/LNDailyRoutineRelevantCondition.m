@implementation LNDailyRoutineRelevantCondition

- (int64_t)situation
{
  return self->_situation;
}

- (LNDailyRoutineRelevantCondition)initWithSituation:(int64_t)a3
{
  LNDailyRoutineRelevantCondition *v4;
  LNDailyRoutineRelevantCondition *v5;
  LNDailyRoutineRelevantCondition *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNDailyRoutineRelevantCondition;
  v4 = -[LNRelevantCondition _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_situation = a3;
    v6 = v4;
  }

  return v5;
}

@end
