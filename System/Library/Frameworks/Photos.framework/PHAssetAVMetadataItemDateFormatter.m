@implementation PHAssetAVMetadataItemDateFormatter

uint64_t __PHAssetAVMetadataItemDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)PHAssetAVMetadataItemDateFormatter_dateFormatter;
  PHAssetAVMetadataItemDateFormatter_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)PHAssetAVMetadataItemDateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

@end
