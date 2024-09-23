@implementation ZL35CreateMetadataFromXMPBufferInternalPKcmS0

const char *___ZL35CreateMetadataFromXMPBufferInternalPKcmS0_mj_block_invoke()
{
  const char *result;

  result = getenv("IIO_SkipExtendedXMP");
  if (result)
    result = (const char *)atoi(result);
  gIIO_SkipExtendedXMP = (int)result;
  return result;
}

@end
