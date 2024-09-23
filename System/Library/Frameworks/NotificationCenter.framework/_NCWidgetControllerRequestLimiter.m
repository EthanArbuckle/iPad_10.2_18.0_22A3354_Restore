@implementation _NCWidgetControllerRequestLimiter

- (BOOL)isRequestPermitted
{
  NSDate *v3;
  NSDate *lastRequestDate;
  NSDate **p_lastRequestDate;
  double v6;
  BOOL v8;
  int64_t requestCount;
  _BOOL4 isThrottled;
  BOOL v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  NSDate *v15;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  p_lastRequestDate = &self->_lastRequestDate;
  lastRequestDate = self->_lastRequestDate;
  if (!lastRequestDate)
  {
    objc_storeStrong((id *)&self->_lastRequestDate, v3);
    lastRequestDate = *p_lastRequestDate;
  }
  -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", lastRequestDate);
  if (v6 <= 1.0)
  {
    requestCount = self->_requestCount;
    self->_requestCount = requestCount + 1;
    isThrottled = self->_isThrottled;
    v11 = self->_isThrottled;
    v12 = 10;
    if (self->_isThrottled)
      v12 = 2;
    v8 = requestCount < v12;
    if (requestCount >= v12)
      v11 = 1;
    self->_isThrottled = v11;
    if (!isThrottled && requestCount >= v12)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Too many %@ requests per second - throttling."), v14);

      v8 = 0;
    }
  }
  else
  {
    self->_requestCount = 0;
    if (v6 > 5.0 && self->_isThrottled)
      self->_isThrottled = 0;
    v8 = 1;
  }
  v15 = *p_lastRequestDate;
  *p_lastRequestDate = v3;

  return v8;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51___NCWidgetControllerRequestLimiter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
}

@end
