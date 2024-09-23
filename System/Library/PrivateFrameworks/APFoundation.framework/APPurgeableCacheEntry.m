@implementation APPurgeableCacheEntry

- (APPurgeableCacheObjectP)object
{
  return self->_object;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (APPurgeableCacheEntry)initWithObject:(id)a3
{
  id v5;
  APPurgeableCacheEntry *v6;
  APPurgeableCacheEntry *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APPurgeableCacheEntry;
  v6 = -[APPurgeableCacheEntry init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_object, a3);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14);
    v7->_timestamp = v15;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

@end
