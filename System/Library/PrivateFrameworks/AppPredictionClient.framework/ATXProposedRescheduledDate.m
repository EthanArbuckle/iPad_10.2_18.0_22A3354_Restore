@implementation ATXProposedRescheduledDate

- (ATXProposedRescheduledDate)initWithDateTime:(id)a3
{
  id v5;
  ATXProposedRescheduledDate *v6;
  ATXProposedRescheduledDate *v7;
  ATXProposedRescheduledDate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXProposedRescheduledDate;
  v6 = -[ATXProposedRescheduledDate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateTime, a3);
    v7->_type = 0;
    v8 = v7;
  }

  return v7;
}

- (ATXProposedRescheduledDate)initWithHourComponents:(id)a3
{
  id v4;
  ATXProposedRescheduledDate *v5;
  uint64_t v6;
  NSDateComponents *components;
  ATXProposedRescheduledDate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXProposedRescheduledDate;
  v5 = -[ATXProposedRescheduledDate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    components = v5->_components;
    v5->_components = (NSDateComponents *)v6;

    v5->_type = 1;
    v8 = v5;
  }

  return v5;
}

- (ATXProposedRescheduledDate)initWithDayComponents:(id)a3
{
  id v4;
  ATXProposedRescheduledDate *v5;
  uint64_t v6;
  NSDateComponents *components;
  ATXProposedRescheduledDate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXProposedRescheduledDate;
  v5 = -[ATXProposedRescheduledDate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    components = v5->_components;
    v5->_components = (NSDateComponents *)v6;

    v5->_type = 2;
    v8 = v5;
  }

  return v5;
}

- (ATXProposedRescheduledDate)initWithDayComponents:(id)a3 fuzzyTimeRangeStart:(id)a4 fuzzyTimeRangeEnd:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXProposedRescheduledDate *v11;
  uint64_t v12;
  NSDateComponents *components;
  ATXProposedRescheduledDate *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXProposedRescheduledDate;
  v11 = -[ATXProposedRescheduledDate init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    components = v11->_components;
    v11->_components = (NSDateComponents *)v12;

    v11->_type = 3;
    objc_storeStrong((id *)&v11->_fuzzyTimeRangeStart, a4);
    objc_storeStrong((id *)&v11->_fuzzyTimeRangeEnd, a5);
    v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateTime, CFSTR("dateTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_components, CFSTR("components"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fuzzyTimeRangeStart, CFSTR("fuzzyTimeStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fuzzyTimeRangeEnd, CFSTR("fuzzyTimeEnd"));

}

- (ATXProposedRescheduledDate)initWithCoder:(id)a3
{
  id v4;
  ATXProposedRescheduledDate *v5;
  uint64_t v6;
  NSDate *dateTime;
  uint64_t v8;
  NSDateComponents *components;
  uint64_t v10;
  ATXTime *fuzzyTimeRangeStart;
  uint64_t v12;
  ATXTime *fuzzyTimeRangeEnd;
  ATXProposedRescheduledDate *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXProposedRescheduledDate;
  v5 = -[ATXProposedRescheduledDate init](&v16, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateTime = v5->_dateTime;
    v5->_dateTime = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("components"));
    v8 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSDateComponents *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fuzzyTimeStart"));
    v10 = objc_claimAutoreleasedReturnValue();
    fuzzyTimeRangeStart = v5->_fuzzyTimeRangeStart;
    v5->_fuzzyTimeRangeStart = (ATXTime *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fuzzyTimeEnd"));
    v12 = objc_claimAutoreleasedReturnValue();
    fuzzyTimeRangeEnd = v5->_fuzzyTimeRangeEnd;
    v5->_fuzzyTimeRangeEnd = (ATXTime *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSDate)dateTime
{
  return self->_dateTime;
}

- (NSDateComponents)components
{
  return self->_components;
}

- (ATXTime)fuzzyTimeRangeStart
{
  return self->_fuzzyTimeRangeStart;
}

- (ATXTime)fuzzyTimeRangeEnd
{
  return self->_fuzzyTimeRangeEnd;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyTimeRangeEnd, 0);
  objc_storeStrong((id *)&self->_fuzzyTimeRangeStart, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);
}

@end
