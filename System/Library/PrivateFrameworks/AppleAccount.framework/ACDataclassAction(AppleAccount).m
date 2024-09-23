@implementation ACDataclassAction(AppleAccount)

- (BOOL)isSafeForAutoEnablement
{
  return objc_msgSend(a1, "type") != 5 && objc_msgSend(a1, "type") != 6;
}

@end
