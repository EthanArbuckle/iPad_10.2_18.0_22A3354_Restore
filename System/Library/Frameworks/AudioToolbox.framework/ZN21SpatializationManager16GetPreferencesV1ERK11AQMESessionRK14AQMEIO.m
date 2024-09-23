@implementation ZN21SpatializationManager16GetPreferencesV1ERK11AQMESessionRK14AQMEIO

_QWORD *___ZN21SpatializationManager16GetPreferencesV1ERK11AQMESessionRK14AQMEIO_Binding20SpatialContentTypeIDR23SpatialAudioPreferencesbb_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  BOOL *v4;
  BOOL *v5;

  CASmartPreferences::Read((CASmartPreferences *)CFSTR("device_can_spatialize"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gForceDeviceCanSpatialize, a4);
  CASmartPreferences::Read((CASmartPreferences *)CFSTR("disable_spatialization"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gForceDisableSpatialization, v4);
  return CASmartPreferences::Read((CASmartPreferences *)CFSTR("spatialize_untracked"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gSpatializeUntracked, v5);
}

@end
