@implementation MURealTimeEVCharger

- (MURealTimeEVCharger)initWithAvailable:(unint64_t)a3 total:(unint64_t)a4 status:(int)a5
{
  MURealTimeEVCharger *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MURealTimeEVCharger;
  result = -[MURealTimeEVCharger init](&v9, sel_init);
  if (result)
  {
    result->_status = a5;
    result->_total = a4;
    result->_available = a3;
  }
  return result;
}

- (int)status
{
  return self->_status;
}

- (unint64_t)available
{
  return self->_available;
}

- (unint64_t)total
{
  return self->_total;
}

@end
