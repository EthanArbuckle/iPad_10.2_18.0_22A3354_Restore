@implementation NTKShowInternalWidgets

uint64_t __NTKShowInternalWidgets_block_invoke()
{
  const char *v0;

  v0 = (const char *)objc_msgSend(CFSTR("NTKShowInternalWidgetsChangedNotification"), "UTF8String");
  return notify_register_dispatch(v0, &NTKShowInternalWidgets_notifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_213);
}

void __NTKShowInternalWidgets_block_invoke_2()
{
  NTKShowInternalWidgets___needsUpdate = 0;
}

@end
