@implementation BSRelativeDateTimerFireInfo

- (BSRelativeDateTimerFireInfo)initWithValue:(unint64_t)a3 resolution:(unint64_t)a4 comparedToNow:(int64_t)a5 fireDate:(id)a6
{
  id v10;
  BSRelativeDateTimerFireInfo *v11;
  BSRelativeDateTimerFireInfo *v12;
  uint64_t v13;
  NSDate *fireDate;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BSRelativeDateTimerFireInfo;
  v11 = -[BSRelativeDateTimerFireInfo init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_value = a3;
    v11->_resolution = a4;
    v11->_comparedToNow = a5;
    v13 = objc_msgSend(v10, "copy");
    fireDate = v12->_fireDate;
    v12->_fireDate = (NSDate *)v13;

  }
  return v12;
}

- (unint64_t)value
{
  return self->_value;
}

- (unint64_t)resolution
{
  return self->_resolution;
}

- (int64_t)comparedToNow
{
  return self->_comparedToNow;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
}

@end
