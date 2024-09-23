@implementation ATXScorableTimeATXActivityTypeWrapper

- (ATXScorableTimeATXActivityTypeWrapper)initWithActivityType:(unint64_t)a3
{
  ATXScorableTimeATXActivityTypeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXScorableTimeATXActivityTypeWrapper;
  result = -[ATXScorableTimeATXActivityTypeWrapper init](&v5, sel_init);
  if (result)
    result->_activityType = a3;
  return result;
}

- (NSString)legacyScorableTimeIdentifier
{
  ATXScorableTimeATXModeWrapper *v2;
  void *v3;

  v2 = -[ATXScorableTimeATXModeWrapper initWithATXMode:]([ATXScorableTimeATXModeWrapper alloc], "initWithATXMode:", ATXModeFromActivityType(-[ATXScorableTimeATXActivityTypeWrapper activityType](self, "activityType")));
  -[ATXScorableTimeATXModeWrapper scorableTimeIdentifier](v2, "scorableTimeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)scorableTimeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ATXScorableTimeATXActivityTypeWrapper activityType](self, "activityType");
  ATXActivityTypeToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("activityType__%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

@end
