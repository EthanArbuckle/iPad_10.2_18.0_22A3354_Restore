@implementation NSMutableArray(FCAdditions_NSString)

- (void)fc_safelyAddStringIfNonNilAndNotZeroLength:()FCAdditions_NSString
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a1, "addObject:", v4);

}

@end
