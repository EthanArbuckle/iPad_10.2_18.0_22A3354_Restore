@implementation CFPrefsGetPathForManagedBundleID

void ___CFPrefsGetPathForManagedBundleID_block_invoke()
{
  _CFPrefsGetPathForManagedBundleID_containingDirectoryPath = (uint64_t)CFSTR("/Library/Managed Preferences/");
}

CFURLRef ___CFPrefsGetPathForManagedBundleID_block_invoke_2()
{
  CFURLRef result;

  result = _CFPreferencesCopyManagedPreferencesContainerURL();
  _CFPrefsGetPathForManagedBundleID_containerizedContainingDirectoryURL = (uint64_t)result;
  return result;
}

uint64_t ___CFPrefsGetPathForManagedBundleID_block_invoke_3()
{
  uint64_t result;

  result = _CFPrefsCurrentProcessIsCFPrefsD();
  if ((_DWORD)result)
  {
    result = (uint64_t)CFCopyUserName();
    _CFPrefsGetPathForManagedBundleID_ourUserName = result;
  }
  return result;
}

@end
