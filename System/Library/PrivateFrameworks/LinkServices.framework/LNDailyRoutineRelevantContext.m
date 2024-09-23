@implementation LNDailyRoutineRelevantContext

- (LNDailyRoutineRelevantContext)initWithSituation:(int64_t)a3
{
  LNDailyRoutineRelevantContext *v4;
  LNDailyRoutineRelevantContext *v5;
  LNDailyRoutineRelevantContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNDailyRoutineRelevantContext;
  v4 = -[LNRelevantContext _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_situation = a3;
    v6 = v4;
  }

  return v5;
}

- (LNDailyRoutineRelevantContext)initWithCoder:(id)a3
{
  return -[LNDailyRoutineRelevantContext initWithSituation:](self, "initWithSituation:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("situation")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_situation, CFSTR("situation"));
}

- (unint64_t)hash
{
  return self->_situation;
}

- (BOOL)isEqual:(id)a3
{
  LNDailyRoutineRelevantContext *v4;
  BOOL v5;

  v4 = (LNDailyRoutineRelevantContext *)a3;
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

- (id)description
{
  void *v2;
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[LNDailyRoutineRelevantContext situation](self, "situation");
  if ((unint64_t)(v3 - 1) > 0xE)
    v4 = CFSTR(".sleep(.wakeup)");
  else
    v4 = off_1E45DCB50[v3 - 1];
  v5 = v4;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<routine: %@>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)analyticsDescription
{
  int64_t v2;

  v2 = -[LNDailyRoutineRelevantContext situation](self, "situation");
  if ((unint64_t)(v2 - 1) > 0xE)
    return CFSTR(".sleep(.wakeup)");
  else
    return off_1E45DCB50[v2 - 1];
}

- (id)asCondition
{
  return -[LNDailyRoutineRelevantCondition initWithSituation:]([LNDailyRoutineRelevantCondition alloc], "initWithSituation:", -[LNDailyRoutineRelevantContext situation](self, "situation"));
}

- (int64_t)situation
{
  return self->_situation;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
