@implementation MBBackgroundRestoreProgressUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBBackgroundRestoreProgressUpdate)initWithCoder:(id)a3
{
  MBBackgroundRestoreProgressUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBBackgroundRestoreProgressUpdate;
  v4 = -[MBBackgroundRestoreProgressUpdate init](&v6, sel_init);
  if (v4)
  {
    v4->_isThermallyThrottled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isThermallyThrottled"));
    v4->_hasCellularPolicy = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("hasCellularPolicy"));
    v4->_estimatedSize = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("estimatedSize"));
    v4->_isOnWiFi = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isOnWiFi"));
    v4->_isOnInexpensiveCellular = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isOnInExpensiveCellular"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_isThermallyThrottled, CFSTR("isThermallyThrottled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_hasCellularPolicy, CFSTR("hasCellularPolicy"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_estimatedSize, CFSTR("estimatedSize"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isOnWiFi, CFSTR("isOnWiFi"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isOnInexpensiveCellular, CFSTR("isOnInExpensiveCellular"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: isThermallyThrottled=%d, hasCellularPolicy=%d, estimatedSize=%llu isOnWifi=%d isOnInexpensiveCellular=%d>"), objc_opt_class(), self->_isThermallyThrottled, self->_hasCellularPolicy, self->_estimatedSize, self->_isOnWiFi, self->_isOnInexpensiveCellular);
}

- (BOOL)isThermallyThrottled
{
  return self->_isThermallyThrottled;
}

- (void)setIsThermallyThrottled:(BOOL)a3
{
  self->_isThermallyThrottled = a3;
}

- (BOOL)hasCellularPolicy
{
  return self->_hasCellularPolicy;
}

- (void)setHasCellularPolicy:(BOOL)a3
{
  self->_hasCellularPolicy = a3;
}

- (BOOL)isOnWiFi
{
  return self->_isOnWiFi;
}

- (void)setIsOnWiFi:(BOOL)a3
{
  self->_isOnWiFi = a3;
}

- (BOOL)isOnInexpensiveCellular
{
  return self->_isOnInexpensiveCellular;
}

- (void)setIsOnInexpensiveCellular:(BOOL)a3
{
  self->_isOnInexpensiveCellular = a3;
}

- (unint64_t)estimatedSize
{
  return self->_estimatedSize;
}

- (void)setEstimatedSize:(unint64_t)a3
{
  self->_estimatedSize = a3;
}

@end
