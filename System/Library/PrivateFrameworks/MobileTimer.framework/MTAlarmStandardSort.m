@implementation MTAlarmStandardSort

void __MTAlarmStandardSort_block_invoke()
{
  void *v0;

  v0 = (void *)MTAlarmStandardSort_comparator;
  MTAlarmStandardSort_comparator = (uint64_t)&__block_literal_global_29;

}

uint64_t __MTAlarmStandardSort_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
