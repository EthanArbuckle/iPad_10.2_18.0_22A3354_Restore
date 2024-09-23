@implementation ComponentButtonHome

- (BOOL)isPresent
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentButtonBase buttonsDetected](self, "buttonsDetected"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("menu"));

  return v3;
}

@end
