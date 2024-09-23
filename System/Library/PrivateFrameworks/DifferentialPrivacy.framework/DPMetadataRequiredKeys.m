@implementation DPMetadataRequiredKeys

void ___DPMetadataRequiredKeys_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VersionHash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DPMetadataRequiredKeys__DPMetadataRequiredKeys;
  _DPMetadataRequiredKeys__DPMetadataRequiredKeys = v0;

}

@end
