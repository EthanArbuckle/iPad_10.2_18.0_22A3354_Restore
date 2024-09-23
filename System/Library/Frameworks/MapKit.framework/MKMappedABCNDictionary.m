@implementation MKMappedABCNDictionary

void __MKMappedABCNDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Street");
  v2[1] = CFSTR("City");
  v3[0] = CFSTR("street");
  v3[1] = CFSTR("city");
  v2[2] = CFSTR("State");
  v2[3] = CFSTR("ZIP");
  v3[2] = CFSTR("state");
  v3[3] = CFSTR("postalCode");
  v2[4] = CFSTR("Country");
  v2[5] = CFSTR("CountryCode");
  v3[4] = CFSTR("country");
  v3[5] = CFSTR("ISOCountryCode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_148;
  _MergedGlobals_148 = v0;

}

@end
