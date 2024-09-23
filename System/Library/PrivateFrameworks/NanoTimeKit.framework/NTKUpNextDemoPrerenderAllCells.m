@implementation NTKUpNextDemoPrerenderAllCells

uint64_t __NTKUpNextDemoPrerenderAllCells_block_invoke()
{
  uint64_t result;
  char v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("UpNextPrerenderAllCards"), CFSTR("com.apple.NanoTimeKit.face"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = result;
  else
    v1 = 0;
  NTKUpNextDemoPrerenderAllCells_prerenderAllCells = v1;
  return result;
}

@end
