@implementation _NSConcreteDateInterval

- (id)endDate
{
  if (self->_duration == 0.0)
    return self->_startDate;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_startDate);
}

- (id)startDate
{
  return objc_getProperty(self, a2, 8, 1);
}

- (double)duration
{
  return self->_duration;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteDateInterval;
  -[_NSConcreteDateInterval dealloc](&v3, sel_dealloc);
}

- (_NSConcreteDateInterval)initWithStartDate:(id)a3 duration:(double)a4
{
  _NSConcreteDateInterval *v6;
  _NSConcreteDateInterval *v8;
  NSString *v9;
  NSString *v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v8 = self;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start date is nil!"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }
  if (a4 < 0.0)
  {
    v8 = self;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Duration is less than 0!"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    v10 = v9;

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
  }
  v11.receiver = self;
  v11.super_class = (Class)_NSConcreteDateInterval;
  v6 = -[NSDateInterval init](&v11, sel_init);
  if (v6)
  {
    v6->_startDate = (NSDate *)objc_msgSend(a3, "copy");
    v6->_duration = a4;
  }
  return v6;
}

- (_NSConcreteDateInterval)initWithStartDate:(id)a3 endDate:(id)a4
{
  _NSConcreteDateInterval *v8;
  double v9;
  NSString *v11;
  NSString *v12;
  void *v13;
  _QWORD *v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start date is nil!"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_9:
    v12 = v11;

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_11;
  }
  if (!a4)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("End date is nil!"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "compare:", a4) == 1)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start date cannot be later in time than end date!"), _NSMethodExceptionProem((objc_class *)self, a2));

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = (_QWORD *)MEMORY[0x1E0C99750];
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *v14, v12, 0));
  }
  v15.receiver = self;
  v15.super_class = (Class)_NSConcreteDateInterval;
  v8 = -[NSDateInterval init](&v15, sel_init);
  if (v8)
  {
    v8->_startDate = (NSDate *)objc_msgSend(a3, "copy");
    objc_msgSend(a4, "timeIntervalSinceDate:", a3);
    v8->_duration = v9;
  }
  return v8;
}

- (_NSConcreteDateInterval)init
{
  return -[_NSConcreteDateInterval initWithStartDate:duration:](self, "initWithStartDate:duration:", objc_msgSend(MEMORY[0x1E0C99D68], "date"), 0.0);
}

@end
