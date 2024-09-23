@implementation FAFamilyCircleCacheResponse

- (FAFamilyCircleCacheResponse)initWithFamilyCircle:(id)a3 serverTag:(id)a4 cacheDate:(id)a5 maxAge:(double)a6
{
  id v11;
  id v12;
  id v13;
  FAFamilyCircleCacheResponse *v14;
  FAFamilyCircleCacheResponse *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FAFamilyCircleCacheResponse;
  v14 = -[FAFamilyCircleCacheResponse init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_familyCircle, a3);
    objc_storeStrong((id *)&v15->_cacheDate, a5);
    v15->_maxAge = a6;
    objc_storeStrong((id *)&v15->_serverTag, a4);
  }

  return v15;
}

- (id)familyCircleIfFresh
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleCacheResponse familyCircleValidatingAgeWithDate:](self, "familyCircleValidatingAgeWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)familyCircleValidatingAgeWithDate:(id)a3
{
  void *v4;

  if (-[FAFamilyCircleCacheResponse _isFamilyCircleFresh:](self, "_isFamilyCircleFresh:", a3))
  {
    -[FAFamilyCircleCacheResponse familyCircle](self, "familyCircle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isFamilyCircleFresh
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FAFamilyCircleCacheResponse _isFamilyCircleFresh:](self, "_isFamilyCircleFresh:", v3);

  return (char)self;
}

- (NSDate)expiration
{
  void *v3;
  void *v4;

  -[FAFamilyCircleCacheResponse cacheDate](self, "cacheDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleCacheResponse maxAge](self, "maxAge");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)_isFamilyCircleFresh:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[FAFamilyCircleCacheResponse expiration](self, "expiration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6 != 1;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
}

- (NSDate)cacheDate
{
  return self->_cacheDate;
}

- (void)setCacheDate:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDate, a3);
}

- (double)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (NSString)serverTag
{
  return self->_serverTag;
}

- (void)setServerTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTag, 0);
  objc_storeStrong((id *)&self->_cacheDate, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

@end
