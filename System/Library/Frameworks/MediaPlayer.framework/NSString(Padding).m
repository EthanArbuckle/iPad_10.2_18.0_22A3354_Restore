@implementation NSString(Padding)

- (id)stringByLeftPaddingToLength:()Padding withString:startingAtIndex:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(&stru_1E3163D10, "stringByPaddingToLength:withString:startingAtIndex:", a3 - objc_msgSend(a1, "length"), v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingString:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
