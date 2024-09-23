@implementation NSLocale(IconServicesAdditions)

+ (uint64_t)_IS_currentLanguageDirection
{
  if (_IS_currentLanguageDirection_onceToken != -1)
    dispatch_once(&_IS_currentLanguageDirection_onceToken, &__block_literal_global_32);
  return _IS_currentLanguageDirection_direction;
}

@end
