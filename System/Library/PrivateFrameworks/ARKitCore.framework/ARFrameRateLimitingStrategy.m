@implementation ARFrameRateLimitingStrategy

- (ARFrameRateLimitingStrategy)initWithFrameRate:(int64_t)a3
{
  ARFrameRateLimitingStrategy *v4;
  ARFrameRateLimitingStrategy *v5;
  ARCircularArray *v6;
  ARCircularArray *mostRecentTimestamps;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARFrameRateLimitingStrategy;
  v4 = -[ARFrameRateLimitingStrategy init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_frameRate = a3;
    v6 = -[ARCircularArray initWithCapacity:]([ARCircularArray alloc], "initWithCapacity:", 5);
    mostRecentTimestamps = v5->_mostRecentTimestamps;
    v5->_mostRecentTimestamps = v6;

    v5->_mostRecentTimestampsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (BOOL)shouldProcessData:(id)a3
{
  id v4;
  os_unfair_lock_s *p_mostRecentTimestampsLock;
  double v6;
  double v7;
  void *v8;
  int64_t frameRate;
  ARCircularArray *mostRecentTimestamps;
  void *v11;
  ARCircularArray *v12;
  void *v13;
  id v14;
  BOOL v15;
  double v16;
  ARCircularArray *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
    os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_msgSend(v4, "timestamp");
    v7 = v6;
    -[ARCircularArray lastObject](self->_mostRecentTimestamps, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      frameRate = self->_frameRate;
      if (!frameRate)
      {
LABEL_14:
        v15 = 0;
        goto LABEL_15;
      }
      if (frameRate < 0)
        goto LABEL_7;
      mostRecentTimestamps = self->_mostRecentTimestamps;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(mostRecentTimestamps) = -[ARCircularArray containsObject:](mostRecentTimestamps, "containsObject:", v11);

      if ((mostRecentTimestamps & 1) != 0)
        goto LABEL_7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        if (v7 - v16 <= 1.0 / (double)self->_frameRate)
          goto LABEL_14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_14;
        v17 = self->_mostRecentTimestamps;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = -[ARCircularArray containsObject:](v17, "containsObject:", v18);

        if (!(_DWORD)v17)
          goto LABEL_14;
      }
    }
LABEL_7:
    v12 = self->_mostRecentTimestamps;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ARCircularArray addObject:](v12, "addObject:", v13);

    v15 = 1;
LABEL_15:

    os_unfair_lock_unlock(p_mostRecentTimestampsLock);
    goto LABEL_16;
  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)shouldRequestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v5;
  os_unfair_lock_s *p_mostRecentTimestampsLock;
  ARCircularArray *mostRecentTimestamps;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  mostRecentTimestamps = self->_mostRecentTimestamps;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mostRecentTimestamps) = -[ARCircularArray containsObject:](mostRecentTimestamps, "containsObject:", v10);

  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
  return (char)mostRecentTimestamps;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_frameRate == v4[1];

  return v5;
}

- (NSString)description
{
  os_unfair_lock_s *p_mostRecentTimestampsLock;
  void *v4;
  ARCircularArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int64_t frameRate;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_mostRecentTimestamps;
  v6 = -[ARCircularArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[ARCircularArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  frameRate = self->_frameRate;
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@(%p) framerate=%li timestamps=[%@]>"), v12, self, frameRate, v14, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
  return (NSString *)v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentTimestamps, 0);
}

@end
