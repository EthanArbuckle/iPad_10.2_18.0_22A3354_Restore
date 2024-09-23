@implementation ATXCompactTimeSummary

- (ATXCompactTimeSummary)initWithTimeMarbles:(id)a3
{
  id v4;
  ATXCompactTimeSummary *v5;
  uint64_t v6;
  NSArray *timeMarbles;
  ATXCompactTimeSummary *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXCompactTimeSummary;
  v5 = -[ATXCompactTimeSummary init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timeMarbles = v5->_timeMarbles;
    v5->_timeMarbles = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXCompactTimeSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXCompactTimeSummary *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("timeMarbles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXCompactTimeSummary initWithTimeMarbles:](self, "initWithTimeMarbles:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_timeMarbles, CFSTR("timeMarbles"));
}

- (NSArray)timeMarbles
{
  return self->_timeMarbles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeMarbles, 0);
}

@end
