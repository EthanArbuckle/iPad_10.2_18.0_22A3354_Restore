@implementation CALSDKVersionInit

uint64_t ___CALSDKVersionInit_block_invoke()
{
  uint64_t result;
  char v1;

  result = dyld_program_sdk_at_least();
  if ((result & 1) != 0)
  {
    v1 = 15;
  }
  else
  {
    result = dyld_program_sdk_at_least();
    if ((result & 1) != 0)
    {
      v1 = 14;
    }
    else
    {
      result = dyld_program_sdk_at_least();
      if ((result & 1) != 0)
      {
        v1 = 12;
      }
      else
      {
        result = dyld_program_sdk_at_least();
        if ((_DWORD)result)
          v1 = 8;
        else
          v1 = 0;
      }
    }
  }
  _CAL_sdk_version_mask = v1;
  return result;
}

@end
