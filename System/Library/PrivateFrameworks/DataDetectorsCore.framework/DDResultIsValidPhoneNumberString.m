@implementation DDResultIsValidPhoneNumberString

void __DDResultIsValidPhoneNumberString_block_invoke()
{
  BOOL v0;
  char v2;

  if (MEMORY[0x1E0D17820])
    v0 = MEMORY[0x1E0D17890] == 0;
  else
    v0 = 1;
  v2 = !v0 && MEMORY[0x1E0D17840] != 0;
  DDResultIsValidPhoneNumberString_frameworkAvailable = v2;
}

@end
