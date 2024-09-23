@implementation NSDateComponentsFormatter

uint64_t __74__NSDateComponentsFormatter_HealthUI__hk_fullStyleDateComponentsFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)hk_fullStyleDateComponentsFormatter___dateComponentsFormatter;
  hk_fullStyleDateComponentsFormatter___dateComponentsFormatter = (uint64_t)v0;

  return objc_msgSend((id)hk_fullStyleDateComponentsFormatter___dateComponentsFormatter, "setUnitsStyle:", 3);
}

@end
