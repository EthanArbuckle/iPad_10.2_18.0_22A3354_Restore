@implementation FigExternalStorageDeviceManager

uint64_t __FigExternalStorageDeviceManager_BeginMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __fedm_startMonitoringForExternalDevices_block_invoke;
  v3[3] = &__block_descriptor_40_e34_v24__0__NSDictionary_8__NSError_16l;
  v3[4] = v1;
  result = objc_msgSend(MEMORY[0x1E0CAACA8], "beginMonitoringProviderDomainChangesWithHandler:", v3);
  *(_QWORD *)(v1 + 24) = result;
  return result;
}

@end
