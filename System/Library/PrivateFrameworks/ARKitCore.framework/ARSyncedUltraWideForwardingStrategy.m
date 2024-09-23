@implementation ARSyncedUltraWideForwardingStrategy

- (ARSyncedUltraWideForwardingStrategy)initWithMaxFrameRate:(int64_t)a3
{
  ARSyncedUltraWideForwardingStrategy *v4;
  ARCircularArray *v5;
  ARCircularArray *mostRecentTimestamps;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARSyncedUltraWideForwardingStrategy;
  v4 = -[ARSyncedUltraWideForwardingStrategy init](&v8, sel_init);
  if (v4)
  {
    v5 = -[ARCircularArray initWithCapacity:]([ARCircularArray alloc], "initWithCapacity:", 5);
    mostRecentTimestamps = v4->_mostRecentTimestamps;
    v4->_mostRecentTimestamps = v5;

    v4->_mostRecentTimestampsLock._os_unfair_lock_opaque = 0;
    v4->_maxFrameRate = a3;
  }
  return v4;
}

- (BOOL)shouldProcessData:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_mostRecentTimestampsLock;
  BOOL v10;
  void *v11;
  ARCircularArray *mostRecentTimestamps;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 1;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "latestUltraWideImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
      os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
      v10 = +[ARSyncedUltraWideForwardingStrategy frameRateLimitAllowsProcessingThisData:mostRecentTimestamps:maxFrameRate:](ARSyncedUltraWideForwardingStrategy, "frameRateLimitAllowsProcessingThisData:mostRecentTimestamps:maxFrameRate:", v7, self->_mostRecentTimestamps, self->_maxFrameRate);
      if (v10)
        goto LABEL_9;
      goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "latestResizedUltraWideImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_11;
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  v10 = +[ARSyncedUltraWideForwardingStrategy frameRateLimitAllowsProcessingThisData:mostRecentTimestamps:maxFrameRate:](ARSyncedUltraWideForwardingStrategy, "frameRateLimitAllowsProcessingThisData:mostRecentTimestamps:maxFrameRate:", v7, self->_mostRecentTimestamps, self->_maxFrameRate);
  if (v10)
  {
LABEL_9:
    mostRecentTimestamps = self->_mostRecentTimestamps;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ARCircularArray addObject:](mostRecentTimestamps, "addObject:", v14);

  }
LABEL_10:
  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
LABEL_12:

LABEL_14:
  return v10;
}

+ (BOOL)frameRateLimitAllowsProcessingThisData:(id)a3 mostRecentTimestamps:(id)a4 maxFrameRate:(int64_t)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  double v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(a5) = 1;
      goto LABEL_10;
    }
  }
  objc_opt_class();
  objc_opt_isKindOfClass();
  objc_msgSend(v7, "timestamp");
  v10 = v9;
  objc_msgSend(v8, "lastObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a5 < 0)
  {
LABEL_7:
    LOBYTE(a5) = 1;
    goto LABEL_8;
  }
  if (a5)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "containsObject:", v13);

      if ((v14 & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "doubleValue");
          LOBYTE(a5) = v10 - v16 > 1.0 / (double)a5;
          goto LABEL_8;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(a5) = objc_msgSend(v8, "containsObject:", v17);

          goto LABEL_8;
        }
      }
    }
    goto LABEL_7;
  }
LABEL_8:

LABEL_10:
  return a5;
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

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@(%p)>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentTimestamps, 0);
}

@end
