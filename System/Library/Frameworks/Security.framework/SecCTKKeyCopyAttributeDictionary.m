@implementation SecCTKKeyCopyAttributeDictionary

void __SecCTKKeyCopyAttributeDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[24];

  v2[23] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("class");
  v2[1] = CFSTR("tkid");
  v2[2] = CFSTR("kcls");
  v2[3] = CFSTR("accc");
  v2[4] = CFSTR("priv");
  v2[5] = CFSTR("modi");
  v2[6] = CFSTR("type");
  v2[7] = CFSTR("bsiz");
  v2[8] = CFSTR("esiz");
  v2[9] = CFSTR("sens");
  v2[10] = CFSTR("asen");
  v2[11] = CFSTR("extr");
  v2[12] = CFSTR("next");
  v2[13] = CFSTR("encr");
  v2[14] = CFSTR("decr");
  v2[15] = CFSTR("drve");
  v2[16] = CFSTR("sign");
  v2[17] = CFSTR("vrfy");
  v2[18] = CFSTR("snrc");
  v2[19] = CFSTR("vyrc");
  v2[20] = CFSTR("wrap");
  v2[21] = CFSTR("unwp");
  v2[22] = CFSTR("u_SystemKeychain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 23);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SecCTKKeyCopyAttributeDictionary_exportableAttributes;
  SecCTKKeyCopyAttributeDictionary_exportableAttributes = v0;

}

@end
