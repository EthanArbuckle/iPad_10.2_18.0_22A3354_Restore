@implementation FCCWeeklyGoalDisplayContext

- (FCCWeeklyGoalDisplayContext)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  FCCWeeklyGoalDisplayContext *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisplayCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCCWeeklyGoalDisplayContext initWithDisplayCount:lastDisplayDate:](self, "initWithDisplayCount:lastDisplayDate:", v6, v7);

  return v8;
}

- (FCCWeeklyGoalDisplayContext)initWithDisplayCount:(int64_t)a3 lastDisplayDate:(id)a4
{
  id v7;
  FCCWeeklyGoalDisplayContext *v8;
  FCCWeeklyGoalDisplayContext *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCCWeeklyGoalDisplayContext;
  v8 = -[FCCWeeklyGoalDisplayContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_displayCount = a3;
    objc_storeStrong((id *)&v8->_lastDisplayDate, a4);
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("DisplayCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("LastDate");
  v7[0] = v3;
  v7[1] = self->_lastDisplayDate;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCWeeklyGoalDisplayContext<%p>: displayCount: %d, last display date: %@"), self, self->_displayCount, self->_lastDisplayDate);
}

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (NSDate)lastDisplayDate
{
  return self->_lastDisplayDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayDate, 0);
}

@end
