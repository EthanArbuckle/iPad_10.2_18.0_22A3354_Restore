@implementation AVVCAlertInformation

- (AVVCAlertInformation)initWithAlertType:(int)a3 mode:(int64_t)a4 endTime:(unint64_t)a5
{
  AVVCAlertInformation *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVVCAlertInformation;
  result = -[AVVCAlertInformation init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_mode = a4;
    result->_alertEndTime = a5;
  }
  return result;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)alertEndTime
{
  return self->_alertEndTime;
}

- (void)setAlertEndTime:(unint64_t)a3
{
  self->_alertEndTime = a3;
}

@end
