@implementation CoreVideo709

CFIndex __verify_CoreVideo709_block_invoke()
{
  const ColorSyncProfile *v0;
  const ColorSyncProfile *v1;
  CFIndex result;

  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncCoreVideo709Profile);
  v1 = ColorSyncProfileCreateWithName(CFSTR("com.apple.ColorSync.CoreVideoLegacy709"));
  verify_CoreVideo709_corevideo709_profile_data = (uint64_t)ColorSyncProfileCopyData(v0, 0);
  verify_CoreVideo709_corevideo709_profile_data_length = CFDataGetLength((CFDataRef)verify_CoreVideo709_corevideo709_profile_data);
  verify_CoreVideo709_corevideo709_legacy_profile_data = (uint64_t)ColorSyncProfileCopyData(v1, 0);
  result = CFDataGetLength((CFDataRef)verify_CoreVideo709_corevideo709_legacy_profile_data);
  verify_CoreVideo709_corevideo709_legacy_profile_data_length = result;
  return result;
}

@end
