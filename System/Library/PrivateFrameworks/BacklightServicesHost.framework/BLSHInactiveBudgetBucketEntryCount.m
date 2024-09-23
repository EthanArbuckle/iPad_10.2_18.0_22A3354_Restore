@implementation BLSHInactiveBudgetBucketEntryCount

- (BLSHInactiveBudgetBucketEntryCount)init
{
  BLSHInactiveBudgetBucketEntryCount *v2;
  NSDate *v3;
  NSDate *lastEntryFinalDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLSHInactiveBudgetBucketEntryCount;
  v2 = -[BLSHInactiveBudgetBucketEntryCount init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastEntryFinalDate = v2->_lastEntryFinalDate;
    v2->_lastEntryFinalDate = v3;

    objc_storeStrong((id *)&v2->_lastEntryInitialDate, v3);
  }
  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_count, CFSTR("count"));
  -[NSDate bls_shortLoggingString](self->_lastEntryInitialDate, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("lastEntry"));

  if (!-[NSDate isEqualToDate:](self->_lastEntryInitialDate, "isEqualToDate:", self->_lastEntryFinalDate))
  {
    -[NSDate bls_shortLoggingString](self->_lastEntryFinalDate, "bls_shortLoggingString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v6, CFSTR("lastEntryEnd"));

  }
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_secondsFidelity, CFSTR("isSecondsFidelity"), 1);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)countSpecifier:(id)a3 hasSecondsBudget:(BOOL)a4 isCoalesceAllowed:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  NSDate **p_lastEntryFinalDate;
  NSDate *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSDate *v17;
  NSDate *lastEntryInitialDate;
  NSDate *v19;
  NSDate *lastEntryFinalDate;
  int count;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fidelity");

  if (v10 < 2)
  {
    if (v5
      && (objc_msgSend(v9, "timeIntervalSinceDate:", self->_lastEntryInitialDate),
          v15 = fabs(v14),
          objc_msgSend(MEMORY[0x24BE0B8F0], "animationCoalesceThreshold"),
          v15 < v16))
    {
      objc_msgSend(v9, "earlierDate:", self->_lastEntryInitialDate);
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastEntryInitialDate = self->_lastEntryInitialDate;
      self->_lastEntryInitialDate = v17;

      objc_msgSend(v9, "laterDate:", self->_lastEntryFinalDate);
      v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastEntryFinalDate = self->_lastEntryFinalDate;
      self->_lastEntryFinalDate = v19;

      LOBYTE(v6) = 1;
    }
    else if (v6 || self->_count <= 2)
    {
      if (-[NSDate compare:](self->_lastEntryFinalDate, "compare:", v9) == NSOrderedAscending)
      {
        objc_storeStrong((id *)&self->_lastEntryFinalDate, v9);
        objc_storeStrong((id *)&self->_lastEntryInitialDate, v9);
      }
      count = self->_count;
      self->_count = count + 1;
      LOBYTE(v6) = 1;
      if (count >= 3)
        self->_secondsFidelity = 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else if (v6)
  {
    v12 = self->_lastEntryFinalDate;
    p_lastEntryFinalDate = &self->_lastEntryFinalDate;
    LOBYTE(v6) = 1;
    *((_BYTE *)p_lastEntryFinalDate - 16) = 1;
    objc_msgSend(v9, "laterDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_lastEntryFinalDate, v13);
    objc_storeStrong((id *)p_lastEntryFinalDate - 1, v13);
    ++*((_DWORD *)p_lastEntryFinalDate - 3);
    v9 = v13;
  }

  return v6;
}

- (double)timeIntervalFromLastEntryToDate:(id)a3
{
  double result;

  objc_msgSend(a3, "timeIntervalSinceDate:", self->_lastEntryFinalDate);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BLSHInactiveBudgetBucketEntryCount *v4;

  v4 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
  objc_storeStrong((id *)&v4->_lastEntryInitialDate, self->_lastEntryInitialDate);
  objc_storeStrong((id *)&v4->_lastEntryFinalDate, self->_lastEntryFinalDate);
  v4->_count = self->_count;
  v4->_secondsFidelity = self->_secondsFidelity;
  return v4;
}

- (int)count
{
  return self->_count;
}

- (BOOL)isSecondsFidelity
{
  return self->_secondsFidelity;
}

- (NSDate)lastEntryInitialDate
{
  return self->_lastEntryInitialDate;
}

- (NSDate)lastEntryFinalDate
{
  return self->_lastEntryFinalDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntryFinalDate, 0);
  objc_storeStrong((id *)&self->_lastEntryInitialDate, 0);
}

@end
