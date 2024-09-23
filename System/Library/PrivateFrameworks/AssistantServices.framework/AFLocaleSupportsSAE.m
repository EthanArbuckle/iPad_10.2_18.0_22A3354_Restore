@implementation AFLocaleSupportsSAE

void __AFLocaleSupportsSAE_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en-US"), CFSTR("en-GB"), CFSTR("en-CA"), CFSTR("en-AU"), CFSTR("en-IE"), CFSTR("en-NZ"), CFSTR("en-ZA"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFLocaleSupportsSAE_supportedLocales;
  AFLocaleSupportsSAE_supportedLocales = v0;

}

@end
