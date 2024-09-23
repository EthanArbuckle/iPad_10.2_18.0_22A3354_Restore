@implementation HMDUserPushCache

- (HMDUserPushCache)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDUserPushCache)initWithDevice:(id)a3
{
  id v5;
  HMDUserPushCache *v6;
  HMDUserPushCache *v7;
  uint64_t v8;
  NSDate *expirationDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDUserPushCache;
  v6 = -[HMDUserPushCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)userPushCacheTimeInterval);
    v8 = objc_claimAutoreleasedReturnValue();
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v8;

  }
  return v7;
}

- (BOOL)isExpired
{
  void *v2;
  double v3;
  BOOL v4;

  -[HMDUserPushCache expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 < 0.0;

  return v4;
}

- (HMDDevice)device
{
  return self->_device;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
