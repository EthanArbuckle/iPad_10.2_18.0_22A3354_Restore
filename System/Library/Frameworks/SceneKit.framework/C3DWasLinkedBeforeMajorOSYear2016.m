@implementation C3DWasLinkedBeforeMajorOSYear2016

uint64_t __C3DWasLinkedBeforeMajorOSYear2016_block_invoke()
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
    result = dyld_program_sdk_at_least();
    v1 = result ^ 1;
  }
  C3DWasLinkedBeforeMajorOSYear2016_linkedBeforeMajorOSYear2016 = v1;
  return result;
}

@end
