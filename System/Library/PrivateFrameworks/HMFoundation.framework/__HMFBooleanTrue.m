@implementation __HMFBooleanTrue

+ (id)new
{
  if (_MergedGlobals_78 != -1)
    dispatch_once(&_MergedGlobals_78, &__block_literal_global_49);
  return (id)qword_1ED013290;
}

- (BOOL)BOOLValue
{
  return 1;
}

@end
