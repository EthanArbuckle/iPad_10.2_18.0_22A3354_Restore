@implementation IDSDevice(SMSRelay_Convenience)

- (BOOL)isWatch
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "modelIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("Watch")) != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end
