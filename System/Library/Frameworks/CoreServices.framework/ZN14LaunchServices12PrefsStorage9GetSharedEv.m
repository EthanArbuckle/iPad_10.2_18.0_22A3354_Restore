@implementation ZN14LaunchServices12PrefsStorage9GetSharedEv

LaunchServices::PrefsStorage *___ZN14LaunchServices12PrefsStorage9GetSharedEv_block_invoke()
{
  LaunchServices::PrefsStorage *v0;
  LaunchServices::PrefsStorage *result;

  v0 = (LaunchServices::PrefsStorage *)operator new();
  result = LaunchServices::PrefsStorage::PrefsStorage(v0);
  LaunchServices::PrefsStorage::GetShared(void)::result = (uint64_t)v0;
  return result;
}

@end
