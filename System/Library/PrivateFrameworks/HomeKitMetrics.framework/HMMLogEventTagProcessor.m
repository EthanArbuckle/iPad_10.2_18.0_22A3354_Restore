@implementation HMMLogEventTagProcessor

- (HMMLogEventTagProcessor)initWithSubmitter:(id)a3
{
  id v5;
  HMMLogEventTagProcessor *v6;
  HMMLogEventTagProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMLogEventTagProcessor;
  v6 = -[HMMLogEventTagProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_submitter, a3);
    v7->_active = 1;
  }

  return v7;
}

- (NSDictionary)tagProcessingBlocks
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)closeForReason:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HMMLogEventTagProcessor setLogEventCloseReason:](self, "setLogEventCloseReason:", a3);
  -[HMMLogEventTagProcessor submitter](self, "submitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMLogEventTagProcessor logEvent](self, "logEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v5);

  self->_active = 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_active)
    -[HMMLogEventTagProcessor closeForReason:](self, "closeForReason:", 1);
  v3.receiver = self;
  v3.super_class = (Class)HMMLogEventTagProcessor;
  -[HMMLogEventTagProcessor dealloc](&v3, sel_dealloc);
}

- (BOOL)isActive
{
  return self->_active;
}

- (int64_t)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(int64_t)a3
{
  self->_lastUpdate = a3;
}

- (HMMLogEvent)logEvent
{
  return self->_logEvent;
}

- (HMMLogEventSubmitting)submitter
{
  return self->_submitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_logEvent, 0);
}

@end
