@implementation HDDatabaseTransactionStatistics

- (id)_initWithStartTime:(double)a3 endTime:(double)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDatabaseTransactionStatistics;
  result = -[HDDatabaseTransactionStatistics init](&v7, sel_init);
  if (result)
  {
    *((double *)result + 1) = a3;
    *((double *)result + 2) = a4;
  }
  return result;
}

- (double)duration
{
  return self->_endTime - self->_startTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

@end
