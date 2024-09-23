@implementation C3DWasLinkedBeforeMajorOSYear2019

uint64_t __C3DWasLinkedBeforeMajorOSYear2019_block_invoke()
{
  uint64_t result;
  char v1;

  result = C3DPreferencesGetBool(12);
  if ((result & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    result = C3DPreferencesGetBool(16);
    if ((result & 1) != 0
      || (result = C3DPreferencesGetBool(15), (result & 1) != 0)
      || (result = C3DPreferencesGetBool(14), (result & 1) != 0))
    {
      v1 = 1;
    }
    else
    {
      result = dyld_program_sdk_at_least();
      v1 = result ^ 1;
    }
  }
  C3DWasLinkedBeforeMajorOSYear2019_linkedBeforeMajorOSYear2019 = v1;
  return result;
}

@end
