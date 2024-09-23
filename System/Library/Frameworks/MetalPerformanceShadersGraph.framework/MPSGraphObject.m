@implementation MPSGraphObject

+ (void)initialize
{
  if (__mpsGraphLazyInit(void)::once != -1)
    dispatch_once_f(&__mpsGraphLazyInit(void)::once, 0, (dispatch_function_t)static_init);
}

@end
