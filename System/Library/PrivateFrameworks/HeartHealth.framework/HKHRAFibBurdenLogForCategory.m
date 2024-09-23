@implementation HKHRAFibBurdenLogForCategory

void __HKHRAFibBurdenLogForCategory_block_invoke()
{
  uint64_t i;
  const char *v1;
  os_log_t v2;
  void *v3;

  for (i = 0; i != 4; ++i)
  {
    v1 = "default";
    if ((unint64_t)(i - 1) <= 2)
      v1 = off_1E9C26308[i - 1];
    v2 = os_log_create((const char *)HKHRAFibBurdenLogSubsystem, v1);
    v3 = (void *)HKHRAFibBurdenLogForCategory_logObjects[i];
    HKHRAFibBurdenLogForCategory_logObjects[i] = v2;

  }
}

@end
