@implementation MSPBTimerContext

- (MSPBTimerContext)init
{
  MSPBTimerContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSPBTimerContext;
  result = -[MSPBTimerContext init](&v3, sel_init);
  if (result)
    result->_isValid = 1;
  return result;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

+ (id)contextWithDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setDate:", v4);

  return v5;
}

@end
