@implementation _ATXDisplayOnInterval

- (_ATXDisplayOnInterval)initWithOnInterval:(id)a3
{
  id v5;
  _ATXDisplayOnInterval *v6;
  _ATXDisplayOnInterval *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXDisplayOnInterval;
  v6 = -[_ATXDisplayOnInterval init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_onInterval, a3);

  return v7;
}

- (id)prettyRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("EMMMd HH:mm ss ZZZZ"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDateFormat:", v6);
  -[NSDateInterval startDate](self->_onInterval, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateInterval endDate](self->_onInterval, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateInterval duration](self->_onInterval, "duration");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f seconds: (%@, %@)"), v11, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)eventTime
{
  return -[NSDateInterval startDate](self->_onInterval, "startDate");
}

- (NSDateInterval)onInterval
{
  return self->_onInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onInterval, 0);
}

@end
