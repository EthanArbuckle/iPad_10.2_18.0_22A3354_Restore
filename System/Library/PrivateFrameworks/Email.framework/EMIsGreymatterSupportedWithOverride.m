@implementation EMIsGreymatterSupportedWithOverride

void __EMIsGreymatterSupportedWithOverride_block_invoke()
{
  id v0;

  if ((EFIsRunningUnitTests() & 1) != 0
    || +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 48))
  {
    EMIsGreymatterSupportedWithOverride_isGreymatterSupported = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    EMIsGreymatterSupportedWithOverride_isGreymatterSupported = objc_msgSend(v0, "supportsGenerativeModelSystems");

  }
}

@end
