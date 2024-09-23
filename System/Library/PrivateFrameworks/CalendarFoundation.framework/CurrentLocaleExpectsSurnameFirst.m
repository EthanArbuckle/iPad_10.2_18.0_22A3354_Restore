@implementation CurrentLocaleExpectsSurnameFirst

void __CurrentLocaleExpectsSurnameFirst_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CN"), CFSTR("JP"), CFSTR("KP"), CFSTR("KR"), CFSTR("VN"), CFSTR("HU"), 0);
  v1 = (void *)CurrentLocaleExpectsSurnameFirst_sSurnameFirstCountries;
  CurrentLocaleExpectsSurnameFirst_sSurnameFirstCountries = v0;

}

@end
