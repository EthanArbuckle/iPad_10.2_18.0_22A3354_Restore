@implementation SCNMetalLanguageVersion

uint64_t __SCNMetalLanguageVersion_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = C3DWasLinkedBeforeMajorOSYear2019();
  if ((result & 1) != 0)
  {
    v1 = 0x20000;
  }
  else
  {
    v1 = 131073;
    result = C3DWasLinkedBeforeMajorOSYear2020();
    if ((result & 1) == 0)
    {
      result = C3DWasLinkedBeforeMajorOSYear2021();
      if ((_DWORD)result)
        v1 = 131075;
      else
        v1 = 0x20000;
    }
  }
  SCNMetalLanguageVersion_languageVersion = v1;
  return result;
}

@end
