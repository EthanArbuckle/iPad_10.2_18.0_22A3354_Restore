@implementation FSFontProviderSynchronizeFontAsset

uint64_t __FSFontProviderSynchronizeFontAsset_block_invoke(uint64_t result, char a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (a3)
    return GSFontSetupForUserInstalledFonts();
  return result;
}

@end
