@implementation NSMutableString(CRKAdditions)

- (void)crk_deleteSuffix:()CRKAdditions
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a1, "hasSuffix:"))
    objc_msgSend(a1, "deleteCharactersInRange:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"), objc_msgSend(v4, "length"));

}

@end
