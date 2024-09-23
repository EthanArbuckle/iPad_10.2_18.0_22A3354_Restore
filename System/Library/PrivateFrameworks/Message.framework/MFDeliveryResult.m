@implementation MFDeliveryResult

- (MFDeliveryResult)initWithStatus:(int64_t)a3
{
  MFDeliveryResult *v4;
  MFDeliveryResult *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFDeliveryResult;
  v4 = -[MFDeliveryResult init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_status = a3;
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isWifi = objc_msgSend(v6, "isFatPipe");

  }
  return v5;
}

- (id)description
{
  unint64_t status;
  const __CFString *v3;

  status = self->_status;
  if (status > 9)
    v3 = CFSTR("EMMessageDeliveryStatusFatalError");
  else
    v3 = off_1E4E8C038[status];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("status: %@, duration:%f, bytesSent: %d, isWifi: %d"), v3, *(_QWORD *)&self->_duration, self->_bytesSent, self->_isWifi);
  return (id)objc_claimAutoreleasedReturnValue();
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
