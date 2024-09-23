@implementation ISIsResourceKey

void __ISIsResourceKey_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("kISPrimaryResourceKey");
  v4[1] = CFSTR("kISPrimaryDarkResourceKey");
  v4[2] = CFSTR("kISBackgroundResourceKey");
  v4[3] = CFSTR("kISTintColorResourceKey");
  v4[4] = CFSTR("kISTextResourceKey");
  v4[5] = CFSTR("kISBadgeResourceKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ISIsResourceKey_resourceKeys;
  ISIsResourceKey_resourceKeys = v2;

}

@end
