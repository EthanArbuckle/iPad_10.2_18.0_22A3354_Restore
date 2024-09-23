@implementation NSBundle(WidgetKit)

+ (id)wk_uniqueWithURL:()WidgetKit
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend([a1 alloc], "_initUniqueWithURL:", v4);

  return v5;
}

@end
