@implementation NSRegularExpression(Intents)

+ (id)_intents_sharedFormatRegularExpression
{
  if (_intents_sharedFormatRegularExpression_onceToken != -1)
    dispatch_once(&_intents_sharedFormatRegularExpression_onceToken, &__block_literal_global_90817);
  return (id)_intents_sharedFormatRegularExpression_regularExpression;
}

+ (id)_intents_sharedFunctionRegularExpression
{
  if (_intents_sharedFunctionRegularExpression_onceToken != -1)
    dispatch_once(&_intents_sharedFunctionRegularExpression_onceToken, &__block_literal_global_2);
  return (id)_intents_sharedFunctionRegularExpression_regularExpression;
}

+ (id)_intents_sharedOldFormatRegularExpression
{
  if (_intents_sharedOldFormatRegularExpression_onceToken != -1)
    dispatch_once(&_intents_sharedOldFormatRegularExpression_onceToken, &__block_literal_global_5_90812);
  return (id)_intents_sharedOldFormatRegularExpression_regularExpression;
}

+ (id)_intents_sharedStringsDictFormatRegularExpression
{
  if (_intents_sharedStringsDictFormatRegularExpression_onceToken != -1)
    dispatch_once(&_intents_sharedStringsDictFormatRegularExpression_onceToken, &__block_literal_global_8_90809);
  return (id)_intents_sharedStringsDictFormatRegularExpression_regularExpression;
}

@end
