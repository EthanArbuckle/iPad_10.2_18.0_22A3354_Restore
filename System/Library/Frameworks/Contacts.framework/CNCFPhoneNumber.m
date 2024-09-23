@implementation CNCFPhoneNumber

- (__CFPhoneNumber)create:(id)a3 :(id)a4
{
  return (__CFPhoneNumber *)CFPhoneNumberCreate();
}

+ (id)makeProxy
{
  return objc_alloc_init((Class)a1);
}

@end
