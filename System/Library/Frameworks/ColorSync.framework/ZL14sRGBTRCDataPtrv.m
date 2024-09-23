@implementation ZL14sRGBTRCDataPtrv

const UInt8 *___ZL14sRGBTRCDataPtrv_block_invoke()
{
  const ColorSyncProfile *v0;
  const UInt8 *result;

  v0 = ColorSyncProfileCreateWithName(kColorSyncSRGBProfile);
  sRGBTRCDataPtr(void)::sRGBTRCDataRef = (uint64_t)ColorSyncProfileCopyTag(v0, CFSTR("rTRC"));
  result = CFDataGetBytePtr((CFDataRef)sRGBTRCDataPtr(void)::sRGBTRCDataRef);
  sRGBTRCDataPtr(void)::ptr = (uint64_t)(result + 12);
  return result;
}

@end
