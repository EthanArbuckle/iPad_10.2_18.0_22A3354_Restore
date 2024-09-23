@implementation DisplayP3ITU709

CFIndex __verify_DisplayP3ITU709_block_invoke()
{
  const ColorSyncProfile *v0;
  CFIndex result;

  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncDisplayP3_709OETFProfile);
  verify_DisplayP3ITU709_displayP3ITU709_profile_data = (uint64_t)ColorSyncProfileCopyData(v0, 0);
  result = CFDataGetLength((CFDataRef)verify_DisplayP3ITU709_displayP3ITU709_profile_data);
  verify_DisplayP3ITU709_displayP3ITU709_profile_data_length = result;
  return result;
}

@end
