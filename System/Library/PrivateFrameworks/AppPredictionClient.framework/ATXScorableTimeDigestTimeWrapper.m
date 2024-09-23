@implementation ATXScorableTimeDigestTimeWrapper

- (ATXScorableTimeDigestTimeWrapper)initWithDigestTime:(int64_t)a3
{
  ATXScorableTimeDigestTimeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXScorableTimeDigestTimeWrapper;
  result = -[ATXScorableTimeDigestTimeWrapper init](&v5, sel_init);
  if (result)
    result->_digestTime = a3;
  return result;
}

- (NSString)scorableTimeIdentifier
{
  return (NSString *)ATXUserNotificationDigestDeliveryTimeToString(-[ATXScorableTimeDigestTimeWrapper digestTime](self, "digestTime"));
}

- (NSString)legacyScorableTimeIdentifier
{
  ATXScorableTimeATXModeWrapper *v2;
  void *v3;

  v2 = -[ATXScorableTimeATXModeWrapper initWithATXMode:]([ATXScorableTimeATXModeWrapper alloc], "initWithATXMode:", digestTimeToMode(-[ATXScorableTimeDigestTimeWrapper digestTime](self, "digestTime")));
  -[ATXScorableTimeATXModeWrapper scorableTimeIdentifier](v2, "scorableTimeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)digestTime
{
  return self->_digestTime;
}

@end
