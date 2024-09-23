@implementation NSAttributedString(SharedHelper)

+ (id)emptyAttributedStringOfLength_emk:()SharedHelper
{
  void *v4;
  void *v5;

  objc_msgSend(&stru_1EA258D60, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend([a1 alloc], "initWithString:", v4);

  return v5;
}

@end
