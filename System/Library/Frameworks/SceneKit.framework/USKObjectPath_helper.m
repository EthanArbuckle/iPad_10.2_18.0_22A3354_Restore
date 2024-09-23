@implementation USKObjectPath_helper

+ (id)objectPathWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)USKObjectPath_weak), "initWithString:", a3);
}

@end
