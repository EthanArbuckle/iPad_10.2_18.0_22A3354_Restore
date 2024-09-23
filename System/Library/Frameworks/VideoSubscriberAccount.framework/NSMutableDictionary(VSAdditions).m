@implementation NSMutableDictionary(VSAdditions)

- (void)vs_setObjectUnlessNil:()VSAdditions forKey:
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(a1, "setObject:forKey:", v6, a4);
    v6 = v7;
  }

}

@end
