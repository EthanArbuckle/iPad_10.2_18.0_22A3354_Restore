@implementation PHAssetExportRequestPassthroughConversionIsSupportedByType

void __PHAssetExportRequestPassthroughConversionIsSupportedByType_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEC698];
  v3[0] = *MEMORY[0x1E0CEC530];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0CEC5B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PHAssetExportRequestPassthroughConversionIsSupportedByType_typesSupportingPassThroughConversion;
  PHAssetExportRequestPassthroughConversionIsSupportedByType_typesSupportingPassThroughConversion = v1;

}

@end
