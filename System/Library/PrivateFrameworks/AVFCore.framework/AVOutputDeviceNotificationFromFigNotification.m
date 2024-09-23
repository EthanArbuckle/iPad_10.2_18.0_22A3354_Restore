@implementation AVOutputDeviceNotificationFromFigNotification

uint64_t __AVOutputDeviceNotificationFromFigNotification_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("AVOutputDeviceScreenBecameAvailableNotification"), *MEMORY[0x1E0CA3830], CFSTR("AVOutputDeviceScreenBecameUnavailableNotification"), *MEMORY[0x1E0CA3838], CFSTR("AVOutputDeviceOwnsTurnByTurnNavigationChangedNotification"), *MEMORY[0x1E0CA3848], CFSTR("AVOutputDeviceiOSEntityHasMainAudioNotification"), *MEMORY[0x1E0CA3840], CFSTR("AVOutputDeviceVehicleHasMainAudioNotification"), *MEMORY[0x1E0CA3828], CFSTR("AVOutputDeviceNightModeChangedNotification"), *MEMORY[0x1E0CA3B78], CFSTR("AVOutputDevicePerformanceReportPostedNotification"), *MEMORY[0x1E0CA3B80], CFSTR("AVOutputDeviceMFiCertificateSerialNumberChangedNotification"), *MEMORY[0x1E0CA3AF8], CFSTR("AVOutputDeviceCarPlayTestNotification"),
             *MEMORY[0x1E0CA3B18],
             CFSTR("AVOutputDeviceiOSUIRequestedNotification"),
             *MEMORY[0x1E0CA3BD0],
             CFSTR("AVOutputDeviceSiriRequestedNotification"),
             *MEMORY[0x1E0CA3B90],
             CFSTR("AVOutputDeviceLimitedUIChangedNotification"),
             *MEMORY[0x1E0CA3B68],
             CFSTR("AVOutputDeviceUnhandledRemoteEventNotification"),
             *MEMORY[0x1E0CA3BA0],
             CFSTR("AVOutputDeviceVoiceTriggerModeChangedNotification"),
             *MEMORY[0x1E0CA3708],
             0);
  AVOutputDeviceNotificationFromFigNotification_figToAVFNotificationMapping = result;
  return result;
}

@end
