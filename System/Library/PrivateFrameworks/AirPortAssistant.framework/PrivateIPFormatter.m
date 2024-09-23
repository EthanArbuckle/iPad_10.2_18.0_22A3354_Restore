@implementation PrivateIPFormatter

+ (id)privateIPFormatter
{
  PrivateIPFormatter *v2;
  const char *v3;

  v2 = [PrivateIPFormatter alloc];
  return (id)objc_msgSend_initWithMin_max_(v2, v3, 1, 254);
}

@end
