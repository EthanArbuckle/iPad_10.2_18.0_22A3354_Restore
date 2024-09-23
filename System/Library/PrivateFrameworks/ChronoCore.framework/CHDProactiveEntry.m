@implementation CHDProactiveEntry

- (CHDProactiveEntry)initWithDate:(id)a3
{
  id v5;
  CHDProactiveEntry *v6;
  CHDProactiveEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHDProactiveEntry;
  v6 = -[CHDProactiveEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v7->_hasRelevance = 0;
    v7->_score = 0.0;
    v7->_duration = 0.0;
  }

  return v7;
}

- (CHDProactiveEntry)initWithDate:(id)a3 score:(double)a4 duration:(double)a5
{
  id v9;
  CHDProactiveEntry *v10;
  CHDProactiveEntry *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHDProactiveEntry;
  v10 = -[CHDProactiveEntry init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_date, a3);
    v11->_hasRelevance = 1;
    v11->_score = a4;
    v11->_duration = a5;
  }

  return v11;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)hasRelevance
{
  return self->_hasRelevance;
}

- (double)score
{
  return self->_score;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
