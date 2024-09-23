@implementation USKToken_helper

+ (id)tokenWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)USKToken_weak), "initWithString:", a3);
}

@end
