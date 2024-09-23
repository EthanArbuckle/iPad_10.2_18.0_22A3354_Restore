@implementation CGGetTempDirPath

size_t __CGGetTempDirPath_block_invoke()
{
  size_t result;

  result = confstr(65537, &CGGetTempDirPath_tempDirPath, 0x400uLL);
  if (!result)
    CGGetTempDirPath_tempDirPath = 0;
  return result;
}

@end
