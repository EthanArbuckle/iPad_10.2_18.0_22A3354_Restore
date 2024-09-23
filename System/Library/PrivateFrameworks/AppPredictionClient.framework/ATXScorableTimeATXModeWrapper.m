@implementation ATXScorableTimeATXModeWrapper

- (ATXScorableTimeATXModeWrapper)initWithATXMode:(unint64_t)a3
{
  ATXScorableTimeATXModeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXScorableTimeATXModeWrapper;
  result = -[ATXScorableTimeATXModeWrapper init](&v5, sel_init);
  if (result)
    result->_atxMode = a3;
  return result;
}

- (NSString)scorableTimeIdentifier
{
  return (NSString *)ATXModeToString(-[ATXScorableTimeATXModeWrapper atxMode](self, "atxMode"));
}

- (unint64_t)atxMode
{
  return self->_atxMode;
}

@end
