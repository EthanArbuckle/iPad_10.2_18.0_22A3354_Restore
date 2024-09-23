@implementation NTKDebugSimulatedTombstoneExtensionBundleIdentifier

void __NTKDebugSimulatedTombstoneExtensionBundleIdentifier_block_invoke()
{
  CFPropertyListRef v0;
  void *v1;

  v0 = CFPreferencesCopyAppValue(CFSTR("SimulatedTombstoneExtensionBundleIdentifier"), CFSTR("com.apple.NanoTimeKit.face"));
  v1 = (void *)NTKDebugSimulatedTombstoneExtensionBundleIdentifier_identifier;
  NTKDebugSimulatedTombstoneExtensionBundleIdentifier_identifier = (uint64_t)v0;

}

@end
