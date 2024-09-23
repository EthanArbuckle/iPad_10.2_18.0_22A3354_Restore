@implementation HDIDSMessageOptions

- (HDIDSMessageOptions)initWithPriority:(unint64_t)a3 timeoutInterval:(double)a4
{
  HDIDSMessageOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDIDSMessageOptions;
  result = -[HDIDSMessageOptions init](&v7, sel_init);
  if (result)
  {
    result->_priority = a3;
    result->_timeoutInterval = a4;
  }
  return result;
}

+ (id)defaultOptionsWithPriority:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPriority:timeoutInterval:", a3, 0.0);
}

+ (double)HDIDSMessageOptionsMaxMessageTimeout
{
  return *MEMORY[0x1E0D348E0];
}

- (BOOL)isEqual:(id)a3
{
  HDIDSMessageOptions *v4;
  BOOL v5;

  v4 = (HDIDSMessageOptions *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_priority == v4->_priority
      && self->_timeoutInterval == v4->_timeoutInterval;
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t priority;
  void *v3;
  unint64_t v4;

  priority = self->_priority;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeoutInterval);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") ^ priority;

  return v4;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

@end
