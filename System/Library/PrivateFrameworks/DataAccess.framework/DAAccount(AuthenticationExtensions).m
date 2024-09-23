@implementation DAAccount(AuthenticationExtensions)

+ (id)_leafAccountTypes
{
  if (_leafAccountTypes_onceToken != -1)
    dispatch_once(&_leafAccountTypes_onceToken, &__block_literal_global_471);
  return (id)_leafAccountTypes__sLeafAccountTypes;
}

@end
