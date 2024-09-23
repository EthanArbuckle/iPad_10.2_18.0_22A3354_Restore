@implementation MPCMutablePlaybackDelegationProperties

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPCPlaybackDelegationProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPCPlaybackDelegationProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setDeviceGUID:(id)a3
{
  NSString *v4;
  NSString *deviceGUID;

  if (self->super._deviceGUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    deviceGUID = self->super._deviceGUID;
    self->super._deviceGUID = v4;

  }
}

- (void)setDeviceName:(id)a3
{
  NSString *v4;
  NSString *deviceName;

  if (self->super._deviceName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    deviceName = self->super._deviceName;
    self->super._deviceName = v4;

  }
}

- (void)setRequestUserAgent:(id)a3
{
  NSString *v4;
  NSString *requestUserAgent;

  if (self->super._requestUserAgent != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    requestUserAgent = self->super._requestUserAgent;
    self->super._requestUserAgent = v4;

  }
}

- (void)setSystemReleaseType:(int64_t)a3
{
  self->super._systemReleaseType = a3;
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;

  if (self->super._timeZone != a3)
  {
    v4 = (NSTimeZone *)objc_msgSend(a3, "copy");
    timeZone = self->super._timeZone;
    self->super._timeZone = v4;

  }
}

@end
