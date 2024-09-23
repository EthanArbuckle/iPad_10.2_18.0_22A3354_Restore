@implementation _CDContactStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDContactStatistics)initWithCoder:(id)a3
{
  id v4;
  _CDContactStatistics *v5;
  uint64_t v6;
  NSDate *lastOutgoingRecipientDate;
  uint64_t v8;
  NSDate *lastIncomingSenderDate;
  uint64_t v10;
  NSDate *lastIncomingRecipientDate;
  uint64_t v12;
  NSDate *firstOutgoingRecipientDate;
  uint64_t v14;
  NSDate *firstIncomingSenderDate;
  uint64_t v16;
  NSDate *firstIncomingRecipientDate;
  _CDContactStatistics *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CDContactStatistics;
  v5 = -[_CDContactStatistics init](&v20, sel_init);
  if (v5)
  {
    v5->_outgoingRecipientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outgoingRecipientCount"));
    v5->_incomingSenderCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("incomingSenderCount"));
    v5->_incomingRecipientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("incomingRecipientCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastOutgoingRecipientDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastOutgoingRecipientDate = v5->_lastOutgoingRecipientDate;
    v5->_lastOutgoingRecipientDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastIncomingSenderDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastIncomingSenderDate = v5->_lastIncomingSenderDate;
    v5->_lastIncomingSenderDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastIncomingRecipientDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastIncomingRecipientDate = v5->_lastIncomingRecipientDate;
    v5->_lastIncomingRecipientDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstOutgoingRecipientDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    firstOutgoingRecipientDate = v5->_firstOutgoingRecipientDate;
    v5->_firstOutgoingRecipientDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstIncomingSenderDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    firstIncomingSenderDate = v5->_firstIncomingSenderDate;
    v5->_firstIncomingSenderDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstIncomingRecipientDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstIncomingRecipientDate = v5->_firstIncomingRecipientDate;
    v5->_firstIncomingRecipientDate = (NSDate *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t outgoingRecipientCount;
  id v5;

  outgoingRecipientCount = self->_outgoingRecipientCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", outgoingRecipientCount, CFSTR("outgoingRecipientCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_incomingSenderCount, CFSTR("incomingSenderCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_incomingRecipientCount, CFSTR("incomingRecipientCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastOutgoingRecipientDate, CFSTR("lastOutgoingRecipientDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastIncomingSenderDate, CFSTR("lastIncomingSenderDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastIncomingRecipientDate, CFSTR("lastIncomingRecipientDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstOutgoingRecipientDate, CFSTR("firstOutgoingRecipientDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstIncomingSenderDate, CFSTR("firstIncomingSenderDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstIncomingRecipientDate, CFSTR("firstIncomingRecipientDate"));

}

- (id)description
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("Statistics { \n"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDContactStatistics interactionCount](self, "interactionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("             Count: %@\n"), v4);

  -[_CDContactStatistics interactionTimeInterval](self, "interactionTimeInterval");
  v6 = v5 / 86400.0;
  -[_CDContactStatistics firstInteractionDate](self, "firstInteractionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics lastInteractionDate](self, "lastInteractionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("             Times: %3.1f days, %@ - %@\n"), *(_QWORD *)&v6, v7, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDContactStatistics outgoingRecipientCount](self, "outgoingRecipientCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         Out Count: %@\n"), v9);

  -[_CDContactStatistics outgoingRecipientTimeInterval](self, "outgoingRecipientTimeInterval");
  v11 = v10 / 86400.0;
  -[_CDContactStatistics firstOutgoingRecipientDate](self, "firstOutgoingRecipientDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics lastOutgoingRecipientDate](self, "lastOutgoingRecipientDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         Out Times: %3.1f days, %@ - %@\n"), *(_QWORD *)&v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDContactStatistics incomingSenderCount](self, "incomingSenderCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("          In Count: %@\n"), v14);

  -[_CDContactStatistics incomingSenderTimeInterval](self, "incomingSenderTimeInterval");
  v16 = v15 / 86400.0;
  -[_CDContactStatistics firstIncomingSenderDate](self, "firstIncomingSenderDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics lastIncomingSenderDate](self, "lastIncomingSenderDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("          In Times: %3.1f days, %@ - %@\n"), *(_QWORD *)&v16, v17, v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDContactStatistics incomingRecipientCount](self, "incomingRecipientCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    Joint In Count: %@\n"), v19);

  -[_CDContactStatistics incomingRecipientTimeInterval](self, "incomingRecipientTimeInterval");
  v21 = v20 / 86400.0;
  -[_CDContactStatistics firstIncomingRecipientDate](self, "firstIncomingRecipientDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics lastIncomingRecipientDate](self, "lastIncomingRecipientDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    Joint In Times: %3.1f days, %@ - %@\n"), *(_QWORD *)&v21, v22, v23);

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (id)firstDate:(id)a3 updatedWith:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "earlierDate:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)lastDate:(id)a3 updatedWith:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "laterDate:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDContactStatistics *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[_CDContactStatistics init](+[_CDContactStatistics allocWithZone:](_CDContactStatistics, "allocWithZone:", a3), "init");
  -[_CDContactStatistics setOutgoingRecipientCount:](v4, "setOutgoingRecipientCount:", -[_CDContactStatistics outgoingRecipientCount](self, "outgoingRecipientCount"));
  -[_CDContactStatistics setIncomingSenderCount:](v4, "setIncomingSenderCount:", -[_CDContactStatistics incomingSenderCount](self, "incomingSenderCount"));
  -[_CDContactStatistics setIncomingRecipientCount:](v4, "setIncomingRecipientCount:", -[_CDContactStatistics incomingRecipientCount](self, "incomingRecipientCount"));
  -[_CDContactStatistics lastOutgoingRecipientDate](self, "lastOutgoingRecipientDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics setLastOutgoingRecipientDate:](v4, "setLastOutgoingRecipientDate:", v5);

  -[_CDContactStatistics lastIncomingSenderDate](self, "lastIncomingSenderDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics setLastIncomingSenderDate:](v4, "setLastIncomingSenderDate:", v6);

  -[_CDContactStatistics lastIncomingRecipientDate](self, "lastIncomingRecipientDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics setLastIncomingRecipientDate:](v4, "setLastIncomingRecipientDate:", v7);

  -[_CDContactStatistics firstOutgoingRecipientDate](self, "firstOutgoingRecipientDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics setFirstOutgoingRecipientDate:](v4, "setFirstOutgoingRecipientDate:", v8);

  -[_CDContactStatistics firstIncomingSenderDate](self, "firstIncomingSenderDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics setFirstIncomingSenderDate:](v4, "setFirstIncomingSenderDate:", v9);

  -[_CDContactStatistics firstIncomingRecipientDate](self, "firstIncomingRecipientDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics setFirstIncomingRecipientDate:](v4, "setFirstIncomingRecipientDate:", v10);

  return v4;
}

- (void)updateWithStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (a3)
  {
    v4 = a3;
    -[_CDContactStatistics setOutgoingRecipientCount:](self, "setOutgoingRecipientCount:", -[_CDContactStatistics outgoingRecipientCount](self, "outgoingRecipientCount")+ objc_msgSend(v4, "outgoingRecipientCount"));
    -[_CDContactStatistics setIncomingSenderCount:](self, "setIncomingSenderCount:", -[_CDContactStatistics incomingSenderCount](self, "incomingSenderCount") + objc_msgSend(v4, "incomingSenderCount"));
    -[_CDContactStatistics setIncomingRecipientCount:](self, "setIncomingRecipientCount:", -[_CDContactStatistics incomingRecipientCount](self, "incomingRecipientCount")+ objc_msgSend(v4, "incomingRecipientCount"));
    -[_CDContactStatistics firstOutgoingRecipientDate](self, "firstOutgoingRecipientDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstOutgoingRecipientDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics firstDate:updatedWith:](self, "firstDate:updatedWith:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics setFirstOutgoingRecipientDate:](self, "setFirstOutgoingRecipientDate:", v7);

    -[_CDContactStatistics firstIncomingSenderDate](self, "firstIncomingSenderDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstIncomingSenderDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics firstDate:updatedWith:](self, "firstDate:updatedWith:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics setFirstIncomingSenderDate:](self, "setFirstIncomingSenderDate:", v10);

    -[_CDContactStatistics firstIncomingRecipientDate](self, "firstIncomingRecipientDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstIncomingRecipientDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics firstDate:updatedWith:](self, "firstDate:updatedWith:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics setFirstIncomingRecipientDate:](self, "setFirstIncomingRecipientDate:", v13);

    -[_CDContactStatistics lastOutgoingRecipientDate](self, "lastOutgoingRecipientDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastOutgoingRecipientDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics lastDate:updatedWith:](self, "lastDate:updatedWith:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics setLastOutgoingRecipientDate:](self, "setLastOutgoingRecipientDate:", v16);

    -[_CDContactStatistics lastIncomingSenderDate](self, "lastIncomingSenderDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastIncomingSenderDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics lastDate:updatedWith:](self, "lastDate:updatedWith:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics setLastIncomingSenderDate:](self, "setLastIncomingSenderDate:", v19);

    -[_CDContactStatistics lastIncomingRecipientDate](self, "lastIncomingRecipientDate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastIncomingRecipientDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CDContactStatistics lastDate:updatedWith:](self, "lastDate:updatedWith:", v22, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContactStatistics setLastIncomingRecipientDate:](self, "setLastIncomingRecipientDate:", v21);

  }
}

- (unint64_t)interactionCount
{
  return self->_incomingSenderCount + self->_outgoingRecipientCount + self->_incomingRecipientCount;
}

- (id)firstInteractionDate
{
  void *v3;
  void *v4;

  -[_CDContactStatistics firstDate:updatedWith:](self, "firstDate:updatedWith:", self->_firstIncomingSenderDate, self->_firstOutgoingRecipientDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics firstDate:updatedWith:](self, "firstDate:updatedWith:", v3, self->_firstIncomingRecipientDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastInteractionDate
{
  void *v3;
  void *v4;

  -[_CDContactStatistics lastDate:updatedWith:](self, "lastDate:updatedWith:", self->_lastIncomingSenderDate, self->_lastOutgoingRecipientDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics lastDate:updatedWith:](self, "lastDate:updatedWith:", v3, self->_lastIncomingRecipientDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)interactionTimeInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[_CDContactStatistics lastInteractionDate](self, "lastInteractionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContactStatistics firstInteractionDate](self, "firstInteractionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (double)outgoingRecipientTimeInterval
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_lastOutgoingRecipientDate, "timeIntervalSinceDate:", self->_firstOutgoingRecipientDate);
  return result;
}

- (double)incomingSenderTimeInterval
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_lastIncomingSenderDate, "timeIntervalSinceDate:", self->_firstIncomingSenderDate);
  return result;
}

- (double)incomingRecipientTimeInterval
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_lastIncomingRecipientDate, "timeIntervalSinceDate:", self->_firstIncomingRecipientDate);
  return result;
}

- (unint64_t)outgoingRecipientCount
{
  return self->_outgoingRecipientCount;
}

- (void)setOutgoingRecipientCount:(unint64_t)a3
{
  self->_outgoingRecipientCount = a3;
}

- (unint64_t)incomingSenderCount
{
  return self->_incomingSenderCount;
}

- (void)setIncomingSenderCount:(unint64_t)a3
{
  self->_incomingSenderCount = a3;
}

- (unint64_t)incomingRecipientCount
{
  return self->_incomingRecipientCount;
}

- (void)setIncomingRecipientCount:(unint64_t)a3
{
  self->_incomingRecipientCount = a3;
}

- (NSDate)lastOutgoingRecipientDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastOutgoingRecipientDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)lastIncomingSenderDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastIncomingSenderDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)lastIncomingRecipientDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastIncomingRecipientDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)firstOutgoingRecipientDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFirstOutgoingRecipientDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)firstIncomingSenderDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFirstIncomingSenderDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)firstIncomingRecipientDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFirstIncomingRecipientDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstIncomingRecipientDate, 0);
  objc_storeStrong((id *)&self->_firstIncomingSenderDate, 0);
  objc_storeStrong((id *)&self->_firstOutgoingRecipientDate, 0);
  objc_storeStrong((id *)&self->_lastIncomingRecipientDate, 0);
  objc_storeStrong((id *)&self->_lastIncomingSenderDate, 0);
  objc_storeStrong((id *)&self->_lastOutgoingRecipientDate, 0);
}

@end
