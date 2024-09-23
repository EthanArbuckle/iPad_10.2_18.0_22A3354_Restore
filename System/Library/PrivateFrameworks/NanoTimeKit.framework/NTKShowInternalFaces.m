@implementation NTKShowInternalFaces

uint64_t __NTKShowInternalFaces_block_invoke()
{
  const char *v0;

  v0 = (const char *)objc_msgSend(CFSTR("NTKShowInternalFacesChangedNotification"), "UTF8String");
  return notify_register_dispatch(v0, &NTKShowInternalFaces_notifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_209);
}

void __NTKShowInternalFaces_block_invoke_2()
{
  NTKShowInternalFaces___needsUpdate = 0;
}

@end
