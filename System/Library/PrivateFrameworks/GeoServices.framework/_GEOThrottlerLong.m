@implementation _GEOThrottlerLong

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (double)timeUntilReset
{
  double v3;
  double v4;
  double timeWindow;
  double v6;
  BOOL v7;
  double result;

  GEOGetMonotonicTime();
  v4 = v3 - self->_lastResetTime;
  timeWindow = self->_timeWindow;
  v6 = timeWindow - v4;
  v7 = v4 < timeWindow;
  result = 0.0;
  if (v7)
    return v6;
  return result;
}

+ (BOOL)stateIsExpired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expires"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastReset"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        GEOGetMonotonicTime();
        v7 = v6;
        objc_msgSend(v4, "doubleValue");
        v9 = v8;
        objc_msgSend(v5, "doubleValue");
        v11 = v7 < v10 || v7 > v9;
      }
      else
      {
        v11 = 1;
      }

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (unint64_t)remainingEntries
{
  double v3;
  unsigned int maxRequestCount;

  GEOGetMonotonicTime();
  maxRequestCount = self->_maxRequestCount;
  if (v3 - self->_lastResetTime <= self->_timeWindow)
    maxRequestCount -= self->_currentRequestCount;
  return maxRequestCount;
}

- (BOOL)addRequestTimestamp
{
  double v3;
  unsigned int v4;
  BOOL result;
  unsigned int currentRequestCount;

  if (!self->_maxRequestCount)
    return 1;
  GEOGetMonotonicTime();
  if (v3 - self->_lastResetTime > self->_timeWindow)
  {
    self->_lastResetTime = v3;
    v4 = 1;
LABEL_8:
    self->_currentRequestCount = v4;
    result = 1;
    goto LABEL_9;
  }
  currentRequestCount = self->_currentRequestCount;
  if (self->_maxRequestCount != currentRequestCount)
  {
    v4 = currentRequestCount + 1;
    goto LABEL_8;
  }
  result = 0;
LABEL_9:
  self->_lastUseTime = v3;
  return result;
}

- (id)captureState
{
  double v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (self->_timeWindow < 600.0
    || (-[_GEOThrottlerLong timeUntilReset](self, "timeUntilReset"), v3 <= 0.0)
    || -[_GEOThrottlerLong isExpired](self, "isExpired"))
  {
    v4 = 0;
  }
  else
  {
    v11[0] = &unk_1E1E812C8;
    v10[0] = CFSTR("type");
    v10[1] = CFSTR("lastReset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastResetTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("currentCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentRequestCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    v10[3] = CFSTR("expires");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_GEOThrottlerLong expiresAt](self, "expiresAt");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isExpired
{
  double v3;
  double v4;
  double v5;

  GEOGetMonotonicTime();
  v4 = v3;
  -[_GEOThrottlerLong expiresAt](self, "expiresAt");
  return v4 > v5;
}

- (double)expiresAt
{
  return self->_lastUseTime + self->_timeWindow * 1.5;
}

- (_GEOThrottlerLong)initWithKeyPath:(id)a3 requestCount:(unint64_t)a4 interval:(double)a5 savedState:(id)a6
{
  unsigned int v8;
  id v10;
  id v11;
  _GEOThrottlerLong *v12;
  uint64_t v13;
  NSString *keyPath;
  double v15;
  objc_super v17;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_GEOThrottlerLong;
  v12 = -[_GEOThrottlerLong init](&v17, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    v12->_maxRequestCount = v8;
    v12->_timeWindow = a5;
    v12->_currentRequestCount = 0;
    GEOGetMonotonicTime();
    v12->_lastResetTime = v15;
    -[_GEOThrottlerLong loadState:](v12, "loadState:", v11);
  }

  return v12;
}

- (void)loadState:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int maxRequestCount;
  double v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "stateIsExpired:", v9) & 1) == 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("currentCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lastReset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(v4, "unsignedIntValue");
        maxRequestCount = self->_maxRequestCount;
        if (v6 < maxRequestCount)
          maxRequestCount = objc_msgSend(v4, "unsignedIntValue");
        self->_currentRequestCount = maxRequestCount;
        objc_msgSend(v5, "doubleValue");
        self->_lastResetTime = v8;
      }
    }

  }
}

- (unsigned)maxReqCount
{
  return self->_maxRequestCount;
}

- (id)userInfoForError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("maxRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxRequestCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("windowSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeWindow);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("timeUntilReset");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[_GEOThrottlerLong timeUntilReset](self, "timeUntilReset");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v10[3] = CFSTR("long");
  v9[3] = CFSTR("intervalType");
  v9[4] = CFSTR("throttler.keyPath");
  v10[4] = self->_keyPath;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" interval: %fs"), *(_QWORD *)&self->_timeWindow);
  objc_msgSend(v3, "appendFormat:", CFSTR(" max count: %d"), self->_maxRequestCount);
  GEOGetMonotonicTime();
  objc_msgSend(v3, "appendFormat:", CFSTR(" age: %fs"), v4 - self->_lastResetTime);
  objc_msgSend(v3, "appendFormat:", CFSTR(" count: %d"), self->_currentRequestCount);
  return (NSString *)v3;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)timeWindow
{
  return self->_timeWindow;
}

@end
