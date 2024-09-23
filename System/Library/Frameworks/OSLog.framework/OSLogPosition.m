@implementation OSLogPosition

- (OSLogPosition)initWithDate:(id)a3
{
  id v5;
  OSLogPosition *v6;
  OSLogPosition *v7;
  OSLogPosition *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OSLogPosition;
  v6 = -[OSLogPosition init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_precision = 1;
    objc_storeStrong((id *)&v6->_date, a3);
    v8 = v7;
  }

  return v7;
}

- (OSLogPosition)initWithEventSource:(id)a3 timeIntervalSinceEnd:(double)a4
{
  id v6;
  OSLogPosition *v7;
  OSLogPosition *v8;
  void *v9;
  uint64_t v10;
  NSDate *date;
  OSLogPosition *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OSLogPosition;
  v7 = -[OSLogPosition init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_precision = 1;
    objc_msgSend(v6, "newestDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    date = v8->_date;
    v8->_date = (NSDate *)v10;

    v12 = v8;
  }

  return v8;
}

- (OSLogPosition)initWithTimeIntervalSinceLatestBoot:(double)a3
{
  OSLogPosition *v4;
  OSLogPosition *v5;
  OSLogPosition *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSLogPosition;
  v4 = -[OSLogPosition init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_precision = 2;
    v4->_offset = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)precision
{
  return self->_precision;
}

- (NSDate)date
{
  return self->_date;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
