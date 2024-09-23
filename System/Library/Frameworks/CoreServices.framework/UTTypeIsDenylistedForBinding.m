@implementation UTTypeIsDenylistedForBinding

void ___UTTypeIsDenylistedForBinding_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobileconfig");
  v3[1] = CFSTR("com.apple.mobileprovision");
  v3[2] = CFSTR("public.x509-certificate");
  v3[3] = CFSTR("com.rsa.pkcs-12");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_UTTypeIsDenylistedForBinding::denyListedTypes;
  _UTTypeIsDenylistedForBinding::denyListedTypes = v1;

}

@end
