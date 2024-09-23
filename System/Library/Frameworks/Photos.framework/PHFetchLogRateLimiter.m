@implementation PHFetchLogRateLimiter

- (unsigned)rateLimitedLogLevelForLogForLevel:(unsigned __int8)a3
{
  if (a3 == 16)
    return -[PHFetchLogRateLimiter rateLimitedLogForErrorLog](self, "rateLimitedLogForErrorLog");
  if (a3 == 17)
    return -[PHFetchLogRateLimiter rateLimitedLogForFaultLog](self, "rateLimitedLogForFaultLog");
  return a3;
}

+ (PHFetchLogRateLimiter)sharedRateLimiter
{
  pl_dispatch_once();
  return (PHFetchLogRateLimiter *)(id)sharedRateLimiter_pl_once_object_17;
}

void __42__PHFetchLogRateLimiter_sharedRateLimiter__block_invoke()
{
  PHFetchLogRateLimiter *v0;
  void *v1;

  v0 = objc_alloc_init(PHFetchLogRateLimiter);
  v1 = (void *)sharedRateLimiter_pl_once_object_17;
  sharedRateLimiter_pl_once_object_17 = (uint64_t)v0;

}

- (PHFetchLogRateLimiter)init
{
  PHFetchLogRateLimiter *v2;
  uint64_t v3;
  PFTokenBucket *faultTokenBucket;
  uint64_t v5;
  PFTokenBucket *errorTokenBucket;
  uint64_t v7;
  PFTokenBucket *defaultTokenBucket;
  PHFetchLogRateLimiter *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHFetchLogRateLimiter;
  v2 = -[PHFetchLogRateLimiter init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71090]), "initWithName:capacity:refillPeriod:", CFSTR("fetch log fault"), 5, 300);
    faultTokenBucket = v2->_faultTokenBucket;
    v2->_faultTokenBucket = (PFTokenBucket *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71090]), "initWithName:capacity:refillPeriod:", CFSTR("fetch log error"), 20, 60);
    errorTokenBucket = v2->_errorTokenBucket;
    v2->_errorTokenBucket = (PFTokenBucket *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71090]), "initWithName:capacity:refillRate:", CFSTR("fetch log default"), 40, 1);
    defaultTokenBucket = v2->_defaultTokenBucket;
    v2->_defaultTokenBucket = (PFTokenBucket *)v7;

    v9 = v2;
  }

  return v2;
}

- (unsigned)rateLimitedLogForFaultLog
{
  if ((-[PFTokenBucket removeToken](self->_faultTokenBucket, "removeToken") & 1) != 0)
    return 17;
  else
    return -[PHFetchLogRateLimiter rateLimitedLogForErrorLog](self, "rateLimitedLogForErrorLog");
}

- (unsigned)rateLimitedLogForErrorLog
{
  if ((-[PFTokenBucket removeToken](self->_errorTokenBucket, "removeToken") & 1) != 0)
    return 16;
  else
    return -[PHFetchLogRateLimiter rateLimitedLogForDefaultLog](self, "rateLimitedLogForDefaultLog");
}

- (unsigned)rateLimitedLogForDefaultLog
{
  return -[PFTokenBucket removeToken](self->_defaultTokenBucket, "removeToken") ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTokenBucket, 0);
  objc_storeStrong((id *)&self->_errorTokenBucket, 0);
  objc_storeStrong((id *)&self->_faultTokenBucket, 0);
}

@end
