@implementation NFDeviceIsA7

uint64_t __NFDeviceIsA7_block_invoke()
{
  uint64_t result;
  char v1;
  uint64_t v2;

  result = MGGetProductType();
  if (NFDeviceIsA7_result)
  {
    v1 = 1;
    goto LABEL_3;
  }
  v1 = 1;
  if (result <= 2048538370)
  {
    if (result <= 344862119)
    {
      if (result == 23433786)
        goto LABEL_3;
      v2 = 173258742;
    }
    else
    {
      if (result == 344862120 || result == 776033019)
        goto LABEL_3;
      v2 = 1701146937;
    }
  }
  else if (result > 3933982783)
  {
    if (result == 3933982784 || result == 4055323051)
      goto LABEL_3;
    v2 = 4232256925;
  }
  else
  {
    if (result == 2048538371 || result == 3637438250)
      goto LABEL_3;
    v2 = 3865922942;
  }
  if (result != v2)
    v1 = 0;
LABEL_3:
  NFDeviceIsA7_result = v1;
  return result;
}

@end
