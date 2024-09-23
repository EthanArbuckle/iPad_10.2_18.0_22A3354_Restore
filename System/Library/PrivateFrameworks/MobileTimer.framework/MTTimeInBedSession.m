@implementation MTTimeInBedSession

+ (id)timeInBedSessionWithStartDate:(id)a3 endDate:(id)a4 intervals:(id)a5 endReason:(unint64_t)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartDate:endDate:intervals:endReason:metadata:", v15, v14, v13, a6, v12);

  return v16;
}

- (MTTimeInBedSession)initWithStartDate:(id)a3 endDate:(id)a4 intervals:(id)a5 endReason:(unint64_t)a6 metadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MTTimeInBedSession *v17;
  MTTimeInBedSession *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MTTimeInBedSession;
  v17 = -[MTTimeInBedSession init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_startDate, a3);
    objc_storeStrong((id *)&v18->_endDate, a4);
    objc_storeStrong((id *)&v18->_intervals, a5);
    v18->_endReason = a6;
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

- (int64_t)sampleType
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MTTimeInBedSession startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("StartDate"));

  -[MTTimeInBedSession endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EndDate"));

  -[MTTimeInBedSession intervals](self, "intervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("Intervals"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[MTTimeInBedSession endReason](self, "endReason"), CFSTR("EndReason"));
  -[MTTimeInBedSession metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("MetaData"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MTTimeInBedSession needsAdditionalProcessing](self, "needsAdditionalProcessing"), CFSTR("NeedsAdditionalProcessing"));
}

- (MTTimeInBedSession)initWithCoder:(id)a3
{
  id v4;
  MTTimeInBedSession *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *intervals;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *metadata;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MTTimeInBedSession;
  v5 = -[MTTimeInBedSession init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Intervals"));
    v13 = objc_claimAutoreleasedReturnValue();
    intervals = v5->_intervals;
    v5->_intervals = (NSArray *)v13;

    v5->_endReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EndReason"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("MetaData"));
    v18 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v18;

    v5->_needsAdditionalProcessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NeedsAdditionalProcessing"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSDate *startDate;
  NSDate *endDate;
  void *v8;
  void *v9;

  if (self->_needsAdditionalProcessing)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("needsAdditionalProcessing: %d"), 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intervals: %lu"), -[NSArray count](self->_intervals, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  startDate = self->_startDate;
  endDate = self->_endDate;
  MTSleepSessionEndReasonDescription(self->_endReason);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p start: %@ end: %@ %@ reason: %@ metadata: %@>"), v5, self, startDate, endDate, v3, v8, self->_metadata);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)needsAdditionalProcessing
{
  return self->_needsAdditionalProcessing;
}

- (void)setNeedsAdditionalProcessing:(BOOL)a3
{
  self->_needsAdditionalProcessing = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSArray)intervals
{
  return self->_intervals;
}

- (void)setIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_intervals, a3);
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(unint64_t)a3
{
  self->_endReason = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
