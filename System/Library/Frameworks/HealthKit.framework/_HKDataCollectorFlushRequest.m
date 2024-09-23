@implementation _HKDataCollectorFlushRequest

- (_HKDataCollectorFlushRequest)initWithDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _HKDataCollectorFlushRequest *v8;
  uint64_t v9;
  NSDate *date;
  uint64_t v11;
  id completion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKDataCollectorFlushRequest;
  v8 = -[_HKDataCollectorFlushRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    completion = v8->_completion;
    v8->_completion = (id)v11;

  }
  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
