@implementation NTKAlwaysGenerateSnapshots

uint64_t __NTKAlwaysGenerateSnapshots_block_invoke()
{
  const char *v0;

  v0 = (const char *)objc_msgSend(CFSTR("NTKAlwaysGenerateSnapshotsChangedNotification"), "UTF8String");
  return notify_register_dispatch(v0, &NTKAlwaysGenerateSnapshots_notifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_221);
}

void __NTKAlwaysGenerateSnapshots_block_invoke_2()
{
  NTKAlwaysGenerateSnapshots___needsUpdate = 0;
}

@end
