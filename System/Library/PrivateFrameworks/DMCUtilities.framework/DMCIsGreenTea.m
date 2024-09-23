@implementation DMCIsGreenTea

void __DMCIsGreenTea_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  mach_port_name_t MatchingService;
  unsigned int v3;
  char v4;
  char v5;
  id v6;

  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOServiceMatching("AppleBaseband");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  v3 = MatchingService - 1;
  if (MatchingService - 1 <= 0xFFFFFFFD)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], MatchingService);
  +[DMCMobileGestalt regionCode](DMCMobileGestalt, "regionCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("CH"));
  if (v3 < 0xFFFFFFFE)
    v5 = v4;
  else
    v5 = 0;
  DMCIsGreenTea_isGreenTea = v5;

}

@end
