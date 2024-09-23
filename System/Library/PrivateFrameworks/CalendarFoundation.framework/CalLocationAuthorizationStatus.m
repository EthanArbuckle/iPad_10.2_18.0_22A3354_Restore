@implementation CalLocationAuthorizationStatus

- (CalLocationAuthorizationStatus)initWithStatus:(int)a3 precision:(unint64_t)a4
{
  CalLocationAuthorizationStatus *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalLocationAuthorizationStatus;
  result = -[CalLocationAuthorizationStatus init](&v7, sel_init);
  if (result)
  {
    result->_status = a3;
    result->_precision = a4;
  }
  return result;
}

- (int)status
{
  return self->_status;
}

- (unint64_t)precision
{
  return self->_precision;
}

@end
