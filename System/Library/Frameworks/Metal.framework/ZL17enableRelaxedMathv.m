@implementation ZL17enableRelaxedMathv

char *___ZL17enableRelaxedMathv_block_invoke()
{
  char *result;

  result = getenv("MTL_REPLACE_FAST_MATH_WITH_RELAXED_MATH");
  if (result)
  {
    if (*result == 49)
      enableRelaxedMath(void)::relaxedMathSet = 1;
  }
  return result;
}

@end
