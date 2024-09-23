@implementation MFDeliveryResult

- (MFDeliveryResult)initWithStatus:(int64_t)a3
{
  MFDeliveryResult *v4;
  MFDeliveryResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFDeliveryResult;
  v4 = -[MFDeliveryResult init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_status = a3;
    v4->_isWifi = -[MFNetworkController isFatPipe](+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"), "isFatPipe");
  }
  return v5;
}

- (id)description
{
  unint64_t status;
  const __CFString *v3;

  status = self->_status;
  if (status > 8)
    v3 = CFSTR("MessageDeliveryFatalError");
  else
    v3 = off_1E81CB058[status];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("status: %@, duration:%f, bytesSent: %d, isWifi: %d"), v3, *(_QWORD *)&self->_duration, self->_bytesSent, self->_isWifi);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (BOOL)isWifi
{
  return self->_isWifi;
}

- (void)setIsWifi:(BOOL)a3
{
  self->_isWifi = a3;
}

- (int64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(int64_t)a3
{
  self->_attributes = a3;
}

@end
