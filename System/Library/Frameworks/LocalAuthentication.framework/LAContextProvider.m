@implementation LAContextProvider

- (id)createContext
{
  return objc_alloc_init(LAContext);
}

@end
