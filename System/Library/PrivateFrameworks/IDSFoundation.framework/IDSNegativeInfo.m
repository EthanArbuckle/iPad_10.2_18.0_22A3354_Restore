@implementation IDSNegativeInfo

- (IDSNegativeInfo)initWithTime:(double)a3 count:(int64_t)a4
{
  IDSNegativeInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSNegativeInfo;
  result = -[IDSNegativeInfo init](&v7, sel_init);
  if (result)
  {
    result->_time = a3;
    result->_count = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t count;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  count = self->_count;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v6, v7, v8);
  return (id)objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: %p> count: %ld timeInCache: %f"), v9 - self->_time, v4, self, count, v9 - self->_time);
}

- (double)time
{
  return self->_time;
}

- (int64_t)count
{
  return self->_count;
}

@end
