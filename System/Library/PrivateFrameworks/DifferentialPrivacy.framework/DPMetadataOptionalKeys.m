@implementation DPMetadataOptionalKeys

void ___DPMetadataOptionalKeys_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("CountryCode");
  v2[1] = CFSTR("State");
  v2[2] = CFSTR("AlgorithmParameters");
  v2[3] = CFSTR("EnhancedDifferentialPrivacyParameters");
  v2[4] = CFSTR("AllowedDataTypes");
  v2[5] = CFSTR("DonationID");
  v2[6] = CFSTR("VDAF");
  v2[7] = CFSTR("DediscoTaskConfig");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DPMetadataOptionalKeys__DPMetadataOptionalKeys;
  _DPMetadataOptionalKeys__DPMetadataOptionalKeys = v0;

}

@end
