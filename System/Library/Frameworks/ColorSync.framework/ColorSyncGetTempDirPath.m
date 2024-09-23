@implementation ColorSyncGetTempDirPath

size_t __ColorSyncGetTempDirPath_block_invoke()
{
  size_t result;

  result = confstr(65537, &ColorSyncGetTempDirPath_tempDirPath, 0x400uLL);
  if (!result)
    ColorSyncGetTempDirPath_tempDirPath = 0;
  return result;
}

@end
