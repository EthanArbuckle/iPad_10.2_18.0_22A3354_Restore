@implementation ZN2CIL15CI

const char *___ZN2CIL15CI_EXTENDED_PCSEv_block_invoke()
{
  const char *result;
  BOOL v1;
  char v2;

  result = getenv("CI_EXTENDED_PCS");
  if (result)
  {
    result = (const char *)atoi(result);
    v1 = (_DWORD)result == 0;
  }
  else
  {
    v1 = CI::CI_EXTENDED_PCS(void)::v == 0;
  }
  v2 = !v1;
  CI::CI_EXTENDED_PCS(void)::v = v2;
  return result;
}

@end
