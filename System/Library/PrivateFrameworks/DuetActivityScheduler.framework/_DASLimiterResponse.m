@implementation _DASLimiterResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASLimiterResponse)initWithDecision:(unint64_t)a3 withLimiter:(id)a4 validityDuration:(double)a5 rationale:(id)a6
{
  id v11;
  id v12;
  _DASLimiterResponse *v13;
  _DASLimiterResponse *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_DASLimiterResponse;
  v13 = -[_DASLimiterResponse init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_decision = a3;
    objc_storeStrong((id *)&v13->_limiterName, a4);
    v14->_validityDuration = a5;
    if (v12)
      objc_storeStrong((id *)&v14->_rationale, a6);
  }

  return v14;
}

+ (id)limitResponseWithDecision:(unint64_t)a3 withLimiter:(id)a4 validityDuration:(double)a5 rationale:(id)a6
{
  id v9;
  id v10;
  _DASLimiterResponse *v11;

  v9 = a6;
  v10 = a4;
  v11 = -[_DASLimiterResponse initWithDecision:withLimiter:validityDuration:rationale:]([_DASLimiterResponse alloc], "initWithDecision:withLimiter:validityDuration:rationale:", a3, v10, v9, a5);

  return v11;
}

+ (BOOL)queryActivityDecision:(unint64_t)a3 fromResponses:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "decision", (_QWORD)v14) == a3)
          {
            v12 = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)updateActivity:(id)a3 withLimitResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = a3;
  objc_msgSend(v5, "limitationResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "limitationResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v11);
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v5, "setLimitationResponse:", v10);

    v5 = v8;
  }
  else
  {
    v7 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v5, "setLimitationResponse:", v7);
  }

}

+ (unint64_t)bitmaskFromResponses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "limiterName", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = +[_DASLimitsUtilities bitmaskForLimitationName:](_DASLimitsUtilities, "bitmaskForLimitationName:", v10);

          v7 |= v11 & ~(v11 >> 63);
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
      v6 = v7;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t v2;
  const __CFString *v3;
  double validityDuration;
  NSString *rationale;
  NSString *limiterName;
  uint64_t v8;

  v2 = self->_decision - 1;
  if (v2 > 4)
    v3 = CFSTR("None");
  else
    v3 = off_1E624B980[v2];
  validityDuration = self->_validityDuration;
  rationale = self->_rationale;
  limiterName = self->_limiterName;
  if (validityDuration == 0.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Limiter Decision: '%@' Rationale: '%@'"), limiterName, v3, rationale, v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Limiter Decision: '%@' Rationale: '%@' Duration: '%f mins'"), limiterName, v3, rationale, validityDuration / 60.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  _DASLimiterResponse *v4;
  _DASLimiterResponse *v5;
  unint64_t decision;
  NSString *rationale;
  void *v8;
  double validityDuration;
  double v10;
  NSString *limiterName;
  void *v12;
  char v13;

  v4 = (_DASLimiterResponse *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      decision = self->_decision;
      if (decision == -[_DASLimiterResponse decision](v5, "decision"))
      {
        rationale = self->_rationale;
        -[_DASLimiterResponse rationale](v5, "rationale");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](rationale, "isEqualToString:", v8)
          && (validityDuration = self->_validityDuration,
              -[_DASLimiterResponse validityDuration](v5, "validityDuration"),
              validityDuration == v10))
        {
          limiterName = self->_limiterName;
          -[_DASLimiterResponse limiterName](v5, "limiterName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSString isEqualToString:](limiterName, "isEqualToString:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t decision;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  decision = self->_decision;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", decision);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("decision"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_rationale, CFSTR("rationale"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_validityDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("validityDuration"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_limiterName, CFSTR("limiterName"));
}

- (_DASLimiterResponse)initWithCoder:(id)a3
{
  id v4;
  _DASLimiterResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _DASLimiterResponse *v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DASLimiterResponse;
  v5 = -[_DASLimiterResponse init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("decision"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rationale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limiterName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validityDuration"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = 0;
    if (v6 && v9 && v7 && v8)
    {
      v5->_decision = objc_msgSend(v6, "unsignedIntValue");
      objc_msgSend(v10, "doubleValue");
      v5->_validityDuration = v12;
      objc_storeStrong((id *)&v5->_rationale, v7);
      objc_storeStrong((id *)&v5->_limiterName, v8);
      v11 = v5;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)decision
{
  return self->_decision;
}

- (NSString)rationale
{
  return self->_rationale;
}

- (void)setRationale:(id)a3
{
  objc_storeStrong((id *)&self->_rationale, a3);
}

- (NSString)limiterName
{
  return self->_limiterName;
}

- (double)validityDuration
{
  return self->_validityDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limiterName, 0);
  objc_storeStrong((id *)&self->_rationale, 0);
}

@end
