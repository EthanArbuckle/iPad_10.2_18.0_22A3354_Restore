@implementation PARSession(FCAddition)

+ (id)fc_sharedParsecSession
{
  if (_MergedGlobals_179 != -1)
    dispatch_once(&_MergedGlobals_179, &__block_literal_global_101);
  return (id)qword_1ED0F8480;
}

@end
