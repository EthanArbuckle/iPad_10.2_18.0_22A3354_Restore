@implementation DKRestrictionsProvider

- (BOOL)isPreserveESIMOnEraseEnforced
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPreserveESIMOnEraseEnforced");

  return v3;
}

@end
