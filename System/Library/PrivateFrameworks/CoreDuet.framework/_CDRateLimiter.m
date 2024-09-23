@implementation _CDRateLimiter

- (BOOL)debited
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25___CDRateLimiter_debited__block_invoke;
  v5[3] = &unk_1E26E4A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_CDRateLimiter)initWithCount:(int64_t)a3 perPeriod:(double)a4
{
  _CDRateLimiter *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSDate *lastRecorded;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_CDRateLimiter;
  v6 = -[_CDRateLimiter init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.duet.ratelimiter", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_period = a4;
    v6->_count = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = objc_claimAutoreleasedReturnValue();
    lastRecorded = v6->_lastRecorded;
    v6->_lastRecorded = (NSDate *)v9;

    v6->_balance = 0;
  }
  return v6;
}

- (void)recordTimeAndRefillIfNeeded
{
  double v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSDate timeIntervalSinceNow](self->_lastRecorded, "timeIntervalSinceNow");
  if (fabs(v3) > self->_period)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_CDRateLimiter resetRateLimitWithTimeStamp:](self, "resetRateLimitWithTimeStamp:", v4);

  }
}

- (void)resetRateLimitWithTimeStamp:(id)a3
{
  NSDate *v4;
  NSDate *lastRecorded;

  v4 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lastRecorded = self->_lastRecorded;
  self->_lastRecorded = v4;

  self->_balance = 0;
}

+ (id)sharedRateLimiter
{
  if (sharedRateLimiter_onceToken != -1)
    dispatch_once(&sharedRateLimiter_onceToken, &__block_literal_global_79);
  return (id)sharedRateLimiter__sharedRateLimiter;
}

- (_CDRateLimiter)init
{
  return -[_CDRateLimiter initWithCount:perPeriod:](self, "initWithCount:perPeriod:", 30, 60.0);
}

- (BOOL)credit
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24___CDRateLimiter_credit__block_invoke;
  block[3] = &unk_1E26E2F20;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDRateLimiter period](self, "period");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { period=%f, count=%ld }"), v5, v6, -[_CDRateLimiter count](self, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (double)period
{
  return self->_period;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastRecorded, 0);
}

@end
