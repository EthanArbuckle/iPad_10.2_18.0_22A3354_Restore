@implementation CMPhotoAllowExperimentalCodecsOverride

uint64_t __CMPhotoAllowExperimentalCodecsOverride_block_invoke(uint64_t result)
{
  CMPhotoAllowExperimentalCodecsOverride_sAllowSlimCodec = *(_BYTE *)(result + 32);
  return result;
}

@end
