@implementation NumericalLocalizedTimeScope

uint64_t ___NumericalLocalizedTimeScope_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_NumericalLocalizedTimeScope_numericalTimeScopeFormatter;
  _NumericalLocalizedTimeScope_numericalTimeScopeFormatter = (uint64_t)v0;

  return objc_msgSend((id)_NumericalLocalizedTimeScope_numericalTimeScopeFormatter, "setNumberStyle:", 0);
}

@end
