@implementation INDailyRoutineRelevanceProvider

- (INDailyRoutineRelevanceProvider)initWithSituation:(INDailyRoutineSituation)situation
{
  INDailyRoutineRelevanceProvider *v4;
  INDailyRoutineRelevanceProvider *v5;
  INDailyRoutineRelevanceProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INDailyRoutineRelevanceProvider;
  v4 = -[INRelevanceProvider _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_situation = situation;
    v6 = v4;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_situation, CFSTR("situation"));
}

- (INDailyRoutineRelevanceProvider)initWithCoder:(id)a3
{
  return -[INDailyRoutineRelevanceProvider initWithSituation:](self, "initWithSituation:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("situation")));
}

- (unint64_t)hash
{
  return self->_situation;
}

- (BOOL)isEqual:(id)a3
{
  INDailyRoutineRelevanceProvider *v4;
  BOOL v5;

  v4 = (INDailyRoutineRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_situation == v4->_situation;
  }

  return v5;
}

- (INDailyRoutineSituation)situation
{
  return self->_situation;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
