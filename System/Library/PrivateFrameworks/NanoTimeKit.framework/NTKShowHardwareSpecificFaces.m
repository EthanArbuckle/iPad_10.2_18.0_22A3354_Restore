@implementation NTKShowHardwareSpecificFaces

uint64_t __NTKShowHardwareSpecificFaces_block_invoke()
{
  const char *v0;

  v0 = (const char *)objc_msgSend(CFSTR("NTKShowHardwareSpecificFacesChangedNotification"), "UTF8String");
  return notify_register_dispatch(v0, (int *)&NTKShowHardwareSpecificFaces_notifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_217);
}

void __NTKShowHardwareSpecificFaces_block_invoke_2()
{
  NTKShowHardwareSpecificFaces___needsUpdate = 0;
}

@end
