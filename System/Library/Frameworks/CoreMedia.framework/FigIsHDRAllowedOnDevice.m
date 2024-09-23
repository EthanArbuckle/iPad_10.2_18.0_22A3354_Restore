@implementation FigIsHDRAllowedOnDevice

uint64_t __FigIsHDRAllowedOnDevice_block_invoke()
{
  char v0;
  char v1;
  uint64_t result;
  uint64_t v3;

  v0 = MGGetBoolAnswer();
  v1 = 0;
  result = MGGetProductType();
  if (result <= 2614323574)
  {
    if (result <= 896202453)
    {
      if (result == 42878382 || result == 228444038)
        goto LABEL_24;
      v3 = 337183581;
    }
    else if (result > 1878257789)
    {
      if (result == 1878257790)
        goto LABEL_24;
      v3 = 2385671069;
    }
    else
    {
      if (result == 896202454)
        goto LABEL_24;
      v3 = 1380747801;
    }
  }
  else if (result > 3397214290)
  {
    if (result > 3645319984)
    {
      if (result == 3645319985)
        goto LABEL_24;
      v3 = 4242862982;
    }
    else
    {
      if (result == 3397214291)
        goto LABEL_24;
      v3 = 3402870384;
    }
  }
  else if (result > 3196805750)
  {
    if (result == 3196805751)
      goto LABEL_24;
    v3 = 3215673114;
  }
  else
  {
    if (result == 2614323575)
      goto LABEL_24;
    v3 = 2781508713;
  }
  if (result != v3)
    v1 = v0;
LABEL_24:
  FigIsHDRAllowedOnDevice_sIsHDRAllowedOnDevice = v1;
  return result;
}

@end
