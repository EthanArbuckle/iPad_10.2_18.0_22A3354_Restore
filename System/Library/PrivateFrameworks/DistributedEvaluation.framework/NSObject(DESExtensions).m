@implementation NSObject(DESExtensions)

- (id)_fides_objectByReplacingValue:()DESExtensions withValue:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  if (objc_msgSend(a3, "isEqual:", a1))
    v7 = v6;
  else
    v7 = a1;
  v8 = v7;

  return v8;
}

@end
